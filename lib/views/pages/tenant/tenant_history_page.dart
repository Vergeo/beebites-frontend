import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/tenant/tenant_history_card.dart';

class TenantHistoryPage extends StatefulWidget {
  const TenantHistoryPage({super.key});

  @override
  State<TenantHistoryPage> createState() => _TenantHistoryPageState();
}

class _TenantHistoryPageState extends State<TenantHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text("History", style: TextStyle(fontSize: 24),),
            Text("March, 7th 2026"),
            TenantHistoryCard(quantity: 2,)
          ],
        ),
      ),
    );
  }
}