import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pointycastle/api.dart' as pointy;
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/asymetric_keys/asymetric_keys.dart';
import 'package:talawa/utils/encryptor.dart';

import '../helpers/setup_hive.mocks.dart';

// This test is being written believing that in future when Encryptor class will get rid of shouldEncrypt variable then all the tests using that variable can be removed
void main() {
  group('When shouldEncrypt is true', () {
    test('encryptString method should return the encrypted string', () {
      Encryptor.shouldEncrypt = true;
      const String inputString = 'password123';
      final String outputString =
          sha256.convert(utf8.encode(inputString)).toString();
      expect(Encryptor.encryptString(inputString), outputString);
    });
  });
// As the bool variable is not used anywhere except in this method so moving ahead with making this variable as false
// On getting rid of this variable the above test can be removed
  group('When shouldEncrypt is false', () {
    late Encryptor encryptor;
    late AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;
    late pointy.PublicKey publicKey;
    late MockHiveInterface mockHiveInterface;
    late MockBox<AsymetricKeys> mockHiveBox;
    late FakeFlutterSecureStorage fakeSecureStorage;
    setUpAll(() {
      encryptor = Encryptor();
      Encryptor.shouldEncrypt = false;
      keyPair = encryptor.generateRSAKeyPair();
      publicKey = keyPair.publicKey;
      mockHiveInterface = MockHiveInterface();
      mockHiveBox = MockBox();
      fakeSecureStorage = FakeFlutterSecureStorage();
    });
    test('encryptString method should return the same string', () {
      const String inputString = 'password123';
      expect(Encryptor.encryptString(inputString), inputString);
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
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((realInvocation) async {
        return mockHiveBox;
      });
      await encryptor.saveKeyPair(
        keyPair,
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );
      verify(mockHiveInterface.openBox(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      ));
      verify(mockHiveBox.put('key_pair', any));
    });
    test('For loadPairKey()', () async {
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((realInvocation) async {
        return mockHiveBox;
      });
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((realInvocation) => AsymetricKeys(keyPair: keyPair));
      await encryptor.loadKeyPair(
        mockHiveInterface,
        secureStorage: fakeSecureStorage,
      );
      verify(mockHiveBox.get('key_pair'));
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
      final decryptedBytes = cipher.process(base64Decode(output));
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
        base64Encode(encryptedBytes),
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
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((realInvocation) async {
        return mockHiveBox;
      });
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((realInvocation) => AsymetricKeys(keyPair: keyPair));
      expect(
        encryptor.receiveMessage(
          message,
          mockHiveInterface,
          secureStorage: fakeSecureStorage,
        ),
        throwsException,
      );
    });
    test('Encrypted Message sent to receiveMessage()', () {
      const String data = 'Hello Talawa';
      final cipher = OAEPEncoding(RSAEngine())
        ..init(true, PublicKeyParameter<RSAPublicKey>(keyPair.publicKey));
      final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
      final String encryptedMessge = base64Encode(encryptedBytes);
      final Map<String, dynamic> message = {
        "encryptedMessage": encryptedMessge,
      };
      when(mockHiveInterface.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: anyNamed('encryptionCipher'),
      )).thenAnswer((realInvocation) async {
        return mockHiveBox;
      });
      when(mockHiveBox.get('key_pair'))
          .thenAnswer((realInvocation) => AsymetricKeys(keyPair: keyPair));
      expect(
          encryptor.receiveMessage(
            message,
            mockHiveInterface,
            secureStorage: fakeSecureStorage,
          ),
          completes);
    });
  });
}

class FakeFlutterSecureStorage extends Fake implements FlutterSecureStorage {
  final Map<String, String> _storage = {};

  @override
  Future<String?> read({
    String? key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    return _storage[key];
  }

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _storage[key] = value!;
  }
}
