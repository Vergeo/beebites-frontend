import 'dart:convert';

import 'package:frontend/models/cart.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class CartService {
  static Future getCartFromUser(int userId) async {
    var response = await get(getUri("cart/get-cart-by-user/$userId"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      cartsNotifier.value = data.map((e) => Cart.fromJson(e)).toList();
      return "Cart fetch successfully!";
    }
    return Future.error("Failed to fetch cart!");
  }

  static Future addMenuToCart(int userId, int menuId, int quantity) async {
    var response = await post(
      getUri("cart/add-menu-to-cart/$userId"),
      body: jsonEncode(<String, int>{"menuId": menuId, "quantity": quantity}),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print(data);
      // return data.map((e) => Menu.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch cart!");
  }
}
