import '../../../../core/models/result.dart';

abstract class LoginDataSource {
  Future<Result> login(String email, String password);
}
