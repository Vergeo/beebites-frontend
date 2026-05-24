import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/viewmodels/user/menu_list.dart';
import 'package:frontend/viewmodels/user/tenant_detail_header.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';
import 'package:frontend/views/widgets/user/user_search_bar_widget.dart';

class TenantDetails extends StatefulWidget {
  final int tenantId;

  const TenantDetails({super.key, required this.tenantId});

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  final menuSearchController = TextEditingController();
  String keyword = "";

  @override
  void dispose() {
    super.dispose();
    menuSearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 16,
              children: [
                TenantDetailHeader(tenantId: widget.tenantId),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: GlassTextFieldWidget(
                        height: 50,
                        controller: menuSearchController,
                        hintText: "Search Menu",
                        hintTextColor: BeeStyle.gray,
                        style: TextStyle(color: BeeStyle.black),
                      ),
                    ),
                    GlassContainerWidget(
                      borderRadius: 100,
                      padding: EdgeInsetsGeometry.all(8),
                      height: 50,
                      width: 50,
                      onTap: () => {
                        setState(() {
                          keyword = menuSearchController.text.trim();
                        }),
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
                MenuList(tenantId: widget.tenantId, filter: keyword),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
