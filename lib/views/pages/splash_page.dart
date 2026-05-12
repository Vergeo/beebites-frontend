import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/views/pages/login_register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginRegisterPage()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.blue,
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("assets/images/beebites_white.png"),
        ),
      ),
    );
  }
}
