import 'package:flutter/material.dart';
import 'package:frontend/viewmodels/tenant/order_list.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantOrderPage extends StatefulWidget {
  const TenantOrderPage({super.key});

  @override
  State<TenantOrderPage> createState() => _TenantOrderPageState();
}

class _TenantOrderPageState extends State<TenantOrderPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Orders", style: TextStyle(fontSize: 24)),
          OrderList(),
        ],
      ),
    );
  }
}
