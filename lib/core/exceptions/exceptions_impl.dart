import '../models/error_data.dart';

class ServerError implements Exception {
  ErrorModel? errorModel;

  ServerError(this.errorModel);

  @override
  String toString() {
    return errorModel?.message ?? "Something went wrong";
  }
}

class NetworkError implements Exception {
  String? message;

  NetworkError(this.message);

  @override
  String toString() {
    return message ?? "Something went wrong";
  }
}

class ClientError implements Exception {
  ErrorModel? errorModel;

  ClientError(this.errorModel);

  @override
  String toString() {
    return errorModel?.message ?? "Something went wro  ng";
  }
}
class CustomException implements Exception {
  final String message;
  CustomException(this.message);

}
