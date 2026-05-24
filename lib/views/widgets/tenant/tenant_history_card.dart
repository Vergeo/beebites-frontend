import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/views/pages/tenant/tenant_history_detail_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/tenant/order_status_chip.dart';

class TenantHistoryCard extends StatefulWidget {
  final Payment order;

  const TenantHistoryCard({super.key, required this.order});

  @override
  State<TenantHistoryCard> createState() => _TenantHistoryCardState();
}

class _TenantHistoryCardState extends State<TenantHistoryCard> {
  int quantity = 0;
  @override
  void initState() {
    super.initState();
    for (var order in widget.order.orders!) {
      setState(() {
        quantity += order.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => TenantHistoryDetailPage(order: widget.order),
          ),
        );
      },
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "${widget.order.user!.name}'s Order",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              widget.order.status == "completed"
                  ? OrderStatusChip(
                      fillColor: BeeStyle.green,
                      text: "Completed",
                    )
                  : OrderStatusChip(fillColor: BeeStyle.red, text: "Cancelled"),
            ],
          ),
          Row(
            children: [
              // Expanded(child: Text("${widget.order.user!.userId}'s Order")),
              Expanded(child: Text("$quantity item(s)")),
              Text(
                currencyNotifier.value.format(widget.order.totalPrice),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Order ID: ${widget.order.paymentId}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              Text(
                dateNotifier.value.format(
                  widget.order.createdAt.toLocal().add(Duration(hours: 7)),
                ),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
