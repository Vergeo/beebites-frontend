import 'package:frontend/models/menus.dart';
import 'package:frontend/models/payment.dart';

class Order {
  final int orderId;
  final int menuId;
  final int paymentId;
  final int quantity;
  final DateTime createdAt;
  final Menu menu;

  const Order({
    required this.orderId,
    required this.menuId,
    required this.paymentId,
    required this.quantity,
    required this.createdAt,
    required this.menu,
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
        ),
      _ => throw const FormatException('Failed to load order.'),
    };
  }
}
