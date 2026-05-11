import 'package:flutter/material.dart';
import 'package:frontend/widgets/glass_card_widget.dart';

class TenantFoodItem extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final VoidCallback? onAddTap;

  const TenantFoodItem({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GlassCardWidget(
            padding: const EdgeInsets.all(5),
            dark: true,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GlassCardWidget(
                    dark: true,
                    height: 40,
                    width: 40,
                    borderRadius: 1000,
                    padding: EdgeInsetsGeometry.all(0),
                    onTap: onAddTap,
                    child: Center(
                      child: Icon(Icons.add, color: Colors.black, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Text(name, style: const TextStyle(fontSize: 14)),

        Text(
          price,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
