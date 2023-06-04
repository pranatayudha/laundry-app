import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/helpers/dio_error_type_parser.dart';
import '../../application/models/user.dart';
import '../../application/services/local_db_service.dart';

class UserAPI {
  final _dio = locator<Dio>();
  final _localDBService = locator<LocalDBService>();

  Options options(String token) {
    return Options(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) => true,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Headers':
            'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
        'Access-Control-Allow-Methods': 'GET, HEAD, POST, OPTIONS, PUT'
      },
    );
  }

  Future<Either<String, User>> login({
    required Map<String, dynamic> payload,
  }) async {
    try {
      _localDBService.removeToken();
      _localDBService.removeUser();
      final res = await _dio.post(Endpoint.login, data: payload);

      if (res.data['code'] != 200) {
        // print(res.data);
        return Left(res.data['message'] as String);
      }

      final user = User.fromJson(res.data['data'] as Map<String, dynamic>);

      _localDBService.storeUser(user);
      _localDBService.storeToken(user.accessToken!);

      return Right(user);
    } on DioError catch (e) {
      // print(e);
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }
}
