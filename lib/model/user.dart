class User{
  String id;
  String firstName;
  String lastName;
  String email;
  String userImage;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.userImage
  });

  User.copy(User tUser){
    this.id = tUser.id;
    this.firstName = tUser.firstName;
    this.lastName = tUser.lastName;
    this.email = tUser.email;
    this.userImage = tUser.userImage;
  }

    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      userImage: json['userImage'],
    );
  }
}