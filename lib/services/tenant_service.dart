import 'dart:convert';

import 'package:frontend/services/base_api.dart';
import 'package:frontend/models/tenant.dart';
import 'package:http/http.dart';

class TenantService {
  static Future getAllTenants() async {
    var response = await get(getUri("tenants/get-all-tenants"));

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        return data.map((e) => Tenant.fromJson(e)).toList();
      }
    }
    return "Failed to fetch tenants!";
  }

  static Future getTenant(int tenantId) async {
    var response = await get(getUri("tenants/get-tenant/$tenantId"));

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);

        return Tenant.fromJson(data);
      }
    }
    return "Failed to fetch tenants!";
  }
}
