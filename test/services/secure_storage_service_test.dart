import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/secure_storage_service.dart';

/// Test suite for [SecureStorageService].
///
/// verifying default configuration and storage operations.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SecureStorageService Test -', () {
    test('Constructs with default storage when no argument provided', () async {
      // Setup mock values for FlutterSecureStorage to prevent MissingPluginException
      FlutterSecureStorage.setMockInitialValues({});

      // Initialize service without arguments to trigger the default storage path
      final service = SecureStorageService();

      // Verify basic functionality works with the default instance
      await service.writeToken('test_key', 'test_value');
      final value = await service.readToken('test_key');

      expect(value, 'test_value');
    });

    test('Constructs with provided storage', () async {
      FlutterSecureStorage.setMockInitialValues({});
      const storage = FlutterSecureStorage();
      final service = SecureStorageService(storage: storage);

      await service.writeToken('key2', 'value2');
      final value = await service.readToken('key2');

      expect(value, 'value2');
    });

    test('deleteToken removes the value', () async {
      FlutterSecureStorage.setMockInitialValues({});
      final service = SecureStorageService();
      await service.writeToken('delete_me', 'value');

      await service.deleteToken('delete_me');
      final value = await service.readToken('delete_me');

      expect(value, isNull);
    });

    test('deleteAll clears all values', () async {
      FlutterSecureStorage.setMockInitialValues({});
      final service = SecureStorageService();
      await service.writeToken('k1', 'v1');
      await service.writeToken('k2', 'v2');

      await service.deleteAll();

      expect(await service.readToken('k1'), isNull);
      expect(await service.readToken('k2'), isNull);
    });
  });
}
