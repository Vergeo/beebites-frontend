import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/glass_card_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:frontend/views/widgets/user/item_quantity_button.dart';

class UserCartItem extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final int quantity;

  const UserCartItem({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return GlassCardWidget(
      height: 100,
      dark: true,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 26,),
          
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              SizedBox(height: 5),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Add Note',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.black54, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {  //cascade notation (from stackoverflow idk)

                        }
                    ),
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.edit, size: 12, color: Colors.black54,)
                ],
              )
            ],
          ),
          
          SizedBox(width: 80,),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemQuantityButton(quantity: quantity),
              SizedBox(height: 5,),
              Text("Rp.67,676")
            ],
          )
        ],
      )
    );
  }
}