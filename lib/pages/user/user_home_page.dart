import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/pages/user/tenant_details.dart';
import 'package:frontend/widgets/user/tenant_cart.dart';
import 'package:frontend/widgets/user/user_search_bar_widget.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, User", style: TextStyle(fontSize: 24)),
                Text("Ready when you are.", style: TextStyle(fontSize: 24)),
              ],
            ),
            UserSearchBarWidget(hintText: "Search Tenant"),

            Text("All (10)", textAlign: TextAlign.left),

            TenantCart(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const TenantDetails(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
