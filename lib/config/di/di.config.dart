// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/api_client/auth_api_client.dart' as _i824;
import '../../features/auth/api/datasources/dummy_auth_remote_data_source_impl.dart'
    as _i1036;
import '../../features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i1022;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/forget_password_use_case.dart'
    as _i591;
import '../../features/auth/domain/usecases/resend_code_use_case.dart' as _i470;
import '../../features/auth/domain/usecases/reset_password_use_case.dart'
    as _i825;
import '../../features/auth/domain/usecases/verify_reset_code_use_case.dart'
    as _i948;
import '../../features/auth/presentation/cubit/forget_password/forget_password_cubit.dart'
    as _i817;
import '../../features/auth/presentation/cubit/reset_code/verify_reset_code_cubit.dart'
    as _i571;
import '../../features/auth/presentation/cubit/reset_password/reset_password_cubit.dart'
    as _i260;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i824.AuthApiClient>(
      () => _i824.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1022.AuthRemoteDatasource>(
      () => _i1036.DummyAuthRemoteDataSourceImpl(),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i662.AuthRepoImpl(gh<_i1022.AuthRemoteDatasource>()),
    );
    gh.factory<_i591.ForgetPasswordUseCase>(
      () => _i591.ForgetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i470.ResendCodeUseCase>(
      () => _i470.ResendCodeUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i825.ResetPasswordUseCase>(
      () => _i825.ResetPasswordUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i948.VerifyResetCodeUseCase>(
      () => _i948.VerifyResetCodeUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i817.ForgetPasswordCubit>(
      () => _i817.ForgetPasswordCubit(gh<_i591.ForgetPasswordUseCase>()),
    );
    gh.factory<_i571.VerifyResetCodeCubit>(
      () => _i571.VerifyResetCodeCubit(
        gh<_i948.VerifyResetCodeUseCase>(),
        gh<_i470.ResendCodeUseCase>(),
      ),
    );
    gh.factory<_i260.ResetPasswordCubit>(
      () => _i260.ResetPasswordCubit(gh<_i825.ResetPasswordUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
