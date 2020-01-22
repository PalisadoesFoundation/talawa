import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/model/user.dart';

class Preferences {
  static const tokenKey = "token";

  static Future<User> saveCurrentUser(Token token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User currentUser = new User.fromJson(token.parseJwt());
    await preferences.setString(tokenKey, (token.tokenString != null && token.tokenString.length > 0) ? token.tokenString : "");
    return currentUser;
  }

  static Future<User> getCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try{
      Token token = new Token(tokenString: preferences.getString(tokenKey) ?? "");
      return new User.fromJson(token.parseJwt());
    }catch(e){
      print(e);
    }
    return new User();
  }

  static Future<bool> clearUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try{
      preferences.remove(tokenKey);
    }catch(e){
      print(e);
      return false;
    }
    return true;
  }
}
