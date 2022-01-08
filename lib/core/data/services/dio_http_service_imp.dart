import 'package:dio/dio.dart';
import 'package:movieapp/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U',
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
