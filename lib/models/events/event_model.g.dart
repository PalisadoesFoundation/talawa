// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['title'] as String?,
    json['description'] as String?,
    json['attendees'] as String?,
    json['location'] as String?,
    json['recurring'] as String?,
    json['allDay'] as String?,
    json['startDate'] as String?,
    json['endDate'] as String?,
    json['startTime'] as String?,
    json['endTime'] as String?,
    json['recurrance'] as String?,
    json['isPublic'] as String?,
    json['isSubscribed'] as String?,
    json['isRegisterable'] as String?,
    json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    json['organization'] == null
        ? null
        : Organization.fromJson(json['organization'] as Map<String, dynamic>),
    (json['admins'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['registrants'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'attendees': instance.attendees,
      'location': instance.location,
      'recurring': instance.recurring,
      'allDay': instance.allDay,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'recurrance': instance.recurrance,
      'isPublic': instance.isPublic,
      'isSubscribed': instance.isSubscribed,
      'isRegisterable': instance.isRegisterable,
      'creator': instance.creator,
      'organization': instance.organization,
      'admins': instance.admins,
      'registrants': instance.registrants,
    };
