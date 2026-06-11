import 'package:frontend/models/notifiers.dart';

const String baseUrl = "https://beebites-backend.onrender.com/api/v1/";

Uri getUri(String endpoint) {
  return Uri.parse(baseUrl + endpoint);
}

Map<String, String> getHeaders() {
  final headers = {"Content-Type": "application/json"};

  if (jwtNotifier.value != null && jwtNotifier.value!.isNotEmpty) {
    headers["Authorization"] = "Bearer ${jwtNotifier.value}";
  }

  return headers;
}
