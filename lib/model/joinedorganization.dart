class JoinedOrganization {
  JoinedOrganization({
    this.image,
    this.id,
    this.name,
    this.admins,
    this.description,
    this.isPublic,
    this.creator,
  });

  factory JoinedOrganization.fromJson(Map<String, dynamic> json) =>
      JoinedOrganization(
        image: json["image"] == null ? null : json["image"] as String,
        id: json["_id"] as String,
        name: json["name"] as String,
        admins: List<Admin>.from(json["admins"]
            .map((x) => Admin.fromJson(x as Map<String, dynamic>)) as Iterable),
        description: json["description"] as String,
        isPublic: json["isPublic"] as bool,
        creator: JoinedOrganizationCreator.fromJson(
            json["creator"] as Map<String, dynamic>),
      );

  final String image;
  final String id;
  final String name;
  final List<Admin> admins;
  final String description;
  final bool isPublic;
  final JoinedOrganizationCreator creator;

  Map<String, dynamic> toJson() => {
        "image": image ?? null,
        "_id": id,
        "name": name,
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "description": description,
        "isPublic": isPublic,
        "creator": creator.toJson(),
      };
}

class Admin {
  Admin({
    this.id,
  });
  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"] as String,
      );

  final String id;

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class JoinedOrganizationCreator {
  JoinedOrganizationCreator({
    this.id,
    this.firstName,
    this.lastName,
  });
  factory JoinedOrganizationCreator.fromJson(Map<String, dynamic> json) =>
      JoinedOrganizationCreator(
        id: json["_id"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
      );

  final String id;
  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class AdminForCreator {
  AdminForCreator({
    this.firstName,
    this.lastName,
  });

  factory AdminForCreator.fromJson(Map<String, dynamic> json) =>
      AdminForCreator(
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
      );

  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}

class CreatedOrganization {
  CreatedOrganization({
    this.id,
    this.name,
  });
  factory CreatedOrganization.fromJson(Map<String, dynamic> json) =>
      CreatedOrganization(
        id: json["_id"] as String,
        name: json["name"] as String,
      );

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class AdminFor {
  AdminFor({
    this.id,
    this.name,
    this.creator,
  });
  factory AdminFor.fromJson(Map<String, dynamic> json) => AdminFor(
        id: json["_id"] as String,
        name: json["name"] as String,
        creator:
            AdminForCreator.fromJson(json["creator"] as Map<String, dynamic>),
      );

  final String id;
  final String name;
  final AdminForCreator creator;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "creator": creator.toJson(),
      };
}
