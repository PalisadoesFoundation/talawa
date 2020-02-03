class Responsibility {
  int id;
  String title;
  String description;
  DateTime datetime;
  int priority;
  bool isCompleted;
  int activityId;
  int userId;

  Responsibility(
      {this.id,
      this.title,
      this.description,
      this.datetime,
      this.priority,
      this.isCompleted,
      this.activityId,
      this.userId});
  factory Responsibility.fromJson(Map<String, dynamic> json) {
    return Responsibility(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      datetime: DateTime.fromMillisecondsSinceEpoch(json['datetime']),
      priority: json['priority'],
      isCompleted: json['isCompleted'],
      activityId: json['activityId'],
      userId: json['userId']
    );
  }
}
