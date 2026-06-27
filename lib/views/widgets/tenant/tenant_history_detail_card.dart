import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/tenant/order_status_chip.dart';

class TenantHistoryDetailCard extends StatelessWidget {
  final Payment order;

  const TenantHistoryDetailCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        GlassContainerWidget(
          child: Column(
            spacing: 8,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${order.user!.name}'s Order",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  order.status == "completed"
                      ? OrderStatusChip(
                          fillColor: BeeStyle.green,
                          text: "Completed",
                        )
                      : OrderStatusChip(
                          fillColor: BeeStyle.red,
                          text: "Cancelled",
                        ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Order ID: ${order.paymentId}")),
                  Text(
                    dateNotifier.value.format(
                      order.createdAt.toLocal().add(Duration(hours: 7)),
                    ),
                  ),
                  // Text(dateNotifier.value.format(order.createdAt.toLocal())),
                ],
              ),
            ],
          ),
        ),

        Text("Order Summary"),

        GlassContainerWidget(
          child: Column(
            spacing: 8,
            children: order.orders!
                .map(
                  (item) => Row(
                    spacing: 16,
                    children: [
                      Text("${item.quantity}x", style: TextStyle(fontSize: 12)),
                      Image.network(item.menu.menuImage, width: 40, height: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.menu.menuName,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              item.notes ?? "No Notes",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        currencyNotifier.value.format(
                          item.quantity * item.menu.menuPrice,
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),

        const Spacer(),

        GlassContainerWidget(
          child: Row(
            children: [
              Expanded(child: Text("Total")),
              Text(
                currencyNotifier.value.format(order.totalPrice),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
