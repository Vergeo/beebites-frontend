import 'dart:convert';

import 'package:frontend/services/base_api.dart';
import 'package:frontend/models/tenant.dart';
import 'package:http/http.dart';

class TenantService {
  static Future getAllTenants() async {
    var response = await get(getUri("tenants/get-all-tenants"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Tenant.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch tenants!");
  }

  static Future searchTenant(String keyword) async {
    var response = await get(getUri("tenants/search-tenants/$keyword"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Tenant.fromJson(e)).toList();
    }
    return Future.error("Failed to fetch tenants!");
  }

  static Future getTenant(int tenantId) async {
    var response = await get(getUri("tenants/get-tenant/$tenantId"));

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);

      return Tenant.fromJson(data);
    }
    // return Future.error(jsonDecode(response.body)["message"]);
    return Future.error("Failed to fetch tenant!");
  }

  static Future getTenantByUser(int userId) async {
    var response = await get(getUri("tenants/get-tenant-by-user/$userId"));

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);

      return Tenant.fromJson(data);
    }
    // return Future.error(jsonDecode(response.body)["message"]);
    return Future.error("Failed to fetch tenant!");
  }

  static Future createTenant(
    int userId,
    String tenantName,
    String tenantDescription,
    String tenantLogo,
    String tenantOpenTime,
    String tenantCloseTime,
  ) async {
    var response = await post(
      getUri("tenants/create-tenant"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "userId": userId,
        "tenantName": tenantName,
        "tenantDescription": tenantDescription,
        "tenantLogo": tenantLogo,
        "tenantOpenTime": tenantOpenTime,
        "tenantCloseTime": tenantCloseTime,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic data = jsonDecode(response.body);

      return Tenant.fromJson(data);
    }
    return Future.error(jsonDecode(response.body)["message"]);
    // return Future.error("Failed to fetch tenant!");
  }

  static Future updateTenant(
    int tenantId,
    String tenantName,
    String tenantDescription,
    String tenantLogo,
    String tenantOpenTime,
    String tenantCloseTime,
  ) async {
    var response = await patch(
      getUri("tenants/update-tenant/$tenantId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "tenantName": tenantName,
        "tenantDescription": tenantDescription,
        "tenantLogo": tenantLogo,
        "tenantOpenTime": tenantOpenTime,
        "tenantCloseTime": tenantCloseTime,
      }),
    );

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);

      return Tenant.fromJson(data);
    }
    return Future.error(jsonDecode(response.body)["message"]);
    // return Future.error("Failed to fetch tenant!");
  }
}
