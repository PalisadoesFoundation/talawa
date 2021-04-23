class UserInfo {
  static int userOrg = 0;
  static List orgList = [];

  int get currentOrg => userOrg;
  List get currentOrgList => orgList;

  set currentOrg(int val) {
    userOrg = val;
  }

  set currentOrgList(List val) {
    orgList = val;
    print(orgList);
  }
}
