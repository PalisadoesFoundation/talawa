import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/token.dart';

class Preferences with ChangeNotifier {
  static const tokenKey = "token";
  static const refreshTokenKey = "refreshTokenKey";
  static const userId = "userId";
  static const currentOrgId = "currentOrgId";
  static const currentOrgImgSrc = "currentOrgImgSrc";
  static const currentOrgName = "currentOrgName";
  static const orgUrl = "orgUrl";
  static const userFName = "userFirstName";
  static const userLName = "userLastName";

  String orgName;
  String orgImgSrc;

  Future saveUserFName(String fName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userFName, fName);
  }

  Future<String> getUserFName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String fname = preferences.getString(userFName);
    notifyListeners();
    return fname;
  }

  Future saveUserLName(String lName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userLName, lName);
  }

  Future<String> getUserLName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String lname = preferences.getString(userLName);
    notifyListeners();
    return lname;
  }

  Future saveOrgUrl(String url) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgUrl, url);
  }

  Future<String> getOrgUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String url = preferences.getString(orgUrl);
    notifyListeners();
    return url;
  }

  Future saveCurrentOrgName(String currName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgName, currName);
  }

  Future<String> getCurrentOrgName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    orgName = preferences.getString(currentOrgName);
    notifyListeners();
    return orgName;
  }

  Future saveCurrentOrgImgSrc(String currImgSrc) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgImgSrc, currImgSrc);
  }

  Future<String> getCurrentOrgImgSrc() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    orgImgSrc = preferences.getString(currentOrgImgSrc);
    notifyListeners();
    return orgImgSrc;
  }

  Future saveCurrentOrgId(String currOrgId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgId, currOrgId);
  }

  Future<String> getCurrentOrgId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String currentId = preferences.getString(currentOrgId);
    notifyListeners();
    return currentId;
  }

  Future saveUserId(String userID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userId, userID);
  }

  Future<String> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString(userId);
    return uid;
  }

  Future saveToken(Token token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token.parseJwt();
    await preferences.setString(
        tokenKey,
        (token.tokenString != null && token.tokenString.length > 0)
            ? token.tokenString
            : "");
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userToken = preferences.getString(tokenKey);
    return userToken;
  }

  Future saveRefreshToken(Token token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token.parseJwt();
    await preferences.setString(
        refreshTokenKey,
        (token.tokenString != null && token.tokenString.length > 0)
            ? token.tokenString
            : "");
  }

  Future<String> getRefreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String refreshToken = preferences.getString(refreshTokenKey);
    return refreshToken;
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
      preferences.remove(currentOrgId);
      preferences.remove(refreshTokenKey);
      preferences.remove(userId);
      preferences.remove(currentOrgName);
      preferences.remove(currentOrgImgSrc);
      preferences.remove(orgUrl);
      preferences.remove(userFName);
      preferences.remove(userLName);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  static Future<bool> removeOrg() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      preferences.remove(currentOrgId);
      preferences.remove(currentOrgName);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
