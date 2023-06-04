import 'package:arga_azka_fe/application/models/invoice.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../application/app/app.locator.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/services/local_db_service.dart';

class InvoiceAPI {
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

  Future<Either<String, List<Invoice>>> getListInvoice(String? id) async {
    try {
      final res = await _dio.get(Endpoint.getListInvoice + (id ?? ''),
          options: options(_localDBService.getToken()!));

      if (res.data['code'] != 200) {
        return Left(res.data['message'] as String);
      }

      List<Invoice> invoices = List.generate(
        res.data['data'].length ?? 0,
        (index) => Invoice.fromJson(
          res.data['data'][index],
        ),
      );

      return Right(invoices);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, InvoiceModel>> getDetailInvoice(String? id) async {
    try {
      final res = await _dio.get(Endpoint.getDetailInvoice + (id ?? ''),
          options: options(_localDBService.getToken()!));

      if (res.data['code'] != 200) {
        return Left(res.data['message'] as String);
      }

      return Right(InvoiceModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }

  Future<Either<String, InvoiceModel>> updateInvoice(
      String? id, String paidOff) async {
    try {
      var payload = {"id": id, "paid_off": paidOff};
      final res = await _dio.put(Endpoint.updateInvoice,
          options: options(_localDBService.getToken()!), data: payload);

      if (res.data['code'] != 201) {
        return Left(res.data['message'] as String);
      }

      return Right(InvoiceModel.fromJson(res.data));
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
