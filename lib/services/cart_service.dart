import 'dart:convert';

import 'package:frontend/models/cart.dart';
import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/order.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class CartService {
  static Future getCartFromUser(int userId) async {
    var response = await get(getUri("cart/get-cart-by-user/$userId"));
    // print(response.statusCode);
    itemCountNotifier.value = 0;
    totalPriceNotifier.value = 0;

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      cartNotifier.value = data.map((e) => Cart.fromJson(e)).toList();
      cartNotifier.value.forEach((item) {
        itemCountNotifier.value += item.quantity;
        totalPriceNotifier.value += item.quantity * item.menu.menuPrice;
        selectedTenantNotifier.value = item.menu.tenantId;
      });
      return data.map((e) => Order.fromJson(e)).toList();
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
    if (selectedTenantNotifier.value != null &&
        selectedTenantNotifier.value != menu.tenantId &&
        cartNotifier.value.isNotEmpty) {
      return Future.error("You cannot select menu from different tenants!");
    }

    List<Cart> backupList = List.from(cartNotifier.value);
    int? backupTenantId = selectedTenantNotifier.value;

    List<Cart> currentList = List.from(cartNotifier.value);
    int index = currentList.indexWhere((item) => item.menuId == menuId);

    if (index != -1) {
      int newQuantity = currentList[index].quantity + quantity;

      if (newQuantity <= 0) {
        itemCountNotifier.value -= currentList[index].quantity;
        totalPriceNotifier.value -=
            currentList[index].quantity * currentList[index].menu.menuPrice;
        currentList.removeAt(index);
      } else {
        itemCountNotifier.value -= currentList[index].quantity;
        totalPriceNotifier.value -=
            currentList[index].quantity * currentList[index].menu.menuPrice;
        currentList[index] = currentList[index].copyWith(quantity: newQuantity);
        itemCountNotifier.value += currentList[index].quantity;
        totalPriceNotifier.value +=
            currentList[index].quantity * currentList[index].menu.menuPrice;
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

        itemCountNotifier.value += 1;
        totalPriceNotifier.value += menu.menuPrice;
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

  static Future emptyCart(int userId) async {
    var response = await delete(getUri("cart/empty-cart/$userId"));

    if (response.statusCode == 200 || response.statusCode == 201) {
      itemCountNotifier.value = 0;
      totalPriceNotifier.value = 0;
      cartNotifier.value = List.from([]);
      return "Cart emptied successful!";
    }
    return Future.error("Failed to empty cart!");
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
      itemCountNotifier.value = 0;
      totalPriceNotifier.value = 0;
      cartNotifier.value = List.from([]);
      return "Checkout successful!";
    }
    return Future.error("Failed to checkout!");
  }
}
