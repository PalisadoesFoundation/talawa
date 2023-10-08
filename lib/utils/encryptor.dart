import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/random/fortuna_random.dart';

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
    final keyGen = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64);
    final secureRandom = FortunaRandom();
    final random = SecureRandom('Fortuna')
      ..seed(secureRandom as CipherParameters);
    final keyGenParams = ParametersWithRandom(keyGen, random);

    final keyGenerator = KeyGenerator('RSA');
    keyGenerator.init(keyGenParams);

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
  ) async {
    // TODO: Implement secure storage here

    await Hive.openBox<AsymmetricKeyPair<PublicKey, PrivateKey>>('user_keys');
    final keysBox = await Hive.openBox('user_keys');

    keysBox.put('key_pair', keyPair);
  }

  /// Loads secret keys from the Hive db.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<AsymmetricKeyPair<PublicKey, PrivateKey>>`: The public and
  /// private key pair
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>> loadKeyPair() async {
    await Hive.openBox<AsymmetricKeyPair<PublicKey, PrivateKey>>('user_keys');
    final keysBox = await Hive.openBox('user_keys');

    return (await keysBox.get('key_pair'))
        as AsymmetricKeyPair<PublicKey, PrivateKey>;
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
  Future<void> receiveMessage(Map<String, dynamic> message) async {
    final privateKey = (await loadKeyPair()).privateKey;

    final encryptedMessage = message['encryptedMessage'] as String;
    final decryptedMessage = assymetricDecryptString(
      encryptedMessage,
      privateKey as RSAPrivateKey,
    );

    print('Decrypted Message: $decryptedMessage');
  }
}
