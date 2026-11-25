import 'package:exam_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return  await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
