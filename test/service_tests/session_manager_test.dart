import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/caching/offline_action_queue.dart';
import 'package:talawa/services/session_manager.dart';

import '../helpers/test_helpers.dart';

void main() {
  late SessionManager sessionManager;

  setUp(() async {
    final tempDir = Directory.systemTemp.createTempSync();
    Hive.init(tempDir.path);

    // Register Adapters
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(OrgInfoAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(CachedUserActionAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(CachedUserActionStatusAdapter());
    }
    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(CachedOperationTypeAdapter());
    }

    await Hive.openBox<User>('currentUser');
    await Hive.openBox<OrgInfo>('currentOrg');
    await Hive.openBox('url');
    await Hive.openBox<CachedUserAction>(OfflineActionQueue.boxName);

    locator.allowReassignment = true;
    setupLocator();
    registerServices();
    // Register mocks
    getAndRegisterDatabaseMutationFunctions();
    getAndRegisterUserConfig();

    // We create a fresh SessionManager for each test
    sessionManager = SessionManager();
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    locator.reset();
  });

  group('SessionManager Refresh Tests', () {
    test('refreshSession clears Hive boxes on failure', () async {
      // Setup: Populate boxes
      final userBox = Hive.box<User>('currentUser');
      final orgBox = Hive.box<OrgInfo>('currentOrg');
      final urlBox = Hive.box('url');

      await userBox.put('key', User(id: '1'));
      await orgBox.put('key', OrgInfo(id: '1'));
      await urlBox.put('key', 'some_url');

      // Verify populated
      expect(userBox.isNotEmpty, true);
      expect(orgBox.isNotEmpty, true);
      expect(urlBox.isNotEmpty, true);

      // Setup Mocks
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));

      // Mock failure
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      // Stub updateAccessToken to SUCCEED (allow execution to proceed to Hive logic)
      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenAnswer((_) => Future.value());

      // Act
      await sessionManager.refreshSession();

      // Assert: Verify boxes are cleared
      expect(userBox.isEmpty, true);
      expect(orgBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
    });

    test('refreshSession returns true when successful', () async {
      // Setup
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'valid_token'));
      when(databaseFunctions.refreshAccessToken('valid_token'))
          .thenAnswer((_) async => true);

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      expect(result, true);
      verify(databaseFunctions.refreshAccessToken('valid_token')).called(1);
    });

    test('refreshSession returns false immediately if refreshToken is empty',
        () async {
      // Setup
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: '')); // Empty token

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      expect(result, false);
      // Should verify that refreshAccessToken was NEVER called
      verifyZeroInteractions(databaseFunctions);
    });

    test(
        'refreshSession throws exception and retries when refreshAccessToken returns false',
        () async {
      // Setup
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));

      // Mock failure: returning false instead of throwing explicitly
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenAnswer((_) async => false);

      // Stub updateAccessToken to throw exception (simulates skipped or failed storage update)
      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Storage Error'));

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      expect(result, false);
      // Should still retry 3 times because false triggers exception
      verify(databaseFunctions.refreshAccessToken('bad_token')).called(3);
    });

    test('refreshSession retries 3 times on failure then clears tokens',
        () async {
      // Setup
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));

      // Mock failure (throws exception as per our implementation)
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      // Stub updateAccessToken to throw exception (skips Hive logic which hangs in test, but verifies flow)
      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Skip Hive'));

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      // Should call refresh 3 times (initial + 2 retries)
      verify(databaseFunctions.refreshAccessToken('bad_token')).called(3);

      // Should call clearTokens (which calls updateAccessToken)
      verify(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .called(1);

      // Verify result
      expect(result, false);
    });

    test('refreshSession guards against concurrent calls', () async {
      // Setup
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'any_token'));

      // Make the first call execute slowly

      when(databaseFunctions.refreshAccessToken('any_token'))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        return true;
      });

      // Act
      final future1 = sessionManager.refreshSession();
      final future2 =
          sessionManager.refreshSession(); // Should return false immediately

      // Assert
      final result2 = await future2;
      expect(result2, false); // Rejected due to guard

      final result1 = await future1;
      expect(result1, true); // First one succeeds

      // Only 1 call to database
      verify(databaseFunctions.refreshAccessToken('any_token')).called(1);
    });

    test('refreshSession clears in-memory state even if token storage fails',
        () async {
      // Setup failure condition for refresh
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      // Mock failure for updateAccessToken (simulating secure storage error)
      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Storage Error'));

      // Populate URL box to verify it gets cleared
      Hive.box('url').put('key', 'http://example.com');

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      expect(result, false);

      // Verify currentUser was reset despite storage error
      verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
          .called(1);

      // Verify currentOrg was reset
      verify(userConfig.currentOrg =
              OrgInfo(name: 'Organization Name', id: 'null'))
          .called(1);

      // Verify url box cleared
      expect(Hive.box('url').isEmpty, true);
    });

    test('refreshSession handles Hive box failure during cleanup', () async {
      // Setup failure condition for refresh
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      // Stub updateAccessToken to succeed
      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenAnswer((_) => Future.value());

      // Force Hive failure by closing boxes
      await Hive.box<User>('currentUser').close();
      await Hive.box<OrgInfo>('currentOrg').close();
      await Hive.box('url').close();

      // Act
      final result = await sessionManager.refreshSession();

      // Assert
      expect(result, false);

      // Verify currentUser and currentOrg were reset in finally block
      verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
          .called(1);

      verify(userConfig.currentOrg =
              OrgInfo(name: 'Organization Name', id: 'null'))
          .called(1);

      // Attempting to access closed box throws, so we can't check isEmpty.
      // But passing the assertion above confirms code execution reached finally block
      // without crashing on Hive error.
    });
  });
}
