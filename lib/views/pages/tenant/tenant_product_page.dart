import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/viewmodels/tenant/menu_list.dart';
import 'package:frontend/views/pages/tenant/tenant_edit_item_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantProductPage extends StatefulWidget {
  const TenantProductPage({super.key});

  @override
  State<TenantProductPage> createState() => _TenantProductPageState();
}

class _TenantProductPageState extends State<TenantProductPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      floatingActionButton: GlassContainerWidget(
        borderRadius: 100,
        child: Icon(Icons.add),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => TenantEditItemPage()),
          );
        },
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text("Your Products", style: TextStyle(fontSize: 24)),
          MenuList(tenantId: currentTenantNotifier.value!.tenantId),
        ],
      ),
    );
  }
}
