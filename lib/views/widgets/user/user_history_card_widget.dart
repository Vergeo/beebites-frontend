import 'package:flutter/material.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class UserHistoryCardWidget extends StatelessWidget {
  final Payment payment;

  const UserHistoryCardWidget({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(payment.tenant!.tenantLogo),
          ),
          Expanded(
            child: Column(
              children: [
                Text(payment.tenant!.tenantName),
                Text(payment.status),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "${payment.createdAt.toLocal().day.toString()} ${payment.createdAt.toLocal().month.toString()} ${payment.createdAt.toLocal().year.toString()}",
              ),
              Text(payment.totalPrice.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
