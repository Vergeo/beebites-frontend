import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/tenant/tenant_order_card_widget.dart';

class TenantOrderPage extends StatefulWidget {
  const TenantOrderPage({super.key,});

  @override
  State<TenantOrderPage> createState() => _TenantOrderPageState();
}

class _TenantOrderPageState extends State<TenantOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Next Order (1)"),
            TenantOrderCardWidget(itemName: "Yishonaya", notes: "Nothing", orderId: 0001),
            Text("Upcoming Orders (0)")

          ],
        ),
      ),
    );
  }
}