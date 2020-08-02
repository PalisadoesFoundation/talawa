import 'package:flutter/foundation.dart';
import 'package:talawa/services/preferences.dart';

class OrgController with ChangeNotifier{
  int currentOrg = 0;
  String value = '';



  void currentOrganisation(int val){
    print(val);
    currentOrg = val;
    notifyListeners();
  }


  void setOrgList(List val){
    print(val);
    value = val.toString();
    notifyListeners();
  }


}