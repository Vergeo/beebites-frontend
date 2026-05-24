import 'package:flutter/material.dart';
import 'package:frontend/models/bee_style.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:frontend/views/widgets/glass_container_widget.dart';
import 'package:frontend/views/widgets/user/item_quantity_button.dart';

class UserCartItem extends StatelessWidget {
  final Cart cart;

  const UserCartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return GlassContainerWidget(
      padding: EdgeInsetsGeometry.all(8),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(cart.menu.menuImage, width: 70, height: 70),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.menu.menuName,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      "Add Note",
                      style: TextStyle(
                        fontSize: 8,
                        color: BeeStyle.gray,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.edit, size: 12, color: BeeStyle.gray),
                  ],
                ),
                // Row(
                //   children: [
                //     RichText(
                //       text: TextSpan(
                //         text: 'Add Note',
                //         style: TextStyle(
                //           fontSize: 8,
                //           color: Colors.black54,
                //           decoration: TextDecoration.underline,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             //cascade notation (from stackoverflow idk)
                //           },
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     Icon(Icons.edit, size: 12, color: Colors.black54),
                //   ],
                // ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemQuantityButton(item: cart),
              SizedBox(height: 5),
              Text(
                currencyNotifier.value.format(
                  cart.menu.menuPrice * cart.quantity,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
