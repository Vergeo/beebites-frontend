import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class UserSearchBar extends StatefulWidget {
  const UserSearchBar({super.key});

  @override
  State<UserSearchBar> createState() => _UserSearchBarState();
}

class _UserSearchBarState extends State<UserSearchBar> {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      height: 50,
      border: 1,
      blur: 50,
      child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "Search Tenant",
            hintStyle: TextStyle(color: Colors.black38),
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
    );
  }
}