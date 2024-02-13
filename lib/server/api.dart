class ApiServer{
  static const String baseUrl = "https://65ace4a7adbd5aa31bdfb633.mockapi.io/";
  static const String apiGetAllData = "/user";
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const Map<String, String> headers = {"Content-Type": "application/json"};
}