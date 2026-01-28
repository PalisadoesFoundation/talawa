import 'package:talawa/services/secure_storage_service.dart';

/// Fake implementation of SecureStorageService for testing.
class FakeSecureStorageService implements SecureStorageService {
  final Map<String, String> _storage = {};

  @override
  Future<void> writeToken(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<String?> readToken(String key) async {
    return _storage[key];
  }

  @override
  Future<void> deleteToken(String key) async {
    _storage.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    _storage.clear();
  }
}
