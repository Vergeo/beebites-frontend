import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:animated_toggle/animated_toggle.dart';
import 'package:frontend/views/widgets/login_widget.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedHorizontalToggle(
                taps: ["Login", "Register"],
                radius: 200,
                activeButtonRadius: 200,
                width: 300,
                height: 50,
                duration: Duration(milliseconds: 50),
              ),
              LoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
