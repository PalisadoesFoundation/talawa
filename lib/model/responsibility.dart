class Responsibility{
  String id;
  String name;
  String description;
  String date;
  String time;
  String activity;
  String asignee;


  Responsibility({
    this.id,
    this.name,
    this.description,
    this.date,
    this.time,
    this.activity,
    this.asignee
  });
    factory Responsibility.fromJson(Map<String, dynamic> json) {
    return Responsibility(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      activity: json['activity'],
      asignee: json['asignee']
    );
  }
}