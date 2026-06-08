import 'dart:convert';

import 'package:frontend/models/order.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class OrderService {
  static Future getOrders(int paymentId) async {
    var response = await get(
      getUri("order/get-orders-by-payment/$paymentId"),
      headers: getHeaders(),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Order.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch order!");
  }
}
