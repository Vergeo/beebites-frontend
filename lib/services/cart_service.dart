import 'dart:convert';

import 'package:frontend/models/cart.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/base_api.dart';
import 'package:frontend/viewmodels/user/cart_list.dart';
import 'package:http/http.dart';

class CartService {
  static Future getCartFromUser(int userId) async {
    var response = await get(getUri("cart/get-cart-by-user/$userId"));
    print(response.statusCode);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      cartNotifier.value = data.map((e) => Cart.fromJson(e)).toList();
      return "Cart fetch successfully!";
    }
    return Future.error("Failed to fetch cart!");
  }

  static Future addMenuToCart(
    int userId,
    int menuId,
    int quantity,
    String notes,
  ) async {
    var response = await post(
      getUri("cart/add-menu-to-cart/$userId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "menuId": menuId,
        "quantity": quantity,
        "notes": notes,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<Cart> currentList = List.from(cartNotifier.value);
      int index = currentList.indexWhere((item) => item.menuId == menuId);

      if (index != -1) {
        int newQuantity = currentList[index].quantity + quantity;

        if (newQuantity <= 0) {
          currentList.removeAt(index);
        } else {
          currentList[index] = currentList[index].copyWith(
            quantity: newQuantity,
          );
        }
      } else {
        if (quantity > 0) {
          final data = jsonDecode(response.body);
          currentList.add(Cart.fromJson(data));
        }
      }

      cartNotifier.value = List.from(currentList);

      return "Cart updated successfully!";
      // return data.map((e) => Menu.fromJson(e)).toList();
    }
    return Future.error("Failed to update cart!");
  }
}
