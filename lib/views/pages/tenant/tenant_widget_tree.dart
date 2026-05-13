import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/widgets/tenant/tenant_navbar_widget.dart';

class TenantWidgetTree extends StatefulWidget {
  const TenantWidgetTree({super.key});

  @override
  State<TenantWidgetTree> createState() => _TenantWidgetTreeState();
}

class _TenantWidgetTreeState extends State<TenantWidgetTree> {
  List pages = [Text("Orders"), Text("History"), Text("Profile")];
  List pageTitles = ["Orders", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          body: Container(
            color: BeeStyle.white,
            padding: EdgeInsetsGeometry.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: pages[selectedPage],
          ),
          bottomNavigationBar: TenantNavbarWidget(),
        );
      },
    );
  }
}