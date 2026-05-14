import 'package:frontend/models/menus.dart';

class Cart {
  final int cartId;
  final int userId;
  final int menuId;
  final int quantity;
  final Menu menu;
  final String notes;

  const Cart({
    required this.cartId,
    required this.userId,
    required this.menuId,
    required this.quantity,
    required this.menu,
    required this.notes,
  });

  Cart copyWith({
    int? cartId,
    int? userId,
    int? menuId,
    int? quantity,
    Menu? menu,
    String? notes,
  }) {
    return Cart(
      cartId: cartId ?? this.cartId,
      userId: userId ?? this.userId,
      menuId: menuId ?? this.menuId,
      quantity: quantity ?? this.quantity,
      menu: menu ?? this.menu,
      notes: notes ?? this.notes,
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'cartId': int cartId,
        'userId': int userId,
        'menuId': int menuId,
        'quantity': int quantity,
        'menu': Map<String, dynamic> menu,
        'notes': String notes,
      } =>
        Cart(
          cartId: cartId,
          userId: userId,
          menuId: menuId,
          quantity: quantity,
          menu: Menu.fromJson(menu),
          notes: notes,
        ),
      _ => throw const FormatException('Failed to load cart.'),
    };
  }
}
