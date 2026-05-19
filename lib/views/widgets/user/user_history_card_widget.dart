import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/views/pages/user/user_history_detail.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:intl/intl.dart';

class UserHistoryCardWidget extends StatelessWidget {
  final Payment payment;

  const UserHistoryCardWidget({super.key, required this.payment});

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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserHistoryDetail(payment: payment),
          ),
        );
      },
      child: Row(
        spacing: 16,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(payment.tenant!.tenantLogo),
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.tenant!.tenantName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Container(
                    color: getStatusColor(payment.status),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                    child: Row(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(getStatusIcon(payment.status), size: 16),
                        Text(
                          toBeginningOfSentenceCase(payment.status),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            spacing: 8,
            children: [
              Text(
                DateFormat("d MMMM y").format(payment.createdAt),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
              Text(
                currencyNotifier.value.format(payment.totalPrice),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
