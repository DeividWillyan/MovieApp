import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
