import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/hive_manager.dart';

void main() {
  group('HiveManager Tests', () {
    late Directory tempDir;

    setUpAll(() async {
      // Register adapters once for all tests
      await HiveManager.registerAdapters();
    });

    setUp(() async {
      // Create a fresh temporary directory for each test
      tempDir = await Directory.systemTemp.createTemp('hive_test');
      // Ensure clean state for each test
      await Hive.close();
      Hive.init(tempDir.path);
    });

    tearDown(() async {
      // Clean up after each test
      try {
        await Hive.close();
        if (await tempDir.exists()) {
          await tempDir.delete(recursive: true);
        }
      } catch (e) {
        // Ignore cleanup errors
      }
    });

    group('Basic Operations', () {
      test('initializeHive opens all required boxes', () async {
        await HiveManager.initializeHive(dir: tempDir);

        // Verify all boxes are open
        expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.eventFeedKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.asymetricKeyBoxKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.urlBoxKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.offlineActionQueueKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.postFeedKey), isTrue);
      });

      test('teardownHive closes all boxes', () async {
        await HiveManager.initializeHive(dir: tempDir);

        // Verify boxes are open
        expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isTrue);
        expect(Hive.isBoxOpen(HiveKeys.eventFeedKey), isTrue);

        await HiveManager.teardownHive();

        // Verify boxes are closed
        expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isFalse);
        expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isFalse);
        expect(Hive.isBoxOpen(HiveKeys.eventFeedKey), isFalse);
      });

      test('openBox opens specific box', () async {
        await HiveManager.openBox<OrgInfo>(HiveKeys.orgBoxKey);
        expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isTrue);

        await HiveManager.openBox<User>(HiveKeys.userBoxKey);
        expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isTrue);
      });

      test('closeBox closes specific box', () async {
        await HiveManager.openBox<OrgInfo>(HiveKeys.orgBoxKey);

        expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isTrue);
        await HiveManager.closeBox<OrgInfo>(HiveKeys.orgBoxKey);
        expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isFalse);
      });

      test('closeBox handles non-existent box gracefully', () async {
        // Should not throw when closing non-existent box
        expect(() => HiveManager.closeBox('nonexistent_box'), returnsNormally);
      });

      test('registerAdapter handles duplicate registration gracefully',
          () async {
        // This test verifies that duplicate registration doesn't crash the app
        expect(
          () => HiveManager.registerAdapter<User>(UserAdapter()),
          returnsNormally,
        );
      });
    });

    group('Box Management', () {
      test('closeBox handles already closed box gracefully', () async {
        await HiveManager.initializeHive(dir: tempDir);
        await HiveManager.closeBox<User>(HiveKeys.userBoxKey);

        // Closing already closed box should not throw
        await HiveManager.closeBox<User>(HiveKeys.userBoxKey);
      });

      test('teardownHive handles partial initialization gracefully', () async {
        // Open only some boxes
        await HiveManager.openBox<User>(HiveKeys.userBoxKey);
        await HiveManager.openBox<OrgInfo>(HiveKeys.orgBoxKey);

        // teardownHive should handle missing boxes gracefully
        await HiveManager.teardownHive();
      });
    });

    group('Event Data Handling', () {
      test('handles empty event box correctly', () async {
        await HiveManager.initializeHive(dir: tempDir);

        final box = Hive.box<Event>(HiveKeys.eventFeedKey);
        expect(box.isEmpty, isTrue);
      });

      test('can store and retrieve events', () async {
        await HiveManager.initializeHive(dir: tempDir);

        final box = Hive.box<Event>(HiveKeys.eventFeedKey);

        final event = Event(
          id: 'test_event',
          name: 'Test Event',
          description: 'Test event description',
          schemaVersion: 2,
        );

        await box.put('test_event', event);

        final retrievedEvent = box.get('test_event');
        expect(retrievedEvent, isNotNull);
        expect(retrievedEvent!.id, equals('test_event'));
        expect(retrievedEvent.name, equals('Test Event'));
        expect(retrievedEvent.schemaVersion, equals(2));
      });

      test('handles events with complex objects', () async {
        await HiveManager.initializeHive(dir: tempDir);

        final box = Hive.box<Event>(HiveKeys.eventFeedKey);

        final org = OrgInfo(
          id: 'org123',
          name: 'Test Org',
        );

        final user = User(
          id: 'user456',
          firstName: 'John',
          lastName: 'Doe',
        );

        final event = Event(
          id: 'complex_event',
          name: 'Complex Event',
          description: 'Event with nested objects',
          organization: org,
          creator: user,
          schemaVersion: 2,
        );

        await box.put('complex_event', event);

        final retrievedEvent = box.get('complex_event');
        expect(retrievedEvent, isNotNull);
        expect(retrievedEvent!.organization, isNotNull);
        expect(retrievedEvent.creator, isNotNull);
        expect(retrievedEvent.organization!.id, equals('org123'));
        expect(retrievedEvent.creator!.id, equals('user456'));
      });
    });

    group('Error Handling', () {
      test('handles adapter registration errors gracefully', () async {
        // Should not throw even if adapters are already registered
        await HiveManager.registerAdapters();
      });

      test('handles invalid box operations gracefully', () async {
        // These should be handled gracefully by the try-catch blocks in HiveManager
        await HiveManager.closeBox('nonexistent_box');

        // Test opening with proper Hive initialization
        await HiveManager.initializeHive(dir: tempDir);
        await HiveManager.openBox<User>('test_user_box');
        await HiveManager.closeBox<User>('test_user_box');
      });

      test('handles openBox errors gracefully', () async {
        // First close Hive completely to create an error condition
        await Hive.close();

        // Try to open a box without Hive being initialized - this should trigger the error handling
        // The print statement "Failed to open box invalid_box" should be executed
        await HiveManager.openBox<User>('invalid_box');

        // Re-initialize for cleanup
        Hive.init(tempDir.path);
      });
    });
  });
}
