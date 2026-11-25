// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/api_client/auth_api_client.dart' as _i824;
import '../../features/auth/api/datasources/auth_local_datasource_impl.dart'
    as _i89;
import '../../features/auth/api/datasources/auth_remote_datasource_impl.dart'
    as _i284;
import '../../features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i814;
import '../../features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i1022;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/signup_usecase.dart' as _i472;
import '../../features/auth/presentation/cubit/login/login_viewmodel.dart'
    as _i590;
import '../../features/auth/presentation/cubit/signup/signup_viewmodel.dart'
    as _i736;
import '../dio/dio_module.dart' as _i977;
import '../storage/storage_module.dart' as _i699;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final storageModule = _$StorageModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i824.AuthApiClient>(
      () => _i824.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i814.AuthLocalDatasource>(
      () => _i89.AuthLocalDatasourceImpl(),
    );
    gh.factory<_i1022.AuthRemoteDatasource>(
      () => _i284.AuthRemoteDatasourceImpl(gh<_i824.AuthApiClient>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i662.AuthRepoImpl(
        gh<_i1022.AuthRemoteDatasource>(),
        gh<_i814.AuthLocalDatasource>(),
      ),
    );
    gh.factory<_i911.LoginUsecase>(
      () => _i911.LoginUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i472.SignupUsecase>(
      () => _i472.SignupUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i736.SignupViewmodel>(
      () => _i736.SignupViewmodel(gh<_i472.SignupUsecase>()),
    );
    gh.factory<_i590.LoginViewmodel>(
      () => _i590.LoginViewmodel(gh<_i911.LoginUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}

class _$StorageModule extends _i699.StorageModule {}
