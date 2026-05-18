import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/cart_service.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/user/item_quantity_button.dart';

class TenantFoodItem extends StatefulWidget {
  final Menu menu;

  const TenantFoodItem({super.key, required this.menu});

  @override
  State<TenantFoodItem> createState() => _TenantFoodItemState();
}

class _TenantFoodItemState extends State<TenantFoodItem> {
  Widget buildAddButton() {
    return GlassCardWidget(
      dark: true,
      height: 40,
      width: 40,
      borderRadius: 1000,
      padding: EdgeInsetsGeometry.all(0),
      onTap: () => {
        CartService.addMenuToCart(
          1,
          widget.menu.menuId,
          1,
          widget.menu.tenantId,
          "",
        ),
      },
      child: Center(child: Icon(Icons.add, color: Colors.black, size: 20)),
    );
  }

  Widget buildCounter(Cart item) {
    return ItemQuantityButton(item: item);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartNotifier,
      builder: (context, cart, child) {
        final index = cart.indexWhere(
          (item) => item.menuId == widget.menu.menuId,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GlassContainerWidget(
                padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.network(
                          widget.menu.menuImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: (index == -1)
                          ? buildAddButton()
                          : buildCounter(cart[index]),
                    ),
                  ],
                ),
              ),
            ),

            Text(widget.menu.menuName, style: const TextStyle(fontSize: 14)),

            Text(
              "${widget.menu.menuPrice}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        );
      },
    );
  }
}
