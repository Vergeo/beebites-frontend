import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/views/pages/user/user_cart_page.dart';
import 'package:frontend/views/pages/user/user_history.dart';
import 'package:frontend/views/pages/user/user_home_page.dart';
import 'package:frontend/views/pages/user/user_profile.dart';
import 'package:frontend/views/widgets/user/user_navbar_widget.dart';

class UserWidgetTree extends StatefulWidget {
  const UserWidgetTree({super.key});

  @override
  State<UserWidgetTree> createState() => _UserWidgetTreeState();
}

class _UserWidgetTreeState extends State<UserWidgetTree> {
  List pages = [UserHomePage(), UserCartPage(), UserHistory(), UserProfile()];
  List pageTitles = ["Home", "Cart", "History", "Profile"];

  @override
  void initState() {
    super.initState();
    CartService.getCartFromUser(currentUserNotifier.value!.userId);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          backgroundColor: BeeStyle.white,
          body: SafeArea(child: pages[selectedPage]),
          bottomNavigationBar: UserNavbarWidget(),
        );
      },
    );
  }
}
