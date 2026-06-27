import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class UserSearchBarWidget extends StatefulWidget {
  final String hintText;
  const UserSearchBarWidget({super.key, required this.hintText});

  @override
  State<UserSearchBarWidget> createState() => _UserSearchBarWidgetState();
}

class _UserSearchBarWidgetState extends State<UserSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      padding: EdgeInsetsGeometry.all(1),
      height: 50,
      dark: true,
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(Icons.search, color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
