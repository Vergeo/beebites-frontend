import 'package:flutter/material.dart';
import 'package:frontend/models/tenant.dart';
import 'package:frontend/services/tenant_service.dart';
import 'package:frontend/views/pages/user/tenant_details.dart';
import 'package:frontend/views/widgets/user/tenant_card.dart';

class TenantList extends StatefulWidget {
  final String filter;

  const TenantList({super.key, required this.filter});

  @override
  State<TenantList> createState() => _TenantListState();
}

class _TenantListState extends State<TenantList> {
  List<Tenant>? tenants;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadTenants();
  }

  @override
  void didUpdateWidget(covariant TenantList oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadTenants();
  }

  void loadTenants() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      var data;
      if (widget.filter.isEmpty) {
        data = await TenantService.getAllTenants();
      } else {
        data = await TenantService.searchTenant(widget.filter);
      }

      setState(() {
        tenants = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadTenants,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    if (errorMessage != null && tenants == null) {
      return Center(child: Text("$errorMessage"));
    }
    return Column(
      spacing: 16.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${tenants!.length} Tenants", textAlign: TextAlign.left),
        Column(
          spacing: 16.0,
          children: tenants!.map((tenant) {
            return TenantCard(
              tenant: tenant,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TenantDetails(tenantId: tenant.tenantId),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
