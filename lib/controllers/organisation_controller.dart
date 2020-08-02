import 'package:flutter/foundation.dart';
import 'package:talawa/services/preferences.dart';

class OrgController with ChangeNotifier{
  int currentOrg = 0;
  List orgList = [];
  Preferences preferences = Preferences();



  void currentOrganisation(int val){
    print(val);
    currentOrg = val;
    notifyListeners();
  }


  void createOrgList(List val){
    print(val);
    orgList = val;
    notifyListeners();
  }


}