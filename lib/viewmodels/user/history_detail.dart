import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/order.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/order_service.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:intl/intl.dart';

class HistoryDetail extends StatefulWidget {
  final Payment payment;

  const HistoryDetail({super.key, required this.payment});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  List<Order> orders = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadOrderDetails();
  }

  void loadOrderDetails() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await OrderService.getOrders(widget.payment.paymentId);

      setState(() {
        orders = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadOrderDetails,
            ),
          ),
        );
      }
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return const Color.fromARGB(100, 255, 226, 157);
      case 'completed':
        return const Color.fromARGB(75, 175, 255, 157);
      case 'cancelled':
        return const Color.fromARGB(75, 255, 157, 157);
      default:
        return Colors.grey.withValues(alpha: 0.3);
    }
  }

  IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle_outline;
      case 'cancelled':
        return Icons.highlight_off;
      case 'in process':
      default:
        return Icons.timelapse_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      width: double.infinity,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transaction Detail",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Tenant")),
                  Text(widget.payment.tenant!.tenantName),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Transaction ID")),
                  Text("${widget.payment.paymentId}"),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Date")),
                  Text(DateFormat("d MMMM y").format(widget.payment.createdAt)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Payment Method")),
                  Text(widget.payment.paymentType),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Status")),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Container(
                      color: getStatusColor(widget.payment.status),
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 16,
                      ),
                      child: Row(
                        spacing: 4,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(getStatusIcon(widget.payment.status), size: 16),
                          Text(
                            toBeginningOfSentenceCase(widget.payment.status),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "Order Details",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          Column(
            children: [
              Column(
                children: orders.map((order) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(order.quantity.toString()),
                      ),
                      Expanded(child: Text(order.menu.menuName)),
                      Text(
                        currencyNotifier.value.format(
                          order.quantity * order.menu.menuPrice,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    currencyNotifier.value.format(widget.payment.totalPrice),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
