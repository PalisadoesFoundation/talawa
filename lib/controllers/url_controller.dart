import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UrlController with ChangeNotifier {
  String dropdownValue = 'HTTP';

  /// Getter for drop down value
  String get getDropDownValue {
    return dropdownValue;
  }

  // Set the dropdown either to ["HTTP", "HTTPS"]
  void setDropDownValue(String val) {
    dropdownValue = val;
    notifyListeners();
  }

  // Check wheather the Url specified by user exists or not
  Future<void> checkAndSetUrl({@required String text}) async {
    try {
      await http.get('${dropdownValue.toLowerCase()}://$text/');
      print('object');
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }
}
