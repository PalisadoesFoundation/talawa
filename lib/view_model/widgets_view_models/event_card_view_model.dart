// import 'package:flutter/material.dart';
// import 'package:talawa/locator.dart';
// import 'package:talawa/models/events/event_badge_helper_model.dart';
// import 'package:talawa/models/events/event_model.dart';
// import 'package:talawa/view_model/base_view_model.dart';

// class EventCardViewModel extends BaseModel {
//   late final Event _event;
//   Event get event => _event;
//   late final bool isRegistered;
//   late EventBadge eventBadge;
//   initialize({required Event event}) {
//     _event = event;
//     isRegistered = _event.isRegistered ?? false;
//     initBadge();
//   }

//   void initBadge() {}

//   Map<String, dynamic> badgeDetails() {
//     if (_event.creator!.id == userConfig.currentUser.id) {
//       return {
//         "BadgeTitle": "Created",
//       };
//     } else if (isRegistered) {
//       return {
//         "BadgeTitle": "Subscribed",
//       };
//     } else {
//       return {
//         "BadgeTitle": "",
//       };
//     }
//   }
// }
