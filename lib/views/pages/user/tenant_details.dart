import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/viewmodels/user/menu_list.dart';
import 'package:frontend/viewmodels/user/tenant_detail_header.dart';
import 'package:frontend/views/widgets/user/user_search_bar_widget.dart';

class TenantDetails extends StatefulWidget {
  final int tenantId;

  const TenantDetails({super.key, required this.tenantId});

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: Container(
        padding: EdgeInsetsGeometry.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        color: BeeStyle.white,
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              TenantDetailHeader(tenantId: widget.tenantId),
              UserSearchBarWidget(hintText: "Search Menu"),
              MenuList(tenantId: widget.tenantId),
            ],
          ),
        ),
      ),
    );
  }
}
