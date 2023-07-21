import 'dart:convert';
import 'package:crypto/crypto.dart';

class Encryptor {
  static bool shouldEncrypt = false;

  static String encryptString(String data) {
    if (!shouldEncrypt) return data;
    return sha256.convert(utf8.encode(data)).toString();
  }
}
