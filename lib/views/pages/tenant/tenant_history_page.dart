import 'package:flutter/material.dart';
import 'package:frontend/viewmodels/tenant/history_list.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantHistoryPage extends StatefulWidget {
  const TenantHistoryPage({super.key});

  @override
  State<TenantHistoryPage> createState() => _TenantHistoryPageState();
}

class _TenantHistoryPageState extends State<TenantHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text("History", style: TextStyle(fontSize: 24)),
          // Text("March, 7th 2026"),
          // TenantHistoryCard(),
          HistoryList(),
        ],
      ),
    );
  }
}
