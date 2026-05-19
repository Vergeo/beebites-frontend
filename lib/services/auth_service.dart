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
}
