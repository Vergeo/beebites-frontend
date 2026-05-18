import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassCardWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height;
  final double borderRadius;
  final double border;
  final double blur;
  final EdgeInsetsGeometry padding;
  final bool dark;
  final VoidCallback? onTap;

  const GlassCardWidget({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height,
    this.borderRadius = 20,
    this.border = 1,
    this.blur = 15,
    this.padding = const EdgeInsets.all(20),
    this.dark = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: GlassmorphicContainer(
        width: width,
        height: height,
        borderRadius: borderRadius,
        blur: blur,
        alignment: null,
        border: border,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? [
                  Colors.white.withValues(alpha: 0.7),
                  Colors.white.withValues(alpha: 0.5),
                ]
              : [
                  Colors.white.withValues(alpha: 0.15),
                  Colors.white.withValues(alpha: 0.17),
                ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? [
                  Colors.grey.withValues(alpha: 0.5),
                  Colors.grey.withValues(alpha: 0.4),
                ]
              : [
                  Colors.white.withValues(alpha: 0.5),
                  Colors.white.withValues(alpha: 0.2),
                ],
        ),

        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: Padding(padding: padding, child: child),
            ),

            if (onTap != null)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(borderRadius),
                    onTap: onTap,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
