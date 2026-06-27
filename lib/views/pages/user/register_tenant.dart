import 'package:flutter/material.dart';
import 'package:frontend/viewmodels/user/new_tenant.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class RegisterTenant extends StatefulWidget {
  const RegisterTenant({super.key});

  @override
  State<RegisterTenant> createState() => _RegisterTenantState();
}

class _RegisterTenantState extends State<RegisterTenant> {
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
              Text("Create New Tenant", style: TextStyle(fontSize: 24)),
            ],
          ),
          NewTenant(),
        ],
      ),
    );
  }
}
