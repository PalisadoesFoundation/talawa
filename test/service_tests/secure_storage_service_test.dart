import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/secure_storage_service.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    return super.noSuchMethod(
      Invocation.method(#write, [], {
        #key: key,
        #value: value,
        #iOptions: iOptions,
        #aOptions: aOptions,
        #lOptions: lOptions,
        #webOptions: webOptions,
        #mOptions: mOptions,
        #wOptions: wOptions,
      }),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    return super.noSuchMethod(
      Invocation.method(#read, [], {
        #key: key,
        #iOptions: iOptions,
        #aOptions: aOptions,
        #lOptions: lOptions,
        #webOptions: webOptions,
        #mOptions: mOptions,
        #wOptions: wOptions,
      }),
      returnValue: Future<String?>.value(),
      returnValueForMissingStub: Future<String?>.value(),
    ) as Future<String?>;
  }

  @override
  Future<void> delete({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    return super.noSuchMethod(
      Invocation.method(#delete, [], {
        #key: key,
        #iOptions: iOptions,
        #aOptions: aOptions,
        #lOptions: lOptions,
        #webOptions: webOptions,
        #mOptions: mOptions,
        #wOptions: wOptions,
      }),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> deleteAll({
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    return super.noSuchMethod(
      Invocation.method(#deleteAll, [], {
        #iOptions: iOptions,
        #aOptions: aOptions,
        #lOptions: lOptions,
        #webOptions: webOptions,
        #mOptions: mOptions,
        #wOptions: wOptions,
      }),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }
}

void main() {
  group('SecureStorageService', () {
    late SecureStorageService secureStorageService;
    late MockFlutterSecureStorage mockStorage;

    setUp(() {
      mockStorage = MockFlutterSecureStorage();
      secureStorageService = SecureStorageService(storage: mockStorage);
    });

    test('writeToken writes to storage', () async {
      when(mockStorage.write(key: 'key', value: 'value'))
          .thenAnswer((_) async {});

      await secureStorageService.writeToken('key', 'value');

      verify(mockStorage.write(key: 'key', value: 'value')).called(1);
    });

    test('readToken reads from storage', () async {
      when(mockStorage.read(key: 'key')).thenAnswer((_) async => 'value');

      final result = await secureStorageService.readToken('key');

      expect(result, 'value');
      verify(mockStorage.read(key: 'key')).called(1);
    });

    test('readToken returns null when storage has no value', () async {
      when(mockStorage.read(key: 'key')).thenAnswer((_) async => null);

      final result = await secureStorageService.readToken('key');

      expect(result, isNull);
      verify(mockStorage.read(key: 'key')).called(1);
    });

    test('deleteToken deletes from storage', () async {
      when(mockStorage.delete(key: 'key')).thenAnswer((_) async {});

      await secureStorageService.deleteToken('key');

      verify(mockStorage.delete(key: 'key')).called(1);
    });

    test('deleteAll deletes all from storage', () async {
      when(mockStorage.deleteAll()).thenAnswer((_) async {});

      await secureStorageService.deleteAll();

      verify(mockStorage.deleteAll()).called(1);
    });
  });
}
