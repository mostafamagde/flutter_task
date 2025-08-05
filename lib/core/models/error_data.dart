class ErrorModel {
  ErrorModel({this.message, this.errors});
  String? message;
  String? errors;
  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    errors = json['error'];
  }
}
