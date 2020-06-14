import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/token.dart';

class Preferences {
  static const tokenKey = "token";

  static Future<String> saveCurrentUserToken(Token token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> tokenMap = token.parseJwt();
    String userToken = tokenMap['token'];
    await preferences.setString(
        tokenKey,
        (token.tokenString != null && token.tokenString.length > 0)
            ? token.tokenString
            : "");
    return userToken;
  }

  static Future<int> getCurrentUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      Token token =
          new Token(tokenString: preferences.getString(tokenKey) ?? "");
      Map<String, dynamic> tokenMap = token.parseJwt();
      return tokenMap['id'];
    } catch (e) {
      print(e);
    }
    return -1;
  }

  static Future<bool> clearUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      preferences.remove(tokenKey);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
