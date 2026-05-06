import 'package:flutter/material.dart';
import 'package:frontend/data/notifiers.dart';
import 'package:frontend/widgets/user/user_navbar_widget.dart';

class UserWidgetTree extends StatefulWidget {
  const UserWidgetTree({super.key});

  @override
  State<UserWidgetTree> createState() => _UserWidgetTreeState();
}

class _UserWidgetTreeState extends State<UserWidgetTree> {
  List pages = [Text("Home"), Text("Cart"), Text("History"), Text("Profile")];
  List pageTitles = ["Home", "Cart", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(title: Text(pageTitles[selectedPage])),
          body: pages[selectedPage],
          bottomNavigationBar: UserNavbarWidget(),
        );
      },
    );
  }
}
