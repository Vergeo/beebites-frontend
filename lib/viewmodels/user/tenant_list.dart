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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TenantService.getAllTenants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          List<Tenant> tenants = snapshot.data;

          return Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${tenants.length} Tenants", textAlign: TextAlign.left),
              Column(
                spacing: 16.0,
                children: tenants.map((tenant) {
                  return TenantCard(
                    tenantName: tenant.tenantName,
                    tenantLogo: tenant.tenantLogo,
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
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: Text("Something went wrong. Please try again!"));
      },
    );
  }
}
