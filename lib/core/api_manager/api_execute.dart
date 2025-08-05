import 'package:dio/dio.dart';

import '../exceptions/exceptions_impl.dart';
import '../models/error_data.dart';
import '../models/result.dart';


class ApiExecute {
  static Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
    try {
      var result = await apiCall.call();
      return Success(result);
    } on DioException catch (ex) {
      final responseCode = ex.response?.statusCode;

      switch (ex.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.badCertificate:
          return Error(NetworkError("Check your internet connection"));

        case DioExceptionType.badResponse:
          if (responseCode == null) {
            return Error(NetworkError("No status code from server"));
          }

          final errorData = ex.response?.data;
          final errorModel = errorData != null
              ? ErrorModel.fromJson(errorData)
              : ErrorModel(message: "Unknown error");

          if (responseCode >= 400 && responseCode < 500) {
            return Error(ClientError(errorModel));
          }

          if (responseCode >= 500 && responseCode < 600) {
            return Error(ServerError(errorModel));
          }

          return Error(Exception("Unhandled status code: $responseCode"));

        default:
          return Error(Exception("Unhandled Dio error: ${ex.message}"));
      }
    } on Exception catch (ex) {
      return Error(ex);
    }
  }
}
