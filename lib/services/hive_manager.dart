import 'dart:io';

import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/asymetric_keys/asymetric_keys.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';

/// A manager class responsible for initializing and tearing down Hive, a local database for Flutter.
///
/// The `HiveManager` class provides methods to initialize Hive with necessary adapters and open boxes for
/// various models used throughout the application. It also provides a method to close all opened Hive boxes
/// when they are no longer needed.
class HiveManager {
  /// Initializes Hive and registers the necessary adapters for the models used in the application.
  ///
  /// This method also opens the required Hive boxes for different types of data, such as user information,
  /// organization details, cached user actions, posts, events, and more.
  ///
  /// **params**:
  /// * `dir`: A [Directory] object representing the directory where Hive will store its data files.
  ///
  /// **returns**:
  ///   None
  static Future<void> initializeHive({required Directory dir}) async {
    Hive
      ..init(dir.path)
      ..registerAdapter<User>(UserAdapter())
      ..registerAdapter<OrgInfo>(OrgInfoAdapter())
      ..registerAdapter<AsymetricKeys>(AsymetricKeysAdapter())
      ..registerAdapter<CachedUserAction>(CachedUserActionAdapter())
      ..registerAdapter<CachedOperationType>(CachedOperationTypeAdapter())
      ..registerAdapter<CachedUserActionStatus>(CachedUserActionStatusAdapter())
      ..registerAdapter<Post>(PostAdapter())
      ..registerAdapter<Event>(EventAdapter())
      ..registerAdapter<LikedBy>(LikedByAdapter())
      ..registerAdapter<Attendee>(AttendeeAdapter())
      ..registerAdapter<Comment>(CommentAdapter())
      ..registerAdapter<Comments>(CommentsAdapter());

    await Hive.openBox<User>(HiveKeys.userBoxKey);
    await Hive.openBox<OrgInfo>(HiveKeys.orgBoxKey);
    await Hive.openBox<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey);
    await Hive.openBox(HiveKeys.pluginBoxKey);
    await Hive.openBox(HiveKeys.urlBoxKey);
    await Hive.openBox<CachedUserAction>(HiveKeys.offlineActionQueueKey);
    await Hive.openBox<Post>(HiveKeys.postFeedKey);
    await Hive.openBox<Event>(HiveKeys.eventFeedKey);
  }

  /// Closes all opened Hive boxes and the Hive instance itself.
  ///
  /// This method ensures that all Hive boxes are properly closed to avoid potential data corruption
  /// when the application is terminated or when Hive is no longer needed.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  static Future<void> teardownHive() async {
    await Hive.box<User>(HiveKeys.userBoxKey).close();
    await Hive.box<OrgInfo>(HiveKeys.orgBoxKey).close();
    await Hive.box<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey).close();
    await Hive.box(HiveKeys.pluginBoxKey).close();
    await Hive.box(HiveKeys.urlBoxKey).close();
    await Hive.box<CachedUserAction>(HiveKeys.offlineActionQueueKey).close();
    await Hive.box<Post>(HiveKeys.postFeedKey).close();
    await Hive.box<Event>(HiveKeys.eventFeedKey).close();

    await Hive.close();
  }
}
