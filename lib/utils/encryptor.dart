import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/asymetric_keys/asymetric_keys.dart';

/// Handles all of the encryption tasks in the codebase.
class Encryptor {
  /// A global switch to flag the encryption.
  ///
  /// Since adding encryption invalidates all of the previous
  /// data, disabling it by default will help in keeping
  /// other contributors working without any issue.
  /// TODO: Remove this and make encryption default.
  static bool shouldEncrypt = false;

  /// Encrypts a given string with SHA256 Encryption.
  ///
  /// **params**:
  /// * `data`: The string data to encrypt
  ///
  /// **returns**:
  /// * `String`: SHA256 encrypted data
  static String encryptString(String data) {
    if (!shouldEncrypt) return data;
    return sha256.convert(utf8.encode(data)).toString();
  }

  /// Generates RSA Key Pairs (Public/Private).
  ///
  /// Should be called only during app's first initialization,
  /// and any future usage should be done by getting the keys
  /// from the local storage.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `AsymmetricKeyPair<PublicKey, PrivateKey>`: The generated
  /// public and private keys.
  AsymmetricKeyPair<PublicKey, PrivateKey> generateRSAKeyPair() {
    final secureRandom = FortunaRandom();
    final random = Random.secure();
    final List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
    final rsapars = RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64);
    final params = ParametersWithRandom(rsapars, secureRandom);
    final keyGenerator = RSAKeyGenerator();
    keyGenerator.init(params);
    return keyGenerator.generateKeyPair();
  }

  /// Returns a configured instance of [FlutterSecureStorage] with strict security options.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `FlutterSecureStorage`: Configured storage instance.
  FlutterSecureStorage _getConfiguredStorage() {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
  }

  /// Retrieves or generates a secure encryption key for Hive boxes.
  ///
  /// **params**:
  /// * `secureStorage`: Optional [FlutterSecureStorage] to override default.
  ///
  /// **returns**:
  /// * `Future<List<int>>`: A 256-bit encryption key.
  Future<List<int>> _getHiveEncryptionKey({
    FlutterSecureStorage? secureStorage,
  }) async {
    final storage = secureStorage ?? _getConfiguredStorage();
    final keyString = await storage.read(key: HiveKeys.encryptionKey);

    if (keyString != null) {
      try {
        final key = base64Url.decode(keyString);
        if (key.length == 32) {
          return key;
        }
        dev.log(
          'Invalid Hive encryption key length (${key.length}); rotating key',
          name: 'Encryptor',
        );
      } on FormatException catch (e, st) {
        dev.log(
          'Failed to decode Hive encryption key; rotating key',
          name: 'Encryptor',
          error: e,
          stackTrace: st,
        );
      }
    }

    final key = Hive.generateSecureKey();
    await storage.write(
      key: HiveKeys.encryptionKey,
      value: base64UrlEncode(key),
    );
    return key;
  }

  /// Opens the Hive box with encryption.
  ///
  /// If the box exists but is unencrypted (legacy), it migrates the data
  /// to a new encrypted box transparently.
  ///
  /// **params**:
  /// * `hive`: The [HiveInterface] instance.
  /// * `encryptionKey`: The 256-bit AES encryption key.
  ///
  /// **returns**:
  /// * `Future<Box<AsymetricKeys>>`: Opened and encrypted Hive box.
  Future<Box<AsymetricKeys>> _openOrMigrateBox(
    HiveInterface hive,
    List<int> encryptionKey,
  ) async {
    try {
      // Try to open encrypted
      return await hive.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    } catch (e) {
      // Fallback: Migration
      late final Box<AsymetricKeys> oldBox;
      try {
        // 1. Open unencrypted legacy box
        oldBox = await hive.openBox<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey);
      } catch (_) {
        // Not a legacy-unencrypted box; propagate the original failure.
        rethrow;
      }

      // 2. Cache data
      final data = Map<dynamic, AsymetricKeys>.from(oldBox.toMap());

      // 3. Close and delete legacy box
      await oldBox.close();
      await hive.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey);

      // 4. Create new encrypted box
      final newBox = await hive.openBox<AsymetricKeys>(
        HiveKeys.asymetricKeyBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );

      // 5. Restore data
      if (data.isNotEmpty) {
        await newBox.putAll(data);
      }
      return newBox;
    }
  }

  /// Saves the generated key pair to local storage.
  ///
  /// Any future usage of the keys must be initiated from here.
  ///
  /// **params**:
  /// * `keyPair`: [AsymmetricKeyPair] to save.
  /// * `hive`: The [HiveInterface] to store keys in.
  /// * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.
  ///
  /// **returns**:
  ///   None
  Future<void> saveKeyPair(
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
    HiveInterface hive, {
    FlutterSecureStorage? secureStorage,
  }) async {
    final encryptionKey =
        await _getHiveEncryptionKey(secureStorage: secureStorage);
    final keysBox = await _openOrMigrateBox(hive, encryptionKey);
    await keysBox.put('key_pair', AsymetricKeys(keyPair: keyPair));
  }

  /// Loads secret keys from the Hive db.
  ///
  /// **params**:
  /// * `hive`: The [HiveInterface] to load keys from.
  /// * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.
  ///
  /// **returns**:
  /// * `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
  /// private key pair
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
    HiveInterface hive, {
    FlutterSecureStorage? secureStorage,
  }) async {
    final encryptionKey =
        await _getHiveEncryptionKey(secureStorage: secureStorage);
    final keysBox = await _openOrMigrateBox(hive, encryptionKey);
    final keyPairWrapper = keysBox.get('key_pair');

    if (keyPairWrapper == null) {
      throw Exception('No key pair found in secure store — generate new keys');
    }

    return keyPairWrapper.keyPair;
  }

  /// Deletes the key pair and the encryption key from storage.
  ///
  /// Should be called on logout to ensure clean state.
  ///
  /// **params**:
  /// * `hive`: Optional [HiveInterface] to override default global Hive.
  /// * `secureStorage`: Optional [FlutterSecureStorage] to override default.
  ///
  /// **returns**:
  ///   None
  Future<void> deleteKeyPair({
    HiveInterface? hive,
    FlutterSecureStorage? secureStorage,
  }) async {
    final storage = secureStorage ?? _getConfiguredStorage();
    final hiveInstance = hive ?? Hive;

    if (hiveInstance.isBoxOpen(HiveKeys.asymetricKeyBoxKey)) {
      try {
        await hiveInstance
            .box<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey)
            .close();
      } catch (e, st) {
        // Ignore close errors but log them
        debugPrint('Failed to close asymmetric key box: $e\nStack trace: $st');
      }
    }
    try {
      await hiveInstance.deleteBoxFromDisk(HiveKeys.asymetricKeyBoxKey);
    } catch (e, stackTrace) {
      // Ignore delete from disk errors but log them
      debugPrint(
          'Failed to delete asymmetric key box from disk: $e\nStack trace: $stackTrace');
    }

    try {
      await storage.delete(key: HiveKeys.encryptionKey);
    } catch (e, stackTrace) {
      dev.log('Failed to delete encryption key from storage',
          name: 'Encryptor', error: e, stackTrace: stackTrace);
    }
  }

  /// Encrypts the given string data with Recipient's Public Key.
  ///
  /// **params**:
  /// * `data`: The string to encrypt
  /// * `recipientPublicKey`: Key to be used to encrypt. Recipient's public
  /// key in our case.
  ///
  /// **returns**:
  /// * `String`: Encrypted string
  String assymetricEncryptString(String data, RSAPublicKey recipientPublicKey) {
    final cipher = OAEPEncoding(RSAEngine())
      ..init(true, PublicKeyParameter<RSAPublicKey>(recipientPublicKey));

    final encryptedBytes = cipher.process(Uint8List.fromList(data.codeUnits));
    return base64Encode(encryptedBytes);
  }

  /// Encrypts the given string data with user's Private Key.
  ///
  /// **params**:
  /// * `data`: The string to decrypt
  /// * `privateKey`: Key to be used to decrypt. User's private key in our case.
  ///
  /// **returns**:
  /// * `String`: Decrypted string
  String assymetricDecryptString(String data, RSAPrivateKey privateKey) {
    final cipher = OAEPEncoding(RSAEngine())
      ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

    final decryptedBytes = cipher.process(base64Decode(data));
    return String.fromCharCodes(decryptedBytes);
  }

  // TODO: Use this somewhere

  /// Helper function to decrypt the message.
  ///
  /// Internally uses the [loadKeyPair] function to get private key and
  /// [assymetricDecryptString] to decrypt the given message.
  ///
  /// **params**:
  /// * `message`: Message object containing a field named [encryptedMessage]
  /// which is supposed to contained user's message in encrypted format.
  /// * `hive`: The [HiveInterface] to store things in.
  /// * `secureStorage`: Optional [FlutterSecureStorage] for storing the encryption key.
  ///
  /// **returns**:
  ///   None
  Future<void> receiveMessage(
    Map<String, dynamic> message,
    HiveInterface hive, {
    FlutterSecureStorage? secureStorage,
  }) async {
    try {
      final encryptedMessage = message['encryptedMessage'] as String;
      final privateKey =
          (await loadKeyPair(hive, secureStorage: secureStorage)).privateKey;
      final decryptedMessage = assymetricDecryptString(
        encryptedMessage,
        privateKey as RSAPrivateKey,
      );

      print('Decrypted Message: $decryptedMessage');
    } catch (e) {
      throw Exception('Error');
    }
  }
}
