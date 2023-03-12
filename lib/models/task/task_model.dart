// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';

//This class creates a Task model and returns a Task instance.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.creator,
    required this.event,
    required this.createdAt,
    this.description,
    this.deadline,
  });
  ////Creating a new Task instance from a map structure.
  factory Task.fromJson(
    Map<String, dynamic> json,
  ) {
    return Task(
      id: json['_id'] as String,
      title: json['title'] as String,
      creator: User.fromJson(
        json['creator'] as Map<String, dynamic>,
        fromOrg: true,
      ),
      event: Event.fromJson(
        json['event'] as Map<String, dynamic>,
      ),
      createdAt: json['createdAt'] as String,
      description: json['description'] as String?,
      deadline: json['deadline'] as String?,
    );
  }

  final String id;
  final String title;
  final User creator;
  final Event event;
  final String createdAt;
  final String? description;
  final String? deadline;
}
