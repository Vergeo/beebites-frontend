import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/viewmodels/tenant/edit_item.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantEditItemPage extends StatefulWidget {
  final Menu? menu;
  const TenantEditItemPage({super.key, this.menu});

  @override
  State<TenantEditItemPage> createState() => _TenantEditItemPageState();
}

class _TenantEditItemPageState extends State<TenantEditItemPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                widget.menu != null ? "Edit Item" : "Create Item",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          EditItem(menu: widget.menu),
        ],
      ),
    );
  }
}
