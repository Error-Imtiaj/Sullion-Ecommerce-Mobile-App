class AppUrls {
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";

  static String emailVerification(String email) => '$_baseUrl/UserLogin/$email';
}
