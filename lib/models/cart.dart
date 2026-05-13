import 'package:frontend/models/menus.dart';

class Cart {
  final int cartId;
  final int userId;
  final int menuId;
  final int quantity;
  final Menu menu;

  const Cart({
    required this.cartId,
    required this.userId,
    required this.menuId,
    required this.quantity,
    required this.menu,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'cartId': int cartId,
        'userId': int userId,
        'menuId': int menuId,
        'quantity': int quantity,
        'menu': Map<String, dynamic> menu,
      } =>
        Cart(
          cartId: cartId,
          userId: userId,
          menuId: menuId,
          quantity: quantity,
          menu: Menu.fromJson(menu),
        ),
      _ => throw const FormatException('Failed to load cart.'),
    };
  }
}
