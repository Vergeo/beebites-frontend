import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/glass_text_field_widget.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 428,
      child: Column(
        spacing: 32,
        children: [
          // GlassTextFieldWidget(hintText: "Full Name"),
          // GlassTextFieldWidget(hintText: "Email"),
          // GlassTextFieldWidget(hintText: "Password"),
          // GlassTextFieldWidget(hintText: "Confirm Password"),
          GlassContainerWidget(
            width: double.infinity,
            borderRadius: 100,
            height: 60,
            dark: true,
            onTap: () {},
            child: Center(
              child: Text(
                "Register",
                style: TextStyle(color: BeeStyle.lightWhite),
              ),
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Login")),
        ],
      ),
    );
  }
}
