import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class Activity {
  int id;
  String title;
  IconData icon;
  String image;
  String date;
  String time;
  List<int> users;
  BuildContext context;
  String description;
  Color menuColor;

  Activity(
      {
      this.id,
      this.title,
      this.icon,
      this.image,
      this.date,
      this.time,
      this.users,
      this.description,
      this.context,
      this.menuColor = Colors.black});


  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      time: json['time'],
      users: json['users'] != null ? json['users'].cast<int>() : [],
      description: json['description'],
      menuColor: Color(0xff050505),
      icon: Icons.book,
      image: UIData.blankImage,
    );
  }
}
