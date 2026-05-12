import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card_widget.dart';

class ItemQuantityButton extends StatelessWidget {
  final int quantity;
  const ItemQuantityButton({
    super.key,
    required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      padding: EdgeInsetsGeometry.only(left: 3, right: 3),
      dark: true,
      width: 110,
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, size: 18),
            onPressed: () {
          
            },
          ),
          Text(
            quantity.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, size: 18),
            onPressed: () {
            },
          ),
        ],
      )
    );
  }
}