import 'package:arga_azka_fe/application/models/packages.dart';
import 'package:arga_azka_fe/application/models/price.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/helpers/dio_error_type_parser.dart';
import '../../application/models/invoice.dart';
import '../../application/services/local_db_service.dart';

class KasirAPI {
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

  Future<Either<String, Packages>> getPackages() async {
    try {
      final res = await _dio.get(Endpoint.getPackages,
          options: options(_localDBService.getToken()!));

      if (res.data['code'] != 200) {
        return Left(res.data['message'] as String);
      }

      final packages = Packages.fromJson(res.data);

      return Right(packages);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }

  Future<Either<String, PriceModel>> generatePrice({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _dio.post(Endpoint.generateInvoice,
          data: payload, options: options(_localDBService.getToken()!));

      if (res.data['code'] != 201) {
        return Left(res.data['message'] as String);
      }

      final price = PriceModel.fromJson(res.data);

      return Right(price);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }

  Future<Either<String, InvoiceModel>> createInvoice({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _dio.post(Endpoint.createInvoice,
          data: payload, options: options(_localDBService.getToken()!));

      if (res.data['code'] != 201) {
        return Left(res.data['message'] as String);
      }

      final price = InvoiceModel.fromJson(res.data);

      return Right(price);
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);

      return Left(errorMessage);
    }
  }
}
