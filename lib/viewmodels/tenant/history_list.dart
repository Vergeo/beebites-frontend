import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/tenant/tenant_history_card.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<Payment> completedOrders = [];
  List<Payment> canceledOrders = [];

  List<Widget> completedWidgets = [];
  List<Widget> canceledWidgets = [];

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
        currentTenantNotifier.value!.tenantId,
      );

      final completedOrdersTemp = data
          .where((order) => order.status == "completed")
          .toList();
      final canceledOrdersTemp = data
          .where((order) => order.status == "cancelled")
          .toList();

      completedOrdersTemp.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      DateTime now = DateTime.fromMillisecondsSinceEpoch(0);
      for (var payment in completedOrdersTemp) {
        if (!DateUtils.isSameDay(payment.createdAt.toLocal(), now.toLocal())) {
          completedWidgets.add(
            Text(DateFormat("d MMMM y").format(payment.createdAt.toLocal())),
          );
        }
        completedWidgets.add(TenantHistoryCard(order: payment));
        now = payment.createdAt.toLocal().add(Duration(hours: 7));
      }

      canceledOrdersTemp.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      now = DateTime.fromMillisecondsSinceEpoch(0);
      for (var payment in canceledOrdersTemp) {
        if (!DateUtils.isSameDay(payment.createdAt.toLocal(), now.toLocal())) {
          canceledWidgets.add(
            Text(DateFormat("d MMMM y").format(payment.createdAt.toLocal())),
          );
        }
        canceledWidgets.add(TenantHistoryCard(order: payment));
        now = payment.createdAt.toLocal().add(Duration(hours: 7));
      }
      setState(() {
        isLoading = false;
        completedOrders = completedOrdersTemp;
        canceledOrders = canceledOrdersTemp;
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
          "Completed Orders (${completedOrders.length})",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: completedWidgets,
          // children: completedOrders
          //     .map((order) => TenantHistoryCard(order: order))
          //     .toList(),
        ),
        Text(
          "Canceled Orders (${canceledOrders.length})",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: canceledWidgets,
          // children: canceledOrders
          //     .map((order) => TenantHistoryCard(order: order))
          //     .toList(),
        ),
      ],
    );
  }
}
