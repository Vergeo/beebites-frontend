import 'dart:convert';

import 'package:frontend/models/menus.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class MenuService {
  static Future getAllMenusFromTenant(int tenantId) async {
    var response = await get(
      getUri("menu/get-all-menus-from-tenant/$tenantId"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Menu.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch menus!");
  }
}
