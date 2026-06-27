import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';

class OrderStatusChip extends StatefulWidget {
  final AsyncCallback? onTap;
  final Color fillColor;
  final String text;

  const OrderStatusChip({
    super.key,
    this.onTap,
    required this.fillColor,
    required this.text,
  });

  @override
  State<OrderStatusChip> createState() => _OrderStatusChipState();
}

class _OrderStatusChipState extends State<OrderStatusChip> {
  bool isLoading = false;
  void onClick() async {
    if (widget.onTap == null || isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      await widget.onTap!();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      fillColor: widget.fillColor,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 4),
      onTap: widget.onTap != null ? onClick : null,
      child: isLoading
          ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator())
          : Text(
              widget.text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withValues(alpha: 0.75),
              ),
            ),
    );
  }
}
