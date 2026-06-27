import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/payment.dart';
import 'package:frontend/views/widgets/tenant/tenant_history_detail_card.dart';

class TenantHistoryDetailPage extends StatefulWidget {
  final Payment order;

  const TenantHistoryDetailPage({super.key, required this.order});

  @override
  State<TenantHistoryDetailPage> createState() =>
      _TenantHistoryDetailPageState();
}

class _TenantHistoryDetailPageState extends State<TenantHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      BackButton(onPressed: () => Navigator.pop(context)),
                      const Text(
                        "Transaction Summary",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: false,
                child: TenantHistoryDetailCard(order: widget.order),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
