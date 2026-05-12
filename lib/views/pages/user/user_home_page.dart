import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/viewmodels/user/tenant_list.dart';
import 'package:frontend/views/widgets/user/user_search_bar_widget.dart';

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
            TenantList(filter: ""),
          ],
        ),
      ),
    );
  }
}
