import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/widgets/glass_card_widget.dart';
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
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserSearchBarWidget(),

              Text("All", textAlign: TextAlign.left),

              GlassCardWidget(
                height: 150,
                dark: true,
                child: Row(children: [Text("Hello")]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
