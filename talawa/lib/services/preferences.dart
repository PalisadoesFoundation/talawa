import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/user.dart';

class Preferences {
  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static Future<User> saveCurrentUser(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User currentUser = new User.fromJson(parseJwt(token));
    await preferences.setString(token, (token != null && token.length > 0) ? token : "");
    return currentUser;
  }
}
