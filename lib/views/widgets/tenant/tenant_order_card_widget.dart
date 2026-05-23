import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/tenant/order_status_chip.dart';

class TenantOrderCardWidget extends StatefulWidget {
  final Payment order;
  final VoidCallback onStatusUpdated;

  const TenantOrderCardWidget({
    super.key,
    required this.order,
    required this.onStatusUpdated,
  });

  @override
  State<TenantOrderCardWidget> createState() => _TenantOrderCardWidgetState();
}

class _TenantOrderCardWidgetState extends State<TenantOrderCardWidget> {
  Future updateStatus(String status) async {
    try {
      await PaymentService.updatePaymentStatus(widget.order.paymentId, status);
      widget.onStatusUpdated();
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: () async => await updateStatus(status),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            "${widget.order.user!.name}'s Order",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Column(
            spacing: 8,
            children: widget.order.orders!
                .map(
                  (item) => Row(
                    spacing: 16,
                    children: [
                      Text("${item.quantity}x"),
                      Image.network(item.menu.menuImage, width: 40, height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.menu.menuName,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            item.notes ?? "No Notes",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                .toList(),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,
            children: [
              Expanded(
                child: Text(
                  "Order ID: ${widget.order.paymentId}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              widget.order.status == "pending"
                  ? Row(
                      spacing: 16,
                      children: [
                        OrderStatusChip(
                          fillColor: BeeStyle.red,
                          text: "Reject",
                          onTap: () async => updateStatus("cancelled"),
                        ),
                        OrderStatusChip(
                          fillColor: BeeStyle.green,
                          text: "Accept",
                          onTap: () async => await updateStatus("processing"),
                        ),
                      ],
                    )
                  : OrderStatusChip(
                      fillColor: BeeStyle.green,
                      text: "Finish Order",
                      onTap: () async => updateStatus("completed"),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
