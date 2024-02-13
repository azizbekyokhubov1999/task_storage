import 'package:dio/dio.dart';
import '../models/user_model.dart';

class DioService {
  final Dio _dio = Dio();

  Future<User?> getUserByToken(String token) async {
    try {
      final response = await _dio.get('https://65ace4a7adbd5aa31bdfb633.mockapi.io/user?token=$token');
      if (response.data.isNotEmpty) {
        return User.fromJson(response.data[0]);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
