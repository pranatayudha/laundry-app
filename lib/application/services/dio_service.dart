import 'package:dio/dio.dart';

import '../../infrastructure/apis/api_interceptor.dart';

class DioService {
  static Dio getInstance() {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://203.194.113.48:8000/v1',
      connectTimeout: 60000,
    ));

    dio.interceptors.add(ApiInterceptor());

    return dio;
  }
}
