import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  static const orgImgUrl = "orgUrl";
  static const userFName = "userFirstName";
  static const userLName = "userLastName";

  String orgName;
  String orgImgSrc;

  //it saves the user first name
  Future saveUserFName(String fName) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userFName, fName);
  }

  //it gets the user first name
  Future<String> getUserFName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String fname = preferences.getString(userFName);
    notifyListeners();
    return fname;
  }

  //saves the user last name
  Future saveUserLName(String lName) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userLName, lName);
  }

  //gets the user last name
  Future<String> getUserLName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String lname = preferences.getString(userLName);
    notifyListeners();
    return lname;
  }

  //saves the organization url
  Future saveOrgImgUrl(String url) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgImgUrl, url);
  }

  //get the organization url
  Future<String> getOrgImgUrl() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String url = preferences.getString(orgImgUrl);
    notifyListeners();
    return url;
  }

  //saves the organization url
  Future saveOrgUrl(String url) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgUrl, url);
  }

  //get the organization url
  Future<String> getOrgUrl() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String url = preferences.getString(orgUrl);
    notifyListeners();
    return url;
  }

  //saves the current organization name
  Future saveCurrentOrgName(String currName) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgName, currName);
  }

  //get the current organization name
  Future<String> getCurrentOrgName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    orgName = preferences.getString(currentOrgName);
    notifyListeners();
    return orgName;
  }

  //saves the current organization image source
  Future saveCurrentOrgImgSrc(String currImgSrc) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgImgSrc, currImgSrc);
  }

  //gets the current organization image source
  Future<String> getCurrentOrgImgSrc() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    orgImgSrc = preferences.getString(currentOrgImgSrc);
    notifyListeners();
    return orgImgSrc;
  }

  //saves the current organization id
  Future saveCurrentOrgId(String currOrgId) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgId, currOrgId);
  }

  //get the current organization id
  Future<String> getCurrentOrgId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String currentId = preferences.getString(currentOrgId);
    notifyListeners();
    return currentId;
  }

  //saves the user id
  Future saveUserId(String userID) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userId, userID);
  }

  //gets the user id
  Future<String> getUserId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String uid = preferences.getString(userId);
    return uid;
  }

  //saves the current token
  Future saveToken(Token token) async {
    const storage = FlutterSecureStorage();
    token.parseJwt();
    await storage.write(
        key: tokenKey,
        value: (token.tokenString != null && token.tokenString.isNotEmpty)
            ? token.tokenString
            : "");
    //print("Saved token");
  }

  //gets the current token
  Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final String userToken = await storage.read(key: tokenKey);
    //print("getToken");
    return userToken;
  }

  //saves the refreshed token
  Future saveRefreshToken(Token token) async {
    const storage = FlutterSecureStorage();
    token.parseJwt();
    await storage.write(
        key: refreshTokenKey,
        value: (token.tokenString != null && token.tokenString.isNotEmpty)
            ? token.tokenString
            : "");
    //print("Saved refresh token");
  }

  //get the refreshed token
  Future<String> getRefreshToken() async {
    const storage = FlutterSecureStorage();
    final String refreshToken = await storage.read(key: refreshTokenKey);
    //print("Got refresh token");
    return refreshToken;
  }

  //get the current user id
  static Future<int> getCurrentUserId() async {
    const storage = FlutterSecureStorage();
    try {
      final Token token =
          Token(tokenString: await storage.read(key: tokenKey) ?? "");
      final Map<String, dynamic> tokenMap = token.parseJwt();
      //print("Got uid");
      return tokenMap['id'] as int;
    } catch (e) {
      print(e);
    }
    return -1;
  }

  //clears the user
  static Future<bool> clearUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    const storage = FlutterSecureStorage();
    try {
      await storage.delete(key: tokenKey);
      //print("Delete token");
      preferences.remove(currentOrgId);
      await storage.delete(key: refreshTokenKey);
      //print("Refresh token");
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

  //removes the organization
  static Future<bool> removeOrg() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
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
