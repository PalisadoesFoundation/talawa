import 'dart:io';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
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
  /// The maximum number of days in the future that an event date can be set to.
  /// This prevents events from being scheduled too far in the future (10 years).
  static const int maxFutureDateOffsetDays = 365 * 10; // 10 years

  /// Logger instance for HiveManager
  static final Logger _logger = Logger();

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
      _logger.e('Failed to register Hive adapters: $e');
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
      _logger.e('Failed to open box $boxName: $e');
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
      _logger.e('Failed to close the box $boxName: $e');
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
    registerAdapter<Attachment>(AttachmentAdapter());
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
    await openBox<Event>(HiveKeys.eventFeedKey);
    final migrationSuccess = await _migrateEventData();
    if (!migrationSuccess) {
      _logger.w(
        'Warning: Event data migration failed. Some events may be unavailable.',
      );
    }
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
  /// to the current version. It performs schema version upgrades and transforms
  /// data to match the current Event model structure.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: Returns true if migration succeeds, false if it fails.
  static Future<bool> _migrateEventData() async {
    try {
      final box = Hive.box<Event>(HiveKeys.eventFeedKey);
      const currentSchemaVersion = 2; // Current schema version

      // Get all event keys
      final allKeys = box.keys.toList();
      const batchSize = 100;
      final totalEvents = allKeys.length;
      if (totalEvents == 0) {
        _logger.i('No existing events to migrate');
        return true;
      }

      // Read and store all event data before clearing the box
      final tempEventData = <dynamic, dynamic>{};
      for (final key in allKeys) {
        tempEventData[key] = box.get(key);
      }

      // Clear the box to remove old data
      await box.clear();

      // Process events in batches from the stored data
      for (int i = 0; i < totalEvents; i += batchSize) {
        final batchEnd =
            (i + batchSize < totalEvents) ? i + batchSize : totalEvents;
        final batchKeys = allKeys.sublist(i, batchEnd);
        final batchMigrated = <String, Event>{};
        for (final key in batchKeys) {
          try {
            // Try reading as raw data (Map<String, dynamic>)
            final rawData = tempEventData[key] as Map<String, dynamic>?;
            if (rawData != null) {
              batchMigrated[key.toString()] =
                  _migrateRawEventData(rawData, currentSchemaVersion);
              continue;
            }
          } catch (_) {}
          try {
            // Try reading as Event object
            final event = tempEventData[key];
            if (event != null && event is Event) {
              final rawData = _eventToRawData(event);
              batchMigrated[key.toString()] =
                  _migrateRawEventData(rawData, currentSchemaVersion);
            }
          } catch (eventError) {
            _logger.w('Skipping corrupted event entry: $eventError');
          }
        }
        // Save migrated events for this batch
        for (final entry in batchMigrated.entries) {
          await box.put(entry.key, entry.value);
        }
        _logger.i('Migrated events ${i + 1} to $batchEnd of $totalEvents');
      }

      _logger.i('Event data migration completed successfully');
      return true;
    } catch (e) {
      _logger.e('Event data migration failed: $e');
      // If migration fails, create persistent backup before clearing the box
      try {
        final box = Hive.box<Event>(HiveKeys.eventFeedKey);

        // Create persistent backup using a temporary Hive box
        final backupBoxName =
            'event_backup_${DateTime.now().millisecondsSinceEpoch}';
        final backupBox = await Hive.openBox(backupBoxName);

        // Collect all data to backup
        final backupData = <String, dynamic>{};
        for (final key in box.keys) {
          try {
            final data = box.get(key);
            if (data != null) {
              backupData[key.toString()] = data;
            }
          } catch (backupError) {
            _logger.e('Failed to backup event with key $key: $backupError');
          }
        }

        // Only clear the box if backup was successful
        if (backupData.isNotEmpty) {
          // Save backup data to persistent storage
          for (final entry in backupData.entries) {
            await backupBox.put(entry.key, entry.value);
          }
          await backupBox.close();

          _logger.i(
            'Created persistent backup of ${backupData.length} events in $backupBoxName before clearing box',
          );
          await box.clear();
          _logger.i(
            'Event box cleared due to migration failure. Backup available for recovery in $backupBoxName',
          );
        } else {
          await backupBox.close();
          _logger.i('No valid data to backup, clearing event box');
          await box.clear();
        }
      } catch (clearError) {
        _logger.e('Failed to clear event box: $clearError');
      }
      return false;
    }
  }

   /// Migrates an Event to the current schema version.
  ///
  /// This method handles schema version transitions and applies necessary
  /// transformations to ensure data compatibility.
  ///
  /// **params**:
  /// * `event`: The event to migrate.
  /// * `targetVersion`: The target schema version.
  ///
  /// **returns**:
  /// * `Event`: The migrated event with updated schema version.
  /// Converts an Event object to raw data map for migration processing.
  ///
  /// **params**:
  /// * `event`: The Event object to convert.
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Raw data representation of the event.
  static Map<String, dynamic> _eventToRawData(Event event) {
    return {
      'id': event.id,
      'name': event.name,
      'description': event.description,
      'startAt': event.startAt,
      'endAt': event.endAt,
      'organization': event.organization,
      'creator': event.creator,
      'attachments': event.attachments,
      'schemaVersion': event.schemaVersion,
    };
  }

  /// Migrates raw event data to the current schema version.
  ///
  /// This method handles the migration of raw event data from older schema versions
  /// to the current version, properly mapping old field names to new ones.
  /// It performs incremental migration through each version step.
  ///
  /// **params**:
  /// * `rawData`: The raw event data to migrate.
  /// * `targetVersion`: The target schema version.
  ///
  /// **returns**:
  /// * `Event`: The migrated event with updated schema version.
  static Event _migrateRawEventData(
    Map<String, dynamic> rawData,
    int targetVersion,
  ) {
    final currentVersion = rawData['schemaVersion'] as int? ?? 1;

    // If already at target version, no migration needed
    if (currentVersion == targetVersion) {
      return Event.fromJson(rawData);
    }

    // Perform incremental migration through each version step
    var migratedData = Map<String, dynamic>.from(rawData);
    var currentSchemaVersion = currentVersion;

    while (currentSchemaVersion < targetVersion) {
      final nextVersion = currentSchemaVersion + 1;
      migratedData = _migrateRawEventDataToNextVersion(
        migratedData,
        currentSchemaVersion,
        nextVersion,
      );
      currentSchemaVersion = nextVersion;
    }

    return Event.fromJson(migratedData);
  }

  /// Migrates raw event data from one version to the next version.
  ///
  /// This helper method handles the migration between consecutive schema versions.
  /// It applies the specific transformations needed for each version transition.
  ///
  /// **params**:
  /// * `rawData`: The raw event data to migrate.
  /// * `fromVersion`: The current schema version.
  /// * `toVersion`: The target schema version (should be fromVersion + 1).
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: The migrated raw data with updated schema version.
  static Map<String, dynamic> _migrateRawEventDataToNextVersion(
    Map<String, dynamic> rawData,
    int fromVersion,
    int toVersion,
  ) {
    final migratedData = Map<String, dynamic>.from(rawData);

    // Apply version-specific transformations
    switch (fromVersion) {
      case 1:
        if (toVersion == 2) {
          // Migration from version 1 to 2
          // Map old field names to new schema
          final transformedData = _transformRawEventV1ToV2(migratedData);
          transformedData['schemaVersion'] = toVersion;
          return transformedData;
        }
        break;
      case 2:
        if (toVersion == 3) {
          // Future migration from version 2 to 3
          // Add future transformations here
          migratedData['schemaVersion'] = toVersion;
          return migratedData;
        }
        break;
      default:
        // Unknown version transition, set to target version
        _logger.w(
          'Unknown version transition from $fromVersion to $toVersion, setting to $toVersion',
        );
        migratedData['schemaVersion'] = toVersion;
        return migratedData;
    }

    // If no specific transformation is defined, just update schema version
    migratedData['schemaVersion'] = toVersion;
    return migratedData;
  }

  /// Transforms raw event data from version 1 to version 2 schema.
  ///
  /// This method handles the actual field name mappings needed when migrating
  /// from version 1 to version 2 of the Event schema. It preserves all
  /// relevant v1 data and transforms it properly to v2 format.
  ///
  /// **params**:
  /// * `rawData`: The raw event data to transform.
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: The transformed raw data with version 2 schema.
  static Map<String, dynamic> _transformRawEventV1ToV2(
    Map<String, dynamic> rawData,
  ) {
    final migratedData = <String, dynamic>{};

    // Map old field names to new schema - preserve all original data
    migratedData['id'] = rawData['id'] ?? rawData['_id'];

    // Transform 'title' field to 'name' field (v1 -> v2)
    migratedData['name'] = rawData['name'] ?? rawData['title'];

    // Preserve description
    migratedData['description'] = rawData['description'];

    // Handle date/time fields transformation (v1 had separate fields, v2 uses ISO8601 strings)
    // First check if v2 format already exists
    if (rawData['startAt'] != null) {
      migratedData['startAt'] = rawData['startAt'];
    } else {
      // Transform v1 separate date/time fields to v2 ISO8601 format
      final startDate = rawData['startDate']?.toString();
      final startTime = rawData['startTime']?.toString();

      if (startDate != null && startDate.isNotEmpty) {
        if (startTime != null && startTime.isNotEmpty) {
          // Combine date and time into ISO8601 format
          migratedData['startAt'] = '${startDate}T${startTime}Z';
        } else {
          // Only date available, use default time
          migratedData['startAt'] = '${startDate}T00:00:00Z';
        }
      }
    }

    if (rawData['endAt'] != null) {
      migratedData['endAt'] = rawData['endAt'];
    } else {
      // Transform v1 separate date/time fields to v2 ISO8601 format
      final endDate = rawData['endDate']?.toString();
      final endTime = rawData['endTime']?.toString();

      if (endDate != null && endDate.isNotEmpty) {
        if (endTime != null && endTime.isNotEmpty) {
          // Combine date and time into ISO8601 format
          migratedData['endAt'] = '${endDate}T${endTime}Z';
        } else {
          // Only date available, use default time
          migratedData['endAt'] = '${endDate}T23:59:59Z';
        }
      }
    }

    // Preserve organization and creator data
    migratedData['organization'] = rawData['organization'];
    migratedData['creator'] = rawData['creator'];

    // Initialize attachments field (was not present in v1)
    migratedData['attachments'] = rawData['attachments'] ?? [];

    // Preserve any other fields that might exist in v1 but aren't deprecated
    // This ensures we don't lose any data during migration

    return migratedData;
  }
}
