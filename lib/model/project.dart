import 'package:flutter/material.dart';
import 'package:flutter_quito/utils/uidata.dart';

class Project {
  int id;
  String name;
  IconData icon;
  String image;
  String time;
  BuildContext context;
  String description;
  Color menuColor;

  Project(
      {
      this.id,
      this.name,
      this.icon,
      this.image,
      this.time,
      this.description,
      this.context,
      this.menuColor = Colors.black});


  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      time: json['time'],
      description: json['description'],
      menuColor: Color(0xff050505),
      icon: Icons.book,
      image: UIData.blankImage,
    );
  }
}
