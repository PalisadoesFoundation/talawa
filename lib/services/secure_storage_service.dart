import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service handling secure storage operations using flutter_secure_storage.
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  /// Writes a value to secure storage.
  ///
  /// **params**:
  /// * `key`: the key to identify the value.
  /// * `value`: the value to be stored.
  ///
  /// **returns**:
  ///   None
  Future<void> writeToken(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Reads a value from secure storage.
  ///
  /// **params**:
  /// * `key`: the key to retrieve the value.
  ///
  /// **returns**:
  /// * `Future<String?>`: returns the stored value or null.
  Future<String?> readToken(String key) async {
    return await _storage.read(key: key);
  }

  /// Deletes a value from secure storage.
  ///
  /// **params**:
  /// * `key`: the key of the value to delete.
  ///
  /// **returns**:
  ///   None
  Future<void> deleteToken(String key) async {
    await _storage.delete(key: key);
  }

  /// Deletes all values from secure storage.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
