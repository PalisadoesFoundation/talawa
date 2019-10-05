import 'package:flutter/material.dart';
import 'package:flutter_quito/utils/uidata.dart';

class Menu {
  int id;
  String name;
  IconData icon;
  String image;
  String time;
  List<String> items;
  BuildContext context;
  String description;
  Color menuColor;

  Menu(
      {
      this.id,
      this.name,
      this.icon,
      this.image,
      this.time,
      this.items,
      this.description,
      this.context,
      this.menuColor = Colors.black});


  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      time: json['time'],
      description: json['description'],
      menuColor: Color(0xff050505),
      icon: Icons.person,
      image: UIData.profileImage,
      items: ["View Profile", "Profile 2", "Profile 3", "Profile 4"],
    );
  }
}
