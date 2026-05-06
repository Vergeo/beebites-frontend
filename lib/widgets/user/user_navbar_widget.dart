import 'package:flutter/material.dart';
import 'package:frontend/data/notifiers.dart';

class UserNavbarWidget extends StatefulWidget {
  const UserNavbarWidget({super.key});

  @override
  State<UserNavbarWidget> createState() => _UserNavbarWidgetState();
}

class _UserNavbarWidgetState extends State<UserNavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            NavigationDestination(icon: Icon(Icons.history), label: "History"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (index) => setState(() {
            selectedPageNotifier.value = index;
          }),
        );
      },
    );
  }
}
