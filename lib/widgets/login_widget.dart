import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        TextField(),
        ElevatedButton(onPressed: () {}, child: Text("Login")),
      ],
    );
  }
}
