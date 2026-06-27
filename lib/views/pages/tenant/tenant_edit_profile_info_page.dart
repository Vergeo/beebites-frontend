import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/viewmodels/tenant/edit_tenant.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantEditProfileInfoPage extends StatefulWidget {
  const TenantEditProfileInfoPage({super.key});

  @override
  State<TenantEditProfileInfoPage> createState() =>
      _TenantEditProfileInfoPageState();
}

class _TenantEditProfileInfoPageState extends State<TenantEditProfileInfoPage> {
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
              Text("Edit Tenant Info", style: TextStyle(fontSize: 24)),
            ],
          ),
          EditTenant(tenant: currentTenantNotifier.value!),
        ],
      ),
    );
  }
}
