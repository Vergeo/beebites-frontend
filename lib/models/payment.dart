import 'package:frontend/models/tenant.dart';
import 'package:frontend/models/user.dart';

class Payment {
  final int paymentId;
  final int userId;
  final int tenantId;
  final Tenant? tenant;
  final User? user;
  final String paymentType;
  final String status;
  final double totalPrice;
  final DateTime createdAt;

  const Payment({
    required this.paymentId,
    required this.userId,
    required this.tenantId,
    this.tenant,
    this.user,
    required this.paymentType,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'tenantId': int tenantId,
        'paymentType': String paymentType,
        'paymentId': int paymentId,
        'status': String status,
        'totalPrice': String totalPrice,
        'createdAt': String createdAt,
      } =>
        Payment(
          userId: userId,
          tenantId: tenantId,
          paymentType: paymentType,
          paymentId: paymentId,
          status: status,
          totalPrice: double.parse(totalPrice),
          createdAt: DateTime.parse(createdAt),
          // FIX: Safely pull nested objects from the 'json' map itself
          // because they are missing from the raw keys structure
          tenant: json['tenant'] != null
              ? Tenant.fromJson(json['tenant'] as Map<String, dynamic>)
              : null,
          user: json['user'] != null
              ? User.fromJson(json['user'] as Map<String, dynamic>)
              : null,
        ),
      _ => throw const FormatException('Failed to load payment.'),
    };
  }
}
