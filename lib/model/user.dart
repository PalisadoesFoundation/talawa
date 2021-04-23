//model class for an user
class User {
  User(
      {this.id = 0,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.userImage = "",
      this.selected = false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['firstName'].toString(),
      lastName: json['lastName'].toString(),
      email: json['email'].toString(),
      userImage: json['userImage'].toString(),
    );
  }

  User.copy(User tUser) {
    this.id = tUser.id;
    this.firstName = tUser.firstName;
    this.lastName = tUser.lastName;
    this.email = tUser.email;
    this.userImage = tUser.userImage;
  }

  int id;
  String firstName;
  String lastName;
  String email;
  String userImage;
  bool selected;
}
