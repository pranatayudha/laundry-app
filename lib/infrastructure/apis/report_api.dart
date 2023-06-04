import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/models/report.dart';
import '../../application/services/local_db_service.dart';

class ReportAPI {
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

  Future<Either<String, ReportModel>> getReport(
      String? date, String branch) async {
    try {
      final res = await _dio.get(
          '${Endpoint.getReport}date=$date&branch=$branch',
          options: options(_localDBService.getToken()!));

      if (res.data['code'] != 200) {
        return Left(res.data['message'] as String);
      }

      return Right(ReportModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
