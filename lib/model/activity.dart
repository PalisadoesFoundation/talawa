import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class Activity {
  int id;
  String title;
  IconData icon;
  String image;
  DateTime datetime;
  String time;
  int userLength;
  BuildContext context;
  String description;
  Color menuColor;

  Activity(
      {this.id,
      this.title,
      this.icon,
      this.image,
      this.datetime,
      this.time,
      this.description,
      this.userLength,
      this.context,
      this.menuColor = Colors.black});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      title: json['title'],
      datetime: DateTime.fromMillisecondsSinceEpoch(json['datetime']),
      description: json['description'],
      userLength: json['userLength'],
      menuColor: Color(0xff050505),
      icon: Icons.book,
      image: UIData.blankImage,
    );
  }
}
