import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/secure_storage_service.dart';
import '../helpers/fake_flutter_secure_storage.dart';

/// Test suite for [SecureStorageService].
///
/// verifying default configuration and storage operations.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SecureStorageService Test -', () {
    test('writeToken and readToken work correctly', () async {
      // Use instance-based fake to avoid global state pollution
      final fakeStorage = FakeFlutterSecureStorage();
      final service = SecureStorageService(storage: fakeStorage);

      // Verify basic functionality works with the fake instance
      await service.writeToken('test_key', 'test_value');
      final value = await service.readToken('test_key');

      expect(value, 'test_value');
    });

    test('Constructs with provided storage', () async {
      final fakeStorage = FakeFlutterSecureStorage();
      final service = SecureStorageService(storage: fakeStorage);

      await service.writeToken('key2', 'value2');
      final value = await service.readToken('key2');

      expect(value, 'value2');
    });

    test('deleteToken removes the value', () async {
      final fakeStorage = FakeFlutterSecureStorage();
      final service = SecureStorageService(storage: fakeStorage);
      await service.writeToken('delete_me', 'value');

      await service.deleteToken('delete_me');
      final value = await service.readToken('delete_me');

      expect(value, isNull);
    });

    test('deleteAll clears all values', () async {
      final fakeStorage = FakeFlutterSecureStorage();
      final service = SecureStorageService(storage: fakeStorage);
      await service.writeToken('k1', 'v1');
      await service.writeToken('k2', 'v2');

      await service.deleteAll();

      expect(await service.readToken('k1'), isNull);
      expect(await service.readToken('k2'), isNull);
    });
  });
}
