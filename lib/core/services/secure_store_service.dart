import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:postman/core/error/exceptions.dart';

class SecureStorageService {
  static const String _userCredentialsKey = 'jwt_bearer';
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  Future<void> saveCredentials(String token) async {
    try {
      await _storage.write(key: _userCredentialsKey, value: token);
    } catch (e) {
      throw SecureStorageException('Failed to save credentials: $e');
    }
  }

  Future<String?> getToken() async {
    try {
      final jsonString = await _storage.read(key: _userCredentialsKey);
      if (jsonString == null) return null;
      return jsonString;
    } catch (e) {
      throw SecureStorageException('Failed to read token: $e');
    }
  }

  Future<void> clearToken() async {
    try {
      await _storage.delete(key: _userCredentialsKey);
    } catch (e) {
      throw SecureStorageException('Failed to clear token: $e');
    }
  }
}
