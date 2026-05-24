import 'dart:convert';

import 'package:frontend/models/notifiers.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/base_api.dart';
import 'package:http/http.dart';

class AuthService {
  static Future login(String email, String password) async {
    var response = await post(
      getUri("auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      currentUserNotifier.value = User.fromJson(data["user"]);
      jwtNotifier.value = data["access_token"];
      return "Login successful!";
    }
    //jsonDecode(response.body)["message"]
    return Future.error("Invalid email or password");
  }

  static Future register(String name, String email, String password) async {
    var response = await post(
      getUri("auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "role": "customer",
      }),
    );

    // print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      currentUserNotifier.value = User.fromJson(data["user"]);
      jwtNotifier.value = data["access_token"];
      return "Login successful!";
    }
    //jsonDecode(response.body)["message"]
    return Future.error(jsonDecode(response.body)["message"]);
  }

  static Future registerUserAsTenant(int userId) async {
    var response = await patch(
      getUri("users/update-user/$userId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"role": "tenant"}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return "User registered as tenant successfully!";
    }
    //jsonDecode(response.body)["message"]
    return Future.error(jsonDecode(response.body)["message"]);
  }
}
