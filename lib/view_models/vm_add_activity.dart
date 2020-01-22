class AddActivityViewModel {
  String title;
  String datetime;
  String description;
  int admin;
  List<int> users;

  AddActivityViewModel(
      {this.title, this.datetime, this.description, this.admin, this.users});
}
