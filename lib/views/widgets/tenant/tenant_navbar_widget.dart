import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';

class TenantNavbarWidget extends StatefulWidget {
  const TenantNavbarWidget({super.key});

  @override
  State<TenantNavbarWidget> createState() => _TenantNavbarWidgetState();
}

class _TenantNavbarWidgetState extends State<TenantNavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warehouse_rounded),
              label: "Product",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: selectedPage,

          onTap: (index) => setState(() {
            selectedPageNotifier.value = index;
          }),
          unselectedItemColor: BeeStyle.lightWhite,
          selectedItemColor: BeeStyle.orange,
          type: BottomNavigationBarType.fixed,
          backgroundColor: BeeStyle.blue,
        );
      },
    );
  }
}
