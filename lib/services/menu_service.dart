import 'dart:convert';

import 'package:frontend/models/menus.dart';
import 'package:frontend/models/notifiers.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class MenuService {
  static Future getAllMenusFromTenant(int tenantId) async {
    var response = await get(
      getUri("menu/get-all-menus-from-tenant/$tenantId"),
      headers: getHeaders(),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Menu.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch menus!");
  }

  static Future createMenu(
    String menuName,
    String menuDescription,
    String menuImage,
    int menuPrice,
    bool isAvailable,
  ) async {
    var response = await post(
      getUri("menu/create-menu"),
      headers: getHeaders(),
      body: jsonEncode({
        "tenantId": currentTenantNotifier.value!.tenantId,
        "menuName": menuName,
        "menuDescription": menuDescription,
        "menuImage": menuImage,
        "menuPrice": menuPrice,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Menu created successfully";
    }
    return Future.error("Failed to create menu!");
  }

  static Future searchMenu(int tenantId, String keyword) async {
    var response = await get(
      getUri("menu/search-menus-from-tenant/$tenantId/$keyword"),
      headers: getHeaders(),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Menu.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch menu!");
  }

  static Future updateMenu(
    int menuId,
    String menuName,
    String menuDescription,
    String menuImage,
    int menuPrice,
    bool isAvailable,
  ) async {
    var response = await patch(
      getUri("menu/update-menu/$menuId"),
      headers: getHeaders(),
      body: jsonEncode({
        "menuName": menuName,
        "menuDescription": menuDescription,
        "menuImage": menuImage,
        "menuPrice": menuPrice,
      }),
    );

    if (response.statusCode == 200) {
      return "Menu updated successfully";
    }
    return Future.error("Failed to udpate menu!");
  }

  static Future deleteMenu(int menuId) async {
    var response = await delete(
      getUri("menu/delete-menu/$menuId"),
      headers: getHeaders(),
    );

    if (response.statusCode == 200) {
      return "Menu deleted successfully";
    }
    return Future.error("Failed to delete menu!");
  }
}
