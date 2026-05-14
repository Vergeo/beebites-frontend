import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';

class TenantFoodItem extends StatelessWidget {
  final Menu menu;

  const TenantFoodItem({super.key, required this.menu});

  Widget buildAddButton() {
    return GlassCardWidget(
      dark: true,
      height: 40,
      width: 40,
      borderRadius: 1000,
      padding: EdgeInsetsGeometry.all(0),
      onTap: () => CartService.addMenuToCart(1, menu.menuId, 1, ""),
      child: Center(child: Icon(Icons.add, color: Colors.black, size: 20)),
    );
  }

  Widget buildCounter() {
    return GlassCardWidget(
      dark: true,
      height: 100,
      width: 40,
      borderRadius: 1000,
      padding: EdgeInsetsGeometry.all(0),
      child: Row(
        children: [
          Center(child: Text("2")),
          Icon(Icons.add, color: Colors.black, size: 20),
          Center(child: Text("3")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartNotifier,
      builder: (context, cart, child) {
        final isInCart = cart.any((item) => item.menuId == menu.menuId);
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
                      child: Image.asset(menu.menuImage, fit: BoxFit.contain),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: buildAddButton(),
                    ),
                  ],
                ),
              ),
            ),

            Text(menu.menuName, style: const TextStyle(fontSize: 14)),

            Text(
              "${menu.menuPrice}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        );
      },
    );
  }
}
