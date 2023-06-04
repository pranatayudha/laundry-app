import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/services/local_db_service.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final _localDBService = locator<LocalDBService>();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == Endpoint.login) {
      options.headers['Authorization'] =
          'Basic a2FzaXItbG91bmRyeTpwbzdsNTlzMy03MmM5LTUxbjEtZWJpNS03MHBwNDczOHByZXQ=';
    } else {
      final token = _localDBService.getToken();
      options.contentType = Headers.formUrlEncodedContentType;
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
