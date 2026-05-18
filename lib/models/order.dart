import 'package:frontend/models/menus.dart';
import 'package:frontend/models/payment.dart';

class Order {
  final int orderId;
  final int menuId;
  final int? paymentId;
  final int quantity;
  final DateTime createdAt;
  final Menu menu;
  final Payment? payment;

  const Order({
    required this.orderId,
    required this.menuId,
    this.paymentId,
    required this.quantity,
    required this.createdAt,
    required this.menu,
    this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'orderId': int orderId,
        'menuId': int menuId,
        'paymentId': int? paymentId,
        'quantity': int quantity,
        'createdAt': String createdAt,
        'menu': Map<String, dynamic> menu,
        'payment': Map<String, dynamic>? payment,
      } =>
        Order(
          orderId: orderId,
          menuId: menuId,
          paymentId: paymentId,
          quantity: quantity,
          createdAt: DateTime.parse(createdAt),
          menu: Menu.fromJson(menu),
          payment: payment != null ? Payment.fromJson(payment) : null,
        ),
      _ => throw const FormatException('Failed to load order.'),
    };
  }
}
