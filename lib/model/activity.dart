import 'package:flutter/material.dart';
import 'package:flutter_quito/utils/uidata.dart';

class Activity {
  String id;
  String name;
  IconData icon;
  String image;
  String date;
  String time;
  List<String> users;
  BuildContext context;
  String description;
  Color menuColor;

  Activity(
      {
      this.id,
      this.name,
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
      id: json['_id'],
      name: json['name'],
      date: json['date'],
      time: json['time'],
      users: json['users'].cast<String>(),
      description: json['description'],
      menuColor: Color(0xff050505),
      icon: Icons.book,
      image: UIData.blankImage,
    );
  }
}
