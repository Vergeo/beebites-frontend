import 'package:flutter/material.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/views/widgets/user/user_cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartNotifier,
      builder: (context, carts, child) {
        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: carts.map((item) {
                return UserCartItem(cart: item);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
