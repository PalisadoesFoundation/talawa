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
  /// Initializes Hive with the specified directory.
  ///
  /// **params**:
  /// * `dir`: A [Directory] object representing the directory where Hive will store its data files.
  ///
  /// **returns**:
  ///   None
  static Future<void> initializeHive({required Directory dir}) async {
    _initHive(dir);
    await registerAdapters();
    await _openBoxes();
  }

  /// Initializes Hive with the specified directory path.
  ///
  /// **params**:
  /// * `dir`: A [Directory] object where Hive will store its data files.
  ///
  /// **returns**:
  ///   None
  static void _initHive(Directory dir) {
    Hive.init(dir.path);
  }

  /// Registers the [adapter] named adapter.
  ///
  /// **params**:
  /// * `adapter`: Adapter to register.
  ///
  /// **returns**:
  ///   None
  static Future<void> registerAdapter<T>(TypeAdapter<T> adapter) async {
    try {
      Hive.registerAdapter<T>(adapter);
    } catch (e) {
      print('Failed to register Hive adapters: $e');
    }
  }

  /// Opens the [boxName] named box.
  ///
  /// **params**:
  /// * `boxName`: Name of the box.
  ///
  /// **returns**:
  ///   None
  static Future<void> openBox<T>(String boxName) async {
    try {
      await Hive.openBox<T>(boxName);
    } catch (e) {
      print('Failed to open box $boxName');
    }
  }

  /// Closes the [boxName] named box.
  ///
  /// **params**:
  /// * `boxName`: Name of the box.
  ///
  /// **returns**:
  ///   None
  static Future<void> closeBox<T>(String boxName) async {
    try {
      await Hive.box<T>(boxName).close();
    } catch (e) {
      print('Failed to close the box $boxName');
    }
  }

  /// Registers the necessary Hive adapters for the models used in the application.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  static Future<void> registerAdapters() async {
    registerAdapter<User>(UserAdapter());
    registerAdapter<OrgInfo>(OrgInfoAdapter());
    registerAdapter<AsymetricKeys>(AsymetricKeysAdapter());
    registerAdapter<CachedUserAction>(CachedUserActionAdapter());
    registerAdapter<CachedOperationType>(CachedOperationTypeAdapter());
    registerAdapter<CachedUserActionStatus>(CachedUserActionStatusAdapter());
    registerAdapter<Post>(PostAdapter());
    registerAdapter<Event>(EventAdapter());
    registerAdapter<LikedBy>(LikedByAdapter());
    registerAdapter<Attendee>(AttendeeAdapter());
    registerAdapter<Comment>(CommentAdapter());
    registerAdapter<Comments>(CommentsAdapter());
  }

  /// Opens the necessary Hive boxes for storing various types of data.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  static Future<void> _openBoxes() async {
    await openBox<User>(HiveKeys.userBoxKey);
    await openBox<OrgInfo>(HiveKeys.orgBoxKey);
    await openBox<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey);
    await openBox(HiveKeys.urlBoxKey);
    await openBox<CachedUserAction>(HiveKeys.offlineActionQueueKey);
    await openBox<Post>(HiveKeys.postFeedKey);

    // Migrate Event data before opening the box
    await _migrateEventData();
    await openBox<Event>(HiveKeys.eventFeedKey);
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
    await _closeBoxes();
    await Hive.close();
  }

  /// Closes all opened Hive boxes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  static Future<void> _closeBoxes() async {
    await closeBox<User>(HiveKeys.userBoxKey);
    await closeBox<OrgInfo>(HiveKeys.orgBoxKey);
    await closeBox<AsymetricKeys>(HiveKeys.asymetricKeyBoxKey);
    await closeBox(HiveKeys.urlBoxKey);
    await closeBox<CachedUserAction>(HiveKeys.offlineActionQueueKey);
    await closeBox<Post>(HiveKeys.postFeedKey);
    await closeBox<Event>(HiveKeys.eventFeedKey);
  }

  /// Migrates Event data to ensure compatibility with schema changes.
  ///
  /// This method handles the migration of Event data from older schema versions
  /// to the current version. It checks for existing data and transforms it
  /// to match the current Event model structure.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  static Future<void> _migrateEventData() async {
    try {
      // Check if the Event box already exists
      if (Hive.isBoxOpen(HiveKeys.eventFeedKey)) {
        final box = Hive.box<Event>(HiveKeys.eventFeedKey);

        // Get all existing events
        final existingEvents = <Event>[];
        for (final key in box.keys) {
          try {
            final event = box.get(key);
            if (event != null) {
              existingEvents.add(event);
            }
          } catch (e) {
            // Skip corrupted entries
            print('Skipping corrupted event entry: $e');
          }
        }

        // Clear the box to remove old data
        await box.clear();

        // Re-add events with updated schema version
        for (final event in existingEvents) {
          // Ensure schema version is set
          event.schemaVersion ??= 2;
          await box.put(event.id, event);
        }

        print('Event data migration completed successfully');
      }
    } catch (e) {
      print('Event data migration failed: $e');
      // If migration fails, clear the box to prevent corruption
      try {
        if (Hive.isBoxOpen(HiveKeys.eventFeedKey)) {
          await Hive.box<Event>(HiveKeys.eventFeedKey).clear();
          print('Event box cleared due to migration failure');
        }
      } catch (clearError) {
        print('Failed to clear event box: $clearError');
      }
    }
  }
}
