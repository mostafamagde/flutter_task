import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme/app_theme.dart';
import 'core/app_theme/app_theme_cubit/app_theme_cubit.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Task',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: BlocProvider
                .of<AppThemeCubit>(context)
                .appTheme,

            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
