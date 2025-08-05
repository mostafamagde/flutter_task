import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../login_repo/login_repo.dart';

@injectable
class LoginUseCase {
  final LoginRepo _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Result> call(String email, String password) async {
    return await _loginRepository.login(email, password);
  }
}
