import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/viewmodels/user/tenant_detail_header.dart';

class TenantOrderPage extends StatefulWidget {
  final int tenantId;
  const TenantOrderPage({super.key, required this.tenantId});

  @override
  State<TenantOrderPage> createState() => _TenantOrderPageState();
}

class _TenantOrderPageState extends State<TenantOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: Column(
        children: [
          TenantDetailHeader(tenantId: widget.tenantId)
        ],
      ),
    );
  }
}