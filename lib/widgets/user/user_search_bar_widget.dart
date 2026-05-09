import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card_widget.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class UserSearchBarWidget extends StatefulWidget {
  const UserSearchBarWidget({super.key});

  @override
  State<UserSearchBarWidget> createState() => _UserSearchBarWidgetState();
}

class _UserSearchBarWidgetState extends State<UserSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      height: 50,
      dark: true,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          //   hintText: "Search Tenant",
          //   hintStyle: TextStyle(color: Colors.black38),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          // border: InputBorder.none,
          //   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
