import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class GlassTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const GlassTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  State<GlassTextFieldWidget> createState() => _GlassTextFieldWidgetState();
}

class _GlassTextFieldWidgetState extends State<GlassTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      borderRadius: 100,
      height: 60,
      child: Center(
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          style: TextStyle(color: BeeStyle.lightWhite, fontSize: 12),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: BeeStyle.lightWhite, fontSize: 12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
