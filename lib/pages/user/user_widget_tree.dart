import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/data/notifiers.dart';
import 'package:frontend/pages/user/user_history.dart';
import 'package:frontend/pages/user/user_home_page.dart';
import 'package:frontend/pages/user/user_profile.dart';
import 'package:frontend/widgets/user/user_navbar_widget.dart';

class UserWidgetTree extends StatefulWidget {
  const UserWidgetTree({super.key});

  @override
  State<UserWidgetTree> createState() => _UserWidgetTreeState();
}

class _UserWidgetTreeState extends State<UserWidgetTree> {
  List pages = [UserHomePage(), Text("Cart"), UserHistory(), UserProfile()];
  List pageTitles = ["Home", "Cart", "History", "Profile"];

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
          bottomNavigationBar: UserNavbarWidget(),
        );
      },
    );
  }
}
