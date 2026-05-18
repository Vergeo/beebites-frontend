import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
// import 'package:glassmorphism/glassmorphism.dart'; //

class GlassTextFieldWidget extends StatefulWidget {
  final String hintText;
  const GlassTextFieldWidget({super.key, required this.hintText});

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
          style: TextStyle(color: BeeStyle.lightWhite),
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
