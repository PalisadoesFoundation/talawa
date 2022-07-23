class Request {
  Request({
    this.id,
    this.name,
    this.image,
    this.description,
    this.dateTime,
  });

  factory Request.fromJson(
    Map<String, dynamic> json,
  ) {
    return Request(
      id: json['_id'] as String,
      name:
          '${json['user']['firstName'] ?? ""} ${json['user']['lastName'] ?? ""}',
      description: json['description'] as String?,
      image: json['user']['image'] as String?,
      dateTime: json['dateTime'] as String?,
    );
  }
  String? id;
  String? name;
  String? image;
  String? description;
  String? dateTime;
}
