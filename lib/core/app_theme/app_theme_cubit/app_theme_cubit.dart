import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());
  static AppThemeCubit get(BuildContext context) => BlocProvider.of<AppThemeCubit>(context);

  ThemeMode appTheme = ThemeMode.light;

  Future<void> changeTheme() async {
    emit(AppThemeInitial());

   appTheme = appTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    emit(AppThemeUpdateTheme());
  }
}
