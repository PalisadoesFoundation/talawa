// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talawa/enums/event_recurrance.dart';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(json
    .decode(str)
    .map((x) => EventsModel.fromJson(x as Map<String, dynamic>)) as Iterable);

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    @required this.id,
    this.organization,
    this.title,
    this.description,
    this.isPublic,
    this.isRegisterable,
    this.recurring,
    this.recurrance,
    this.startTime,
    this.endTime,
    this.allDay,
    this.location,
    this.isRegistered,
    this.creator,
  });
  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["_id"] as String,
        organization:
            Organization.fromJson(json["organization"] as Map<String, dynamic>),
        title: json["title"] as String,
        description: json["description"] as String,
        isPublic: json["isPublic"] as bool,
        isRegisterable: json["isRegisterable"] as bool,
        recurring: json["recurring"] as bool,
        recurrance: recurranceValues.map[json["recurrance"]],
        startTime: json["startTime"] as String,
        endTime: json["endTime"] as String,
        allDay: json["allDay"] as bool,
        location: json["location"] as String,
        isRegistered: json["isRegistered"] as bool,
        creator: Creator.fromJson(json["creator"] as Map<String, dynamic>),
      );

  String id;
  Organization organization;
  String title;
  String description;
  bool isPublic;
  bool isRegisterable;
  bool recurring;
  Recurrance recurrance;
  String startTime;
  String endTime;
  bool allDay;
  String location;
  bool isRegistered;
  Creator creator;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "organization": organization.toJson(),
        "title": title,
        "description": description,
        "isPublic": isPublic,
        "isRegisterable": isRegisterable,
        "recurring": recurring,
        "recurrance": recurranceValues.reverse[recurrance],
        "startTime": startTime,
        "endTime": endTime,
        "allDay": allDay,
        "location": location,
        "isRegistered": isRegistered,
        "creator": creator.toJson(),
      };
}

class Creator {
  Creator({
    @required this.id,
  });
  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["_id"] as String,
      );

  String id;

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}

class Organization {
  Organization({
    @required this.id,
    this.image,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["_id"] as String,
        image: json["image"] as String,
      );

  String id;
  String image;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
      };
}
