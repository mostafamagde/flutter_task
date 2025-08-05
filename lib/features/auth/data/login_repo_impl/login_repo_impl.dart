import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../../domain/login_repo/login_repo.dart';
import '../data_source/login_data_source.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginDataSource _loginDataSource;

  LoginRepoImpl(this._loginDataSource);

  @override
  Future<Result> login(String email, String password) async =>
      await _loginDataSource.login(email, password);
}
