import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
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
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
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
