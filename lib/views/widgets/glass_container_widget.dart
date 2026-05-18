import 'package:flutter/material.dart';

class GlassContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow> boxShadows;
  final VoidCallback? onTap;
  final Widget? child;
  final bool dark;

  const GlassContainerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 16.0,
    this.fillColor = const Color.fromRGBO(255, 255, 255, 0.2),
    this.strokeColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.strokeWidth = 1,
    this.padding = const EdgeInsets.all(16),
    this.boxShadows = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        blurRadius: 4,
        spreadRadius: 0,
        offset: Offset(0, 0),
      ),
    ],
    this.onTap,
    this.child,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(borderRadius);

    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _OuterShadowPainter(
          borderRadius: borderRadius,
          boxShadows: boxShadows,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: dark ? Color.fromRGBO(26, 26, 26, 0.1) : fillColor,
            borderRadius: BorderRadius.all(radius),
            border: Border.all(color: strokeColor, width: strokeWidth),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(radius),
              onTap: onTap,
              child: Padding(padding: padding, child: child),
            ),
          ),
        ),
      ),
    );
  }
}

class _OuterShadowPainter extends CustomPainter {
  final double borderRadius;
  final List<BoxShadow> boxShadows;

  _OuterShadowPainter({required this.borderRadius, required this.boxShadows});

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    final Path innerPath = Path()..addRRect(rrect);

    final Path outerPath = Path()
      ..addRect(Rect.fromLTWH(-100, -100, size.width + 200, size.height + 200));

    final Path clipPath = Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );

    for (var shadow in boxShadows) {
      final Paint shadowPaint = shadow.toPaint();

      canvas.save();
      canvas.clipPath(clipPath);

      final Path shadowPath = Path()..addRRect(rrect.shift(shadow.offset));
      canvas.drawPath(shadowPath, shadowPaint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _OuterShadowPainter oldDelegate) {
    return oldDelegate.borderRadius != borderRadius ||
        oldDelegate.boxShadows != boxShadows;
  }
}
