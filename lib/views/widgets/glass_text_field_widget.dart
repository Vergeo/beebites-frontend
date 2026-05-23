import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class GlassTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Color hintTextColor;
  final TextStyle style;
  final TextEditingController controller;
  final bool obscureText;
  final double height;
  const GlassTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.hintTextColor = BeeStyle.lightWhite,
    this.height = 60,
    this.style = const TextStyle(color: BeeStyle.lightWhite, fontSize: 12),
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
      height: widget.height,
      child: Center(
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          style: widget.style,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintTextColor, fontSize: 12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
