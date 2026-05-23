import 'dart:convert';

import 'package:frontend/models/payment.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class PaymentService {
  static Future getAllPaymentsByUser(int userId) async {
    var response = await get(
      getUri("payment/get-all-payments-by-user/$userId"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Payment.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch payments!");
  }

  static Future getAllPaymentsByTenant(int tenantId) async {
    var response = await get(
      getUri("payment/get-all-payments-by-tenant/$tenantId"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Payment.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch payments!");
  }

  static Future createPayment(
    int userId,
    int tenantId,
    String paymentType,
  ) async {
    var response = await post(
      getUri("payment/create-payment"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userId": userId,
        "tenantId": tenantId,
        "paymentType": paymentType,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic data = jsonDecode(response.body);

      return Payment.fromJson(data);
    }
    return Future.error("Failed to create payments!");
    // dynamic data = jsonDecode(
    //   r'{"userId": 1, "tenantId": 1, "paymentType": "qris", "paymentId": 31, "status": "pending", "totalPrice": 0.00, "createdAt": "2026-05-18T07:54:31.162Z"}',
    // );
    // return Payment.fromJson(data);
  }

  static Future updatePaymentStatus(int paymentId, String status) async {
    var response = await patch(
      getUri("payment/update-payment-status/$paymentId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"status": status}),
    );

    if (response.statusCode == 200) {
      return "Successfully update payment status!";
    }
    return Future.error("Failed to update payment status!");
  }
}
