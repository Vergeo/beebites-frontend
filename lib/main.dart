import 'package:flutter/material.dart';
import 'package:frontend/pages/splash_page.dart';
import 'package:frontend/pages/user/user_widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeeBites',
      theme: ThemeData(fontFamily: "Poppins"),
      home: const UserWidgetTree(),
    );
  }
}
