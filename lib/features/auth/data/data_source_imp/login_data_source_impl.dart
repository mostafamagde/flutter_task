import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../data_source/login_data_source.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<Result> login(String email, String password) async {
    try {
      AndroidOptions _getAndroidOptions() =>
          const AndroidOptions(encryptedSharedPreferences: true);
      final storage = FlutterSecureStorage();
      await storage.write(key: "user", value: email);
      return Success("Login successful");
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
