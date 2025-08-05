import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/result.dart';
import '../../domain/use_cases/login_use_case/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var response = await _loginUseCase.call(email, password);
    switch (response) {
      case Success():
        emit(LoginSuccess());

      case Error():
        emit(LoginFail(response.exception.toString()));
    }
  }
}
