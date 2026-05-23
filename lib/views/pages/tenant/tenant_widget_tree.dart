import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/pages/tenant/tenant_history_page.dart';
import 'package:frontend/views/pages/tenant/tenant_order_page.dart';
import 'package:frontend/views/pages/tenant/tenant_product_page.dart';
import 'package:frontend/views/pages/tenant/tenant_profile_page.dart';
import 'package:frontend/views/widgets/tenant/tenant_navbar_widget.dart';

class TenantWidgetTree extends StatefulWidget {
  const TenantWidgetTree({super.key});

  @override
  State<TenantWidgetTree> createState() => _TenantWidgetTreeState();
}

class _TenantWidgetTreeState extends State<TenantWidgetTree> {
  List pages = [
    TenantOrderPage(),
    TenantHistoryPage(),
    TenantProductPage(),
    TenantProfilePage(),
  ];
  List pageTitles = ["Orders", "History", "Product", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          backgroundColor: BeeStyle.white,
          body: SafeArea(child: pages[selectedPage]),
          bottomNavigationBar: TenantNavbarWidget(),
        );
      },
    );
  }
}
