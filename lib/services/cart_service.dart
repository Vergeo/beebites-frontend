import 'dart:convert';

import 'package:frontend/models/cart.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class CartService {
  static Future getCartFromUser(int userId) async {
    var response = await get(getUri("cart/get-cart-by-user/$userId"));
    // print(response.statusCode);

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
    int tenantId,
    int quantity,
    String notes,
    Menu menu,
  ) async {
    List<Cart> backupList = List.from(cartNotifier.value);
    int? backupTenantId = selectedTenantNotifier.value;

    List<Cart> currentList = List.from(cartNotifier.value);
    int index = currentList.indexWhere((item) => item.menuId == menuId);

    if (index != -1) {
      int newQuantity = currentList[index].quantity + quantity;

      if (newQuantity <= 0) {
        currentList.removeAt(index);
      } else {
        currentList[index] = currentList[index].copyWith(quantity: newQuantity);
      }
    } else {
      if (quantity > 0) {
        currentList.add(
          Cart(
            userId: userId,
            menu: menu,
            menuId: menuId,
            quantity: quantity,
            notes: notes,
          ),
        );
      }
    }

    selectedTenantNotifier.value = tenantId;
    cartNotifier.value = List.from(currentList);
    // print(cartNotifier.value[0].quantity);

    try {
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
        return "Cart updated successfully!";
      } else {
        return Future.error("Failed to update cart!");
      }
    } catch (error) {
      cartNotifier.value = backupList;
      selectedTenantNotifier.value = backupTenantId;
      return Future.error("Failed to update cart!");
    }
  }

  static Future checkout(int userId, int paymentId) async {
    if (cartNotifier.value.isEmpty) {
      return Future.error("Your cart is empty!");
    }

    var response = await post(
      getUri("cart/checkout"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userId": userId, "paymentId": paymentId}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      cartNotifier.value = List.from([]);
      return "Checkout successful!";
    }
    return Future.error("Failed to checkout!");
  }
}
