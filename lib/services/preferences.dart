import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/token.dart';

class Preferences with ChangeNotifier {
  static const tokenKey = 'token';
  static const refreshTokenKey = 'refreshTokenKey';
  static const userId = 'userId';
  static const currentOrgId = 'currentOrgId';
  static const currentOrgImgSrc = 'currentOrgImgSrc';
  static const currentOrgName = 'currentOrgName';
  static const orgUrl = 'orgUrl';
  static const orgImgUrl = 'orgUrl';
  static const userFName = 'userFirstName';
  static const userLName = 'userLastName';

  String orgName;
  String orgImgSrc;


  //it saves the user first name
  Future saveUserFName(String fName) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(userFName, fName);
  }


  //it gets the user first name
  Future<String> getUserFName() async {
    var preferences = await SharedPreferences.getInstance();
    var fname = preferences.getString(userFName);
    notifyListeners();
    return fname;
  }


  //saves the user last name
  Future saveUserLName(String lName) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(userLName, lName);
  }


  //gets the user last name
  Future<String> getUserLName() async {
    var preferences = await SharedPreferences.getInstance();
    var lname = preferences.getString(userLName);
    notifyListeners();
    return lname;
  }

  //saves the organization url
  Future saveOrgImgUrl(String url) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgImgUrl, url);
  }


  //get the organization url
  Future<String> getOrgImgUrl() async {
    var preferences = await SharedPreferences.getInstance();
    var url = preferences.getString(orgImgUrl);
    notifyListeners();
    return url;
  }


  //saves the organization url
  Future saveOrgUrl(String url) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(orgUrl, url);
  }


  //get the organization url
  Future<String> getOrgUrl() async {
    var preferences = await SharedPreferences.getInstance();
    var url = preferences.getString(orgUrl);
    notifyListeners();
    return url;
  }


  //saves the current organization name
  Future saveCurrentOrgName(String currName) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgName, currName);
  }

  //get the current organization name
  Future<String> getCurrentOrgName() async {
    var preferences = await SharedPreferences.getInstance();
    orgName = preferences.getString(currentOrgName);
    notifyListeners();
    return orgName;
  }


  //saves the current organization image source
  Future saveCurrentOrgImgSrc(String currImgSrc) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgImgSrc, currImgSrc);
  }


  //gets the current organization image source
  Future<String> getCurrentOrgImgSrc() async {
    var preferences = await SharedPreferences.getInstance();
    orgImgSrc = preferences.getString(currentOrgImgSrc);
    notifyListeners();
    return orgImgSrc;
  }


  //saves the current organization id
  Future saveCurrentOrgId(String currOrgId) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(currentOrgId, currOrgId);
  }


  //get the current organization id
  Future<String> getCurrentOrgId() async {
    var preferences = await SharedPreferences.getInstance();
    var currentId = preferences.getString(currentOrgId);
    notifyListeners();
    return currentId;
  }


  //saves the user id
  Future saveUserId(String userID) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(userId, userID);
  }


  //gets the user id
  Future<String> getUserId() async {
    var preferences = await SharedPreferences.getInstance();
    var uid = preferences.getString(userId);
    return uid;
  }


  //saves the current token
  Future saveToken(Token token) async {
    var preferences = await SharedPreferences.getInstance();
    token.parseJwt();
    await preferences.setString(
        tokenKey,
        (token.tokenString != null && token.tokenString.isNotEmpty)
            ? token.tokenString
            : '');
  }


  //gets the current token
  Future<String> getToken() async {
    var preferences = await SharedPreferences.getInstance();
    var userToken = preferences.getString(tokenKey);
    return userToken;
  }


  //saves the refreshed token
  Future saveRefreshToken(Token token) async {
    var preferences = await SharedPreferences.getInstance();
    token.parseJwt();
    await preferences.setString(
        refreshTokenKey,
        (token.tokenString != null && token.tokenString.isNotEmpty)
            ? token.tokenString
            : '');
  }


  //get the refreshed token
  Future<String> getRefreshToken() async {
    var preferences = await SharedPreferences.getInstance();
    var refreshToken = preferences.getString(refreshTokenKey);
    return refreshToken;
  }


  //get the current user id
  static Future<int> getCurrentUserId() async {
    var preferences = await SharedPreferences.getInstance();
    try {
      var token =
          Token(tokenString: preferences.getString(tokenKey) ?? '');
      var tokenMap = token.parseJwt();
      return tokenMap['id'];
    } catch (e) {
      print(e);
    }
    return -1;
  }


  //clears the user
  static Future<bool> clearUser() async {
    var preferences = await SharedPreferences.getInstance();
    try {
      await preferences.remove(tokenKey);
      await preferences.remove(currentOrgId);
      await preferences.remove(refreshTokenKey);
      await preferences.remove(userId);
      await preferences.remove(currentOrgName);
      await preferences.remove(currentOrgImgSrc);
      await preferences.remove(orgUrl);
      await preferences.remove(userFName);
      await preferences.remove(userLName);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }


  //removes the organization
  static Future<bool> removeOrg() async {
    var preferences = await SharedPreferences.getInstance();
    try {
      await preferences.remove(currentOrgId);
      await preferences.remove(currentOrgName);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
