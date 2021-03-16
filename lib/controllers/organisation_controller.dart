import 'package:flutter/foundation.dart';

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