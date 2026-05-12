import 'package:flutter/material.dart';
import 'package:frontend/data/bee_style.dart';
import 'package:frontend/widgets/user/user_cart_item.dart';

class UserCartPage extends StatefulWidget {
  const UserCartPage({super.key});

  @override
  State<UserCartPage> createState() => _UserCartPageState();
}

class _UserCartPageState extends State<UserCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeeStyle.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Order", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
          SizedBox(height: 30),
          UserCartItem(itemName: "Daging", imagePath: "assets/images/yishonaya.png", quantity: 1,),
          
          SizedBox(height: 30),
          UserCartItem(itemName: "Daging", imagePath: "assets/images/yishonaya.png", quantity: 1,),

          SizedBox(height: 30),
          UserCartItem(itemName: "Daging", imagePath: "assets/images/yishonaya.png", quantity: 1,)
        ],
      ),
    );
  }
}