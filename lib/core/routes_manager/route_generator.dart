import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/data/models/post_model.dart';
import '../../features/home/domain/use_cases/get_posts_use_case/get_posts_use_case.dart';
import '../../features/home/presentation/managers/post_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/post_detailes.dart';
import '../di/di.dart';
import 'routes_name.dart';

import '../../features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import '../../features/auth/presentation/managers/login_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/splash/views/spalsh.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(getIt<LoginUseCase>()),
                child: LoginView(),
              ),
          settings: settings,
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        PostCubit(getIt<GetPostsUseCase>())..getPosts(),
                child: HomeView(),
              ),
          settings: settings,
        );
      case RoutesName.details:
        final post = settings.arguments as PostModel;
        return MaterialPageRoute(
          builder: (context) => PostDetails(post: post),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
