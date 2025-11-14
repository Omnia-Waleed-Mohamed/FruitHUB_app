import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://fakestoreapi.com/",
          ),
        );

  Future<dynamic> getData({
    required String endPoint,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.get(
        endPoint,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future<Map<String, dynamic>> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.post(
        endPoint,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      throw Exception('Error posting data: $e');
    }
  }

  Future<Map<String, dynamic>> putData({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.put(
        endPoint,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }
}
