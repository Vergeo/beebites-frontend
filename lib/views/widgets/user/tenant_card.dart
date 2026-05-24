import 'package:flutter/material.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/services/payment_service.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class TenantCard extends StatefulWidget {
  final VoidCallback? onTap;
  final Tenant tenant;
  const TenantCard({super.key, this.onTap, required this.tenant});

  @override
  State<TenantCard> createState() => _TenantCardState();
}

class _TenantCardState extends State<TenantCard> {
  int queueTime = 0;

  @override
  void initState() {
    super.initState();
    getQueueTime();
  }

  void getQueueTime() async {
    try {
      List<Payment> payments = await PaymentService.getAllPaymentsByTenant(
        widget.tenant.tenantId,
      );

      int count = 0;

      for (var payment in payments) {
        if (payment.status == "processing") {
          count += 1;
        }
      }

      setState(() {
        queueTime = 5 + count * 2;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      onTap: widget.onTap,
      child: Row(
        spacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.tenant.tenantLogo,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.tenant.tenantName, style: TextStyle(fontSize: 20)),
                Text(
                  widget.tenant.tenantDescription,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.access_time_sharp, size: 16),
              const SizedBox(width: 4),
              Text(
                "$queueTime min",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
