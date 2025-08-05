import '../../../../core/models/result.dart';

abstract class LoginRepo {
  Future<Result> login(String email, String password);
}
