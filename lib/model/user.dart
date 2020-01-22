class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String userImage;
  bool selected;

  User(
      {this.id = 0,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.userImage = "",
      this.selected = false});

  User.copy(User tUser) {
    this.id = tUser.id;
    this.firstName = tUser.firstName;
    this.lastName = tUser.lastName;
    this.email = tUser.email;
    this.userImage = tUser.userImage;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      userImage: json['userImage'],
    );
  }

  
}
