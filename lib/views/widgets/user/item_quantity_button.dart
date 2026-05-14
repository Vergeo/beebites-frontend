import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';

class ItemQuantityButton extends StatefulWidget {
  final Cart item;
  const ItemQuantityButton({super.key, required this.item});

  @override
  State<ItemQuantityButton> createState() => _ItemQuantityButtonState();
}

class _ItemQuantityButtonState extends State<ItemQuantityButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartNotifier,
      builder: (context, cart, child) {
        final currentItem = cart.firstWhere(
          (item) => item.menuId == widget.item.menuId,
        );
        return GlassCardWidget(
          padding: EdgeInsetsGeometry.all(0),
          dark: true,
          width: 110,
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.remove, size: 16),
                onPressed: () =>
                    CartService.addMenuToCart(1, widget.item.menuId, -1, ""),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    currentItem.quantity.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.add, size: 16),
                onPressed: () =>
                    CartService.addMenuToCart(1, widget.item.menuId, 1, ""),
              ),
            ],
          ),
        );
      },
    );
  }
}
