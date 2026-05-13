import 'package:flutter/material.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:frontend/views/widgets/user/item_quantity_button.dart';

class UserCartItem extends StatelessWidget {
  final Menu menu;
  final int quantity;

  const UserCartItem({super.key, required this.menu, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      height: 100,
      dark: true,
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
                  child: Image.asset(menu.menuImage),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(menu.menuName, style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Add Note',
                            style: TextStyle(
                              fontSize: 12,
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
              ItemQuantityButton(quantity: quantity),
              SizedBox(height: 5),
              Text("Rp ${menu.menuPrice}"),
            ],
          ),
        ],
      ),
    );
  }
}
