import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

/// Shared utility class for handling JSON deserialization in tests.
///
/// **Purpose:**
/// Provides centralized methods for creating model instances from test JSON data,
/// specifically handling nested user structures and complex data relationships
/// that appear across multiple test files.
///
/// **Key Features:**
/// - Handles nested user structures consistently across all models
/// - Uses `fromOrg: true` by default for simplified test user creation
/// - Provides null-safe parsing for all optional fields
/// - Reduces code duplication across test files
/// - Maintains consistent parsing behavior for test scenarios
class TestJsonUtils {
  /// Creates a User from test JSON with nested structure handling.
  ///
  /// **params**:
  /// * `json`: Map containing user data, may be nested under 'user' key
  /// * `fromOrg`: Whether to use organization-specific user parsing (default: true for test data)
  ///
  /// **returns**:
  /// * `User?`: User instance or null if json is null
  static User? createUserFromJson(
    Map<String, dynamic>? json, {
    bool fromOrg = true,
  }) {
    if (json == null) return null;

    // Handle nested user structure (e.g., {'user': {...}, 'authenticationToken': '...'})
    if (json.containsKey('user')) {
      final userData = json['user'];
      if (userData == null) return null;
      if (userData is Map<String, dynamic>) {
        // For nested structures, always use fromOrg: true since we extract direct user data
        return User.fromJson(userData, fromOrg: true);
      }
    }

    // Handle direct user structure - respect the provided fromOrg parameter
    return User.fromJson(json, fromOrg: fromOrg);
  }

  /// Creates a list of Users from test JSON array.
  ///
  /// **params**:
  /// * `jsonList`: List of user JSON objects
  /// * `fromOrg`: Whether to use organization-specific user parsing (default: true for lists)
  ///
  /// **returns**:
  /// * `List<User>?`: List of User instances or null if jsonList is null
  static List<User>? createUserListFromJson(
    List<dynamic>? jsonList, {
    bool fromOrg = true,
  }) {
    if (jsonList == null) return null;
    return jsonList
        .map(
          (e) =>
              createUserFromJson(e as Map<String, dynamic>, fromOrg: fromOrg),
        )
        .whereType<User>()
        .toList();
  }

  /// Creates Comment from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing the test JSON data with nested creator structure
  ///
  /// **returns**:
  /// * `Comment`: Properly constructed Comment instance
  static Comment createCommentFromJson(Map<String, dynamic> json) {
    return Comment(
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: createUserFromJson(json['creator'] as Map<String, dynamic>?),
    );
  }

  /// Creates Event from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing test JSON data with nested creator and organization
  ///
  /// **returns**:
  /// * `Event`: Properly constructed Event with extracted nested data
  static Event createEventFromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      recurring: json['recurring'] as bool?,
      allDay: json['allDay'] as bool?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      isPublic: json['isPublic'] as bool?,
      isRegistered: json['isRegistered'] as bool?,
      isRegisterable: json['isRegisterable'] as bool?,
      creator: createUserFromJson(json['creator'] as Map<String, dynamic>?),
      organization: json['organization'] == null
          ? null
          // OrgInfo doesn't require nested user handling, use direct fromJson
          : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
      admins: createUserListFromJson(json['admins'] as List<dynamic>?),
      attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
          ? null
          : (json['attendees'] as List<dynamic>?)
              // Attendee doesn't require nested user handling, use direct fromJson
              ?.map((e) => Attendee.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// Creates EventVolunteer from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing test JSON data with nested user structures
  ///
  /// **returns**:
  /// * `EventVolunteer`: Properly constructed EventVolunteer
  static EventVolunteer createEventVolunteerFromJson(
    Map<String, dynamic> json,
  ) {
    return EventVolunteer(
      id: json['_id'] as String?,
      creator: createUserFromJson(json['creator'] as Map<String, dynamic>?),
      event: json['event'] != null
          ? createEventFromJson(json['event'] as Map<String, dynamic>)
          : null,
      group: json['group'] != null
          ? createEventVolunteerGroupFromJson(
              json['group'] as Map<String, dynamic>,
            )
          : null,
      isAssigned: json['isAssigned'] as bool?,
      isInvited: json['isInvited'] as bool?,
      response: json['response'] as String?,
      user: createUserFromJson(json['user'] as Map<String, dynamic>?),
    );
  }

  /// Creates EventVolunteerGroup from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing test JSON data with nested user structures
  ///
  /// **returns**:
  /// * `EventVolunteerGroup`: Properly constructed EventVolunteerGroup
  static EventVolunteerGroup createEventVolunteerGroupFromJson(
    Map<String, dynamic> json,
  ) {
    return EventVolunteerGroup(
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      creator: createUserFromJson(json['creator'] as Map<String, dynamic>?),
      event: json['event'] != null
          ? createEventFromJson(json['event'] as Map<String, dynamic>)
          : null,
      leader: createUserFromJson(json['leader'] as Map<String, dynamic>?),
      name: json['name'] as String?,
      updatedAt: json['updatedAt'] as String?,
      volunteers: (json['volunteers'] as List<dynamic>?)
          ?.map((e) => createEventVolunteerFromJson(e as Map<String, dynamic>))
          .toList(),
      volunteersRequired: json['volunteersRequired'] as int?,
    );
  }

  /// Creates EventAgendaItem from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing test JSON data with nested user and category structures
  ///
  /// **returns**:
  /// * `EventAgendaItem`: Properly constructed EventAgendaItem
  static EventAgendaItem createEventAgendaItemFromJson(
    Map<String, dynamic> json,
  ) {
    return EventAgendaItem(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdBy: createUserFromJson(json['createdBy'] as Map<String, dynamic>?),
      urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
      relatedEvent: json['relatedEvent'] != null
          ? createEventFromJson(json['relatedEvent'] as Map<String, dynamic>)
          : null,
      categories: (json['categories'] as List<dynamic>?)
          // AgendaCategory doesn't require nested user handling, use direct fromJson
          ?.map((e) => AgendaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      sequence: json['sequence'] as int?,
      organization: json['organization'] != null
          // OrgInfo doesn't require nested user handling, use direct fromJson
          ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Creates Post from test JSON with proper nested user handling.
  ///
  /// **params**:
  /// * `json`: Map containing test JSON data with nested user structures
  ///
  /// **returns**:
  /// * `Post`: Properly constructed Post with extracted nested data
  static Post createPostFromJson(Map<String, dynamic> json) {
    final post = Post(
      id: json['_id'] as String,
      caption: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      creator: createUserFromJson(json['creator'] as Map<String, dynamic>?),
      organization: json['organization'] != null
          // OrgInfo doesn't require nested user handling, use direct fromJson
          ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
    );

    return post;
  }
}
