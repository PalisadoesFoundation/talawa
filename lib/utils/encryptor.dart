import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/random/fortuna_random.dart';
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

  /// Saves the generated key pair to local storage.
  ///
  /// Any future usage of the keys must be initiated from here.
  ///
  /// **params**:
  /// * `keyPair`: [AsymmetricKeyPair] to save.
  ///
  /// **returns**:
  /// * `Future<void>`: None
  Future<void> saveKeyPair(
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair,
    HiveInterface hiveInterface,
  ) async {
    // TODO: Implement secure storage here
    final Box<AsymetricKeys> keysBox =
        await hiveInterface.openBox<AsymetricKeys>('user_keys');
    keysBox.put('key_pair', AsymetricKeys(keyPair: keyPair));
  }

  /// Loads secret keys from the Hive db.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
  /// private key pair
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair(
    HiveInterface hive,
  ) async {
    final keysBox = await hive.openBox<AsymetricKeys>('user_keys');
    return keysBox.get('key_pair')!.keyPair;
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

  /// Helper function to decrypt the message.
  ///
  /// Internally uses the [loadKeyPair] function to get private key and
  /// [assymetricDecryptString] to decrypt the given message.
  ///
  /// **params**:
  /// * `message`: Message object containing a field named [encryptedMessage]
  /// which is supposed to contained user's message in encrypted format.
  ///
  /// **returns**:
  /// * `Future<void>`: None
  /// TODO: Use this somewhere
  Future<void> receiveMessage(
    Map<String, dynamic> message,
    HiveInterface hive,
  ) async {
    try {
      final encryptedMessage = message['encryptedMessage'] as String;
      final privateKey = (await loadKeyPair(hive)).privateKey;
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
