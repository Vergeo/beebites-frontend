import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/order.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/order_service.dart';
import 'package:frontend/services/payment_service.dart';
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
    getQueueTime();
  }

  int queueTime = 0;
  int counter = 0;

  void getQueueTime() async {
    try {
      List<Payment> payments = await PaymentService.getAllPaymentsByTenant(
        widget.payment.tenantId,
      );

      int count = 0;

      for (var e in payments) {
        if (e.status == "processing" &&
            e.createdAt.isBefore(widget.payment.createdAt)) {
          count += 1;
        }
      }

      setState(() {
        counter = count;
        queueTime = 5 + count * 2;
      });
    } catch (error) {
      print(error);
    }
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
        return BeeStyle.yellow;
      case 'completed':
        return BeeStyle.green;
      case 'cancelled':
        return BeeStyle.red;
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.payment.status == "processing")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Your Queue", style: TextStyle(fontSize: 20)),
                    ),
                    Text("Estimated Time", style: TextStyle(fontSize: 20)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${counter + 1}",
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    Text("$queueTime minutes", style: TextStyle(fontSize: 24)),
                  ],
                ),
              ],
            ),
          GlassContainerWidget(
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
                        Text(
                          dateNotifier.value.format(
                            widget.payment.createdAt.toLocal().add(
                              Duration(hours: 7),
                            ),
                          ),
                        ),
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
                                Icon(
                                  getStatusIcon(widget.payment.status),
                                  size: 16,
                                ),
                                Text(
                                  toBeginningOfSentenceCase(
                                    widget.payment.status,
                                  ),
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
                          currencyNotifier.value.format(
                            widget.payment.totalPrice,
                          ),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
