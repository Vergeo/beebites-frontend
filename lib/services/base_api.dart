const String baseUrl = "http://10.0.2.2:3000/api/v1/";

Uri getUri(String endpoint) {
  return Uri.parse(baseUrl + endpoint);
}
