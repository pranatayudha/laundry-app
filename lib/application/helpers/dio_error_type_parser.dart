import 'package:dio/dio.dart';

import '../app/constants/common.dart';

class DioErrorTypeParser {
  static String parseToCustomMessage(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return Common.dioErrorTypeConnectionTimeoutMessage;

      case DioErrorType.other:
        return Common.dioErrorTypeOtherMessage;

      case DioErrorType.response:
        String message = e.message;

        switch (e.response?.statusCode) {
          case 400:
            message = Common.statusCode400Message;
            break;

          case 404:
            message = Common.statusCode404Message;
            break;

          case 500:
            message = Common.statusCode500Message;
            break;
        }

        return message;

      default:
        return e.message;
    }
  }
}
