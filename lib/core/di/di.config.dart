// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/login_data_source.dart' as _i732;
import '../../features/auth/data/data_source_imp/login_data_source_impl.dart'
    as _i419;
import '../../features/auth/data/login_repo_impl/login_repo_impl.dart' as _i60;
import '../../features/auth/domain/login_repo/login_repo.dart' as _i923;
import '../../features/auth/domain/use_cases/login_use_case/login_use_case.dart'
    as _i1004;
import '../../features/home/data/data_source/posts_data_source.dart' as _i239;
import '../../features/home/data/data_source_imp/posts_data_source_impl.dart'
    as _i813;
import '../../features/home/data/posts_repo_impl/posts_repo_impl.dart' as _i412;
import '../../features/home/domain/posts_repo/posts_repo.dart' as _i360;
import '../../features/home/domain/use_cases/get_posts_use_case/get_posts_use_case.dart'
    as _i852;
import '../api_manager/api_di.dart' as _i285;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.Dio>(() => dioInjection.injectDio());
    gh.singleton<_i266.ApiManager>(() => _i266.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i732.LoginDataSource>(() => _i419.LoginDataSourceImpl());
    gh.factory<_i923.LoginRepo>(
      () => _i60.LoginRepoImpl(gh<_i732.LoginDataSource>()),
    );
    gh.factory<_i239.PostsDataSource>(
      () => _i813.PostsDataSourceImpl(gh<_i266.ApiManager>()),
    );
    gh.factory<_i1004.LoginUseCase>(
      () => _i1004.LoginUseCase(gh<_i923.LoginRepo>()),
    );
    gh.factory<_i360.PostsRepo>(
      () => _i412.PostsRepoImpl(gh<_i239.PostsDataSource>()),
    );
    gh.factory<_i852.GetPostsUseCase>(
      () => _i852.GetPostsUseCase(gh<_i360.PostsRepo>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
