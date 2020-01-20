import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/widgets/_widgets.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String userImage;
  bool selected;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.userImage,
      this.selected = false});

  User.copy(User tUser) {
    this.id = tUser.id;
    this.firstName = tUser.firstName;
    this.lastName = tUser.lastName;
    this.email = tUser.email;
    this.userImage = tUser.userImage;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      userImage: json['userImage'],
    );
  }

  
}
