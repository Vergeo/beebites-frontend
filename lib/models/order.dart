import 'package:frontend/models/menus.dart';

class Order {
  final int orderId;
  final int menuId;
  final int paymentId;
  final int quantity;
  final DateTime createdAt;
  final Menu menu;
  final String? notes;

  const Order({
    required this.orderId,
    required this.menuId,
    required this.paymentId,
    required this.quantity,
    required this.createdAt,
    required this.menu,
    this.notes,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'orderId': int orderId,
        'menuId': int menuId,
        'paymentId': int paymentId,
        'quantity': int quantity,
        'createdAt': String createdAt,
        'menu': Map<String, dynamic> menu,
      } =>
        Order(
          orderId: orderId,
          menuId: menuId,
          paymentId: paymentId,
          quantity: quantity,
          createdAt: DateTime.parse(createdAt),
          menu: Menu.fromJson(menu),
          notes: json['notes'],
        ),
      _ => throw const FormatException('Failed to load order.'),
    };
  }
}
