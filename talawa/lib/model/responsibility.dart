class Responsibility{
  int id;
  String name;
  String description;
  String date;
  String time;
  String activity;
  int userId;


  Responsibility({
    this.id,
    this.name,
    this.description,
    this.date,
    this.time,
    this.activity,
    this.userId
  });
    factory Responsibility.fromJson(Map<String, dynamic> json) {
    return Responsibility(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      activity: json['activity'],
      userId: json['userId']
    );
  }
}