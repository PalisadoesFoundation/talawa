class Responsibility {
  int id;
  String title;
  String description;
  String date;
  String time;
  int priority;
  bool isCompleted;
  int activityId;
  int userId;

  Responsibility(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.priority,
      this.isCompleted,
      this.activityId,
      this.userId});
  factory Responsibility.fromJson(Map<String, dynamic> json) {
    return Responsibility(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      priority: json['priority'],
      isCompleted: json['isCompleted'],
      activityId: json['activityId'],
      userId: json['userId']
    );
  }
}
