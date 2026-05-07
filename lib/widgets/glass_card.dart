import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double border;
  final double blur;
  final EdgeInsetsGeometry padding;
  
  const GlassCard({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height = 1,
    this.borderRadius = 20,
    this.border = 1,
    this.blur = 15,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
  return GlassmorphicContainer(
    width: width,
    height: height,
    borderRadius: borderRadius,
    blur: blur,
    alignment: null,
    border: border,
    linearGradient: LinearGradient(
      colors: [
        Colors.white.withValues(alpha: 0.1), 
        Colors.white.withValues(alpha: 0.1)
      ],
    ),
    borderGradient: LinearGradient(
      colors: [
        Colors.black.withValues(alpha: 0.25), 
        Colors.black.withValues(alpha: 0.2)
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: Padding(
        padding: padding, 
        child: child
      ),
    ),
  );
}
}