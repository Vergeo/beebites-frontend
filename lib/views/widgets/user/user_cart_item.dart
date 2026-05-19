import 'package:flutter/material.dart';
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
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(cart.menu.menuImage),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.menu.menuName, style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Add Note',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //cascade notation (from stackoverflow idk)
                              },
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.edit, size: 12, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
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
