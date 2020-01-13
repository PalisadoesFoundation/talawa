import 'package:talawa/model/activity.dart';

class Responsibility {
  int id;
  String name;
  String description;
  String date;
  String time;
  int priority;
  bool isCompleted;

  Responsibility(
      {this.id,
      this.name,
      this.description,
      this.date,
      this.time,
      this.priority,
      this.isCompleted});
  factory Responsibility.fromJson(Map<String, dynamic> json) {
    return Responsibility(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      priority: json['priority'],
      isCompleted: json['isCompleted'],
    );
  }
}
