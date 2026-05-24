import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/tenant_service.dart';
import 'package:frontend/views/pages/login_register_page.dart';
import 'package:frontend/views/pages/tenant/tenant_edit_profile_info_page.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/scrollable_page_widget.dart';

class TenantProfilePage extends StatefulWidget {
  const TenantProfilePage({super.key});

  @override
  State<TenantProfilePage> createState() => _TenantProfilePageState();
}

class _TenantProfilePageState extends State<TenantProfilePage> {
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadTenant();
  }

  void loadTenant() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await TenantService.getTenant(
        currentTenantNotifier.value!.tenantId,
      );
      currentTenantNotifier.value = data;
      setState(() {
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
              onPressed: loadTenant,
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
    if (errorMessage != null) {
      return Center(child: Text("$errorMessage"));
    }
    return ScrollablePageWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text("Your Tenant", style: TextStyle(fontSize: 24)),
          ValueListenableBuilder(
            valueListenable: currentTenantNotifier,
            builder: (context, tenant, child) {
              return Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 200,
                          backgroundImage: NetworkImage(tenant!.tenantLogo),
                        ),
                      ),
                      Text(
                        tenant.tenantName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(tenant.tenantDescription),
                  Text(
                    "Operational Hours",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text("${tenant.tenantOpenTime} - ${tenant.tenantCloseTime}"),
                ],
              );
            },
          ),
          GlassContainerWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const TenantEditProfileInfoPage(),
                ),
              );
            },
            child: Text("Update Tenant Info"),
          ),
          GlassContainerWidget(
            fillColor: BeeStyle.red,
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const LoginRegisterPage(),
                ),
              ),
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
