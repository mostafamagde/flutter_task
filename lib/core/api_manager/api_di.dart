import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@module
abstract class DioInjection {
  @Singleton()
  Dio injectDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return dio;
  }
}
