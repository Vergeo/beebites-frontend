import 'package:flutter/material.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/tenant/tenant_order_card_widget.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Payment> newOrders = [];
  List<Payment> currentOrders = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  void loadOrders() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final List<Payment> data = await PaymentService.getAllPaymentsByTenant(
        1, // change this
      );

      final newOrdersTemp = data
          .where((order) => order.status == "pending")
          .toList();
      final currentOrdersTemp = data
          .where((order) => order.status == "processing")
          .toList();

      newOrdersTemp.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      currentOrdersTemp.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      setState(() {
        isLoading = false;
        newOrders = newOrdersTemp;
        currentOrders = currentOrdersTemp;
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
              onPressed: loadOrders,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    if (errorMessage != null) {
      return Center(child: Text("$errorMessage"));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          "New Orders (${newOrders.length})",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Column(
          spacing: 16,
          children: newOrders
              .map(
                (order) => TenantOrderCardWidget(
                  order: order,
                  onStatusUpdated: loadOrders,
                ),
              )
              .toList(),
        ),
        Text(
          "Current Orders (${currentOrders.length})",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Column(
          spacing: 16,
          children: currentOrders
              .map(
                (order) => TenantOrderCardWidget(
                  order: order,
                  onStatusUpdated: loadOrders,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
