import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';

class ScrollablePageWidget extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;

  const ScrollablePageWidget({
    super.key,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: child,
          ),
        ),
      ),
    );
  }
}
