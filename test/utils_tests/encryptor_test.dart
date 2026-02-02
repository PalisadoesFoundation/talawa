import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:pointycastle/api.dart' as pointy;
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/asymetric_keys/asymetric_keys.dart';
import 'package:talawa/utils/encryptor.dart';

import '../helpers/setup_hive.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Encryptor Tests', () {
    late Encryptor encryptor;
    late AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;
    late pointy.PublicKey publicKey;
    late MockHiveInterface mockHiveInterface;
    late MockBox<AsymetricKeys> mockHiveBox;
    late FakeFlutterSecureStorage fakeSecureStorage;

    // Helper method to setup common mock behavior for openBox
    void setupMockOpenBox() {
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((_) async => mockHiveBox);
    }

    setUp(() {
      encryptor = Encryptor();

      keyPair = encryptor.generateRSAKeyPair();
      publicKey = keyPair.publicKey;
      mockHiveInterface = MockHiveInterface();
      mockHiveBox = MockBox();
      fakeSecureStorage = FakeFlutterSecureStorage();
    });

    test(
        'Correct security options are added while generating keys from generateRSAKeyPair method',
        () {
      expect(publicKey, isA<RSAPublicKey>());
      final RSAPublicKey key = publicKey as RSAPublicKey;
      expect(key.publicExponent, BigInt.parse('65537'));
      expect(key.modulus!.bitLength, 2048);
    });
    test(
        'Checking whether Box Names and Key Names are appropriate for Hive or not',
        () async {
      setupMockOpenBox();
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );
      final uniqueCaptures = verify(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: captureAnyNamed('encryptionCipher'),
      )).captured;
      expect(uniqueCaptures.last, isA<HiveAesCipher>());
      verify(mockHiveBox.put('key_pair', any)).called(1);

      // Verify encryption key is stored and correct length
      final storedKey =
          await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
      expect(storedKey, isNotNull);
      final keyBytes = base64Url.decode(storedKey!);
      expect(keyBytes.length, 32); // AES-256 requires 32 bytes
    });

    test('Should regenerate key if stored key has invalid length', () async {
      // Setup: Key with incorrect length (16 bytes instead of 32)
      final invalidLengthKey = List<int>.generate(16, (i) => i);
      final invalidValue = base64Url.encode(invalidLengthKey);
      await fakeSecureStorage.write(
          key: HiveKeys.encryptionKey, value: invalidValue);
      setupMockOpenBox();

      // Act
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );

      // Assert
      final storedKey =
          await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
      expect(storedKey, isNotNull);
      // Ensure key was replaced
      expect(storedKey, isNot(invalidValue));
      final keyBytes = base64Url.decode(storedKey!);
      expect(keyBytes.length, 32);
    });

    test('Should regenerate key if stored key is not valid base64', () async {
      // Setup: Corrupted content (not base64)
      await fakeSecureStorage.write(
          key: HiveKeys.encryptionKey, value: 'not-valid-base64');
      setupMockOpenBox();

      // Act
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );

      // Assert
      final storedKey =
          await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
      expect(storedKey, isNotNull);
      expect(storedKey, isNot('not-valid-base64'));
      final keyBytes = base64Url.decode(storedKey!);
      expect(keyBytes.length, 32);
    });

    test('Should regenerate key if stored key throws FormatException',
        () async {
      // Setup: Invalid characters that definitely throw FormatException for base64Url
      await fakeSecureStorage.write(
          key: HiveKeys.encryptionKey, value: '%%%%%');
      setupMockOpenBox();

      // Act
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );

      // Assert
      final storedKey =
          await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
      expect(storedKey, isNotNull);
      expect(storedKey, isNot('%%%%%'));
      final keyBytes = base64Url.decode(storedKey!);
      expect(keyBytes.length, 32);
    });
    test('For loadPairKey()', () async {
      setupMockOpenBox();
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((_) => AsymetricKeys(keyPair: keyPair));
      await encryptor.loadKeyPair(
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );
      final uniqueCaptures = verify(mockHiveInterface.openBox(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: captureAnyNamed('encryptionCipher'),
      )).captured;
      expect(uniqueCaptures.last, isA<HiveAesCipher>());
      verify(mockHiveBox.get('key_pair')).called(1);

      // Verify encryption key is checked in storage
      final storedKey =
          await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
      expect(storedKey, isNotNull);
      final keyBytes = base64Url.decode(storedKey!);
      expect(keyBytes.length, 32);
    });
    test(
        'For checking whether the data is properly encrypted through RSA by assymetricEncryptString()',
        () {
      const String data = 'Hello Talawa';
      final output = encryptor.assymetricEncryptString(
        data,
        keyPair.publicKey as RSAPublicKey,
      );
      final cipher = OAEPEncoding(RSAEngine())
        ..init(false, PrivateKeyParameter<RSAPrivateKey>(keyPair.privateKey));
      final decryptedBytes = cipher.process(base64Url.decode(output));
      expect(String.fromCharCodes(decryptedBytes), data);
    });
    test(
        'For checking whether the data is getting decrypted properly through assymetricDecryptString()',
        () {
      const String data = 'Hello Talawa';
      final cipher = OAEPEncoding(RSAEngine())
        ..init(true, PublicKeyParameter<RSAPublicKey>(keyPair.publicKey));
      final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
      final output = encryptor.assymetricDecryptString(
        base64Url.encode(encryptedBytes),
        keyPair.privateKey as RSAPrivateKey,
      );
      expect(output, data);
    });
    test('Test for wrong message sent to receiveMessage()', () {
      const Map<String, dynamic> message = {"message": "Hello Talawa"};
      expect(
        encryptor.receiveMessage(message, mockHiveInterface),
        throwsException,
      );
    });
    test('Unencrypted message sent to receiveMessage()', () {
      const Map<String, dynamic> message = {"encryptedMessage": "Hello Talawa"};
      setupMockOpenBox();
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((_) => AsymetricKeys(keyPair: keyPair));
      expect(
        encryptor.receiveMessage(
          message,
          mockHiveInterface,
          secureStorage: fakeSecureStorage,
        ),
        throwsException,
      );
    });
    test('Encrypted Message sent to receiveMessage()', () async {
      const String data = 'Hello Talawa';
      final cipher = OAEPEncoding(RSAEngine())
        ..init(true, PublicKeyParameter<RSAPublicKey>(keyPair.publicKey));
      final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
      final String encryptedMessge = base64Url.encode(encryptedBytes);
      final Map<String, dynamic> message = {
        "encryptedMessage": encryptedMessge,
      };
      setupMockOpenBox();
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((_) => AsymetricKeys(keyPair: keyPair));
      await encryptor.receiveMessage(
        message,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );
      final uniqueCaptures = verify(mockHiveInterface.openBox(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: captureAnyNamed('encryptionCipher'),
      )).captured;
      expect(uniqueCaptures.last, isA<HiveAesCipher>());
      verify(mockHiveBox.get('key_pair')).called(1);
    });

    test(
        'Migration: Should delete legacy box and reopen encrypted if legacy open succeeds',
        () async {
      var openBoxCallCount = 0;
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: argThat(isNotNull, named: 'encryptionCipher'),
      )).thenAnswer((_) async {
        openBoxCallCount++;
        if (openBoxCallCount == 1) throw HiveError('Encrypted open failed');
        return mockHiveBox;
      });

      final oldBox = MockHiveBox<AsymetricKeys>();
      when(oldBox.toMap())
          .thenReturn({'key_pair': AsymetricKeys(keyPair: keyPair)});
      when(oldBox.close()).thenAnswer((_) => Future.value());

      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: null,
      )).thenAnswer((_) => Future.value(oldBox));

      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );

      verify(mockHiveInterface.openBox<AsymetricKeys>(
              HiveKeys.asymetricKeyBoxKey,
              encryptionCipher: null))
          .called(1);
      verify(oldBox.close()).called(1);
      verify(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
          .called(1);

      // Verify data restoration
      verify(mockHiveBox
          .putAll(argThat(predicate<Map<dynamic, AsymetricKeys>>((map) {
        final restoredKeys = map['key_pair'];
        return restoredKeys !=
            null; // Verify functionality, not exact object equality due to wrapper
      })))).called(1);
    });

    test('Migration: Should handle empty legacy box correctly', () async {
      // Setup: Encrypted open fails
      var openBoxCallCount = 0;
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: argThat(isNotNull, named: 'encryptionCipher'),
      )).thenAnswer((_) async {
        openBoxCallCount++;
        if (openBoxCallCount == 1) throw HiveError('Encrypted open failed');
        return mockHiveBox;
      });

      // Setup: Legacy open succeeds but returns empty box
      final oldBox = MockHiveBox<AsymetricKeys>();
      when(oldBox.toMap()).thenReturn({}); // EMPTY MAP
      when(oldBox.close()).thenAnswer((_) => Future.value());

      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: null,
      )).thenAnswer((_) => Future.value(oldBox));

      // Act
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );

      // Assert
      verify(mockHiveInterface.openBox<AsymetricKeys>(
              HiveKeys.asymetricKeyBoxKey,
              encryptionCipher: null))
          .called(1);
      verify(oldBox.close()).called(1);
      verify(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
          .called(1);

      // Verify putAll is NOT called because map was empty
      verifyNever(mockHiveBox.putAll(any));
    });

    test(
        'Migration Failure: Should rethrow exception if legacy open also fails',
        () {
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: argThat(isNotNull, named: 'encryptionCipher'),
      )).thenThrow(HiveError('Original Encrypted Error'));

      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: null,
      )).thenThrow(HiveError('Legacy Open Error'));

      expect(
        () async => await encryptor.saveKeyPair(
          keyPair,
          mockHiveInterface,
          secureStorage: fakeSecureStorage,
        ),
        throwsA(predicate(
            (e) => e is HiveError && e.message == 'Legacy Open Error')),
      );
    });

    test('loadKeyPair: Should throw specific exception if key_pair is null',
        () {
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((_) => Future.value(mockHiveBox));

      when(mockHiveBox.get('key_pair')).thenReturn(null);

      expect(
        () async => await encryptor.loadKeyPair(
          mockHiveInterface,
          secureStorage: fakeSecureStorage,
        ),
        throwsA(predicate(
            (e) => e.toString().contains('No key pair found in secure store'))),
      );
    });

    group('deleteKeyPair:', () {
      test(
          'Should close box if open, delete from disk, and remove encryption key',
          () async {
        // Setup mocks
        when(mockHiveInterface.isBoxOpen(HiveKeys.asymetricKeyBoxKey))
            .thenReturn(true);
        when(mockHiveInterface.box<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey))
            .thenReturn(mockHiveBox);
        when(mockHiveBox.close()).thenAnswer((_) => Future.value());
        when(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .thenAnswer((_) => Future.value());

        // Pre-fill secure storage
        await fakeSecureStorage.write(
            key: HiveKeys.encryptionKey, value: 'some_key');

        // Act
        await encryptor.deleteKeyPair(
          hive: mockHiveInterface,
          secureStorage: fakeSecureStorage,
        );

        // Assert
        verify(mockHiveInterface.isBoxOpen(HiveKeys.asymetricKeyBoxKey))
            .called(1);
        verify(mockHiveInterface
                .box<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey))
            .called(1);
        verify(mockHiveBox.close()).called(1);
        verify(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .called(1);

        final storedKey =
            await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
        expect(storedKey, isNull);
      });

      test(
          'Should suppress exceptions during close/delete and still remove storage key',
          () async {
        // Setup mocks: box opens but close() THROWS
        when(mockHiveInterface.isBoxOpen(HiveKeys.asymetricKeyBoxKey))
            .thenReturn(true);
        when(mockHiveInterface.box<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey))
            .thenReturn(mockHiveBox);
        when(mockHiveBox.close()).thenThrow(Exception('Failed to close'));
        when(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .thenThrow(Exception('Failed to delete disk'));

        // Pre-fill secure storage
        await fakeSecureStorage.write(
            key: HiveKeys.encryptionKey, value: 'some_key');

        // Act
        // Should NOT throw
        await encryptor.deleteKeyPair(
          hive: mockHiveInterface,
          secureStorage: fakeSecureStorage,
        );

        // Assert
        verify(mockHiveBox.close()).called(1);
        verify(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .called(1);

        // Verify key is STILL removed despite exceptions above
        final storedKey =
            await fakeSecureStorage.read(key: HiveKeys.encryptionKey);
        expect(storedKey, isNull);
      });

      test('Should suppress exception if storage key deletion fails', () async {
        // Setup mocks
        when(mockHiveInterface.isBoxOpen(HiveKeys.asymetricKeyBoxKey))
            .thenReturn(false);
        when(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .thenAnswer((_) => Future.value());

        // Setup storage delete to throw
        final throwingStorage = ThrowingFlutterSecureStorage();

        // Act - Should not throw
        await encryptor.deleteKeyPair(
          hive: mockHiveInterface,
          secureStorage: throwingStorage,
        );

        // Verify other steps still happened
        verify(mockHiveInterface.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey))
            .called(1);
      });
    });
  });

  group('Default Parameter Coverage', () {
    late Encryptor encryptor;
    late MockHiveInterface mockHiveInterface;
    late FakeFlutterSecureStorage fakeSecureStorage;
    late Directory tempDir;

    setUp(() async {
      encryptor = Encryptor();
      mockHiveInterface = MockHiveInterface();
      fakeSecureStorage = FakeFlutterSecureStorage();
      tempDir = await Directory.systemTemp.createTemp();
      Hive.init(tempDir.path);
    });

    tearDown(() async {
      await Hive.close();
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('deleteKeyPair should use default Hive when receiving null', () async {
      // Open the box first to ensure there's something to close/delete
      // Note: encryptor uses the global 'Hive' instance which we initialized
      await Hive.openBox<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey);
      expect(Hive.isBoxOpen(HiveKeys.asymetricKeyBoxKey), isTrue);

      await encryptor.deleteKeyPair(
        hive: null,
        secureStorage: fakeSecureStorage,
      );

      // Verify the global Hive instance was affected
      expect(Hive.isBoxOpen(HiveKeys.asymetricKeyBoxKey), isFalse);
    });

    test('loadKeyPair should use default storage when receiving null', () {
      expect(
        () => encryptor.loadKeyPair(
          mockHiveInterface,
          secureStorage: null,
        ),
        throwsException,
      );
    });
  });
}

class FakeFlutterSecureStorage extends Fake implements FlutterSecureStorage {
  final Map<String, String> _storage = {};

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    return _storage[key];
  }

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
  }) async {
    if (value == null) {
      _storage.remove(key);
    } else {
      _storage[key] = value;
    }
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
  }) async {
    _storage.remove(key);
  }

  @override
  Future<void> deleteAll({
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _storage.clear();
  }
}

class ThrowingFlutterSecureStorage extends FakeFlutterSecureStorage {
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
    return Future.error(Exception('Simulated delete failure'));
  }
}
