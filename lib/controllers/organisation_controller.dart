import 'package:flutter/foundation.dart';

class OrgController with ChangeNotifier{
  String value = '';

  void currentOrganisation(String val){
    print(val);
    value = val;
    notifyListeners();
  }

}