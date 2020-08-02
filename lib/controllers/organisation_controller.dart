import 'package:flutter/foundation.dart';
import 'package:talawa/services/preferences.dart';

class OrgController with ChangeNotifier{
  int currentOrg = 0;
  String value = '';



  void currentOrganisation(int val){
    currentOrg = val;
    notifyListeners();
  }


  void setOrgList(List val){
    value = val.toString();
    notifyListeners();
  }


}