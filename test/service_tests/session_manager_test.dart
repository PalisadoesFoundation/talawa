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

    getAndRegisterDatabaseMutationFunctions();
    getAndRegisterUserConfig();

    sessionManager = SessionManager();
  });

  tearDown(() async {
    sessionManager.dispose();
    await Hive.deleteFromDisk();
    await locator.reset();
  });

  group('SessionManager Initialization Tests', () {
    test('constructor initializes session refresher', () {
      expect(sessionManager, isNotNull);
    });

    test('refreshInterval returns correct value', () {
      expect(sessionManager.refreshInterval, 600);
    });

    test('initializeSessionRefresher timer callback executes', () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'token'));
      when(databaseFunctions.refreshAccessToken('token'))
          .thenAnswer((_) async => true);

      final testSessionManager = SessionManager(testInterval: 1);

      await Future.delayed(const Duration(seconds: 2));

      verify(databaseFunctions.refreshAccessToken('token'))
          .called(greaterThan(0));

      testSessionManager.dispose();

      expect(testSessionManager.refreshInterval, 600);
    });
  });

  group('SessionManager Refresh Tests', () {
    test('refreshSession clears Hive boxes on failure', () async {
      final userBox = Hive.box<User>('currentUser');
      final orgBox = Hive.box<OrgInfo>('currentOrg');
      final urlBox = Hive.box('url');

      await userBox.put('key', User(id: '1'));
      await orgBox.put('key', OrgInfo(id: '1'));
      await urlBox.put('key', 'some_url');

      expect(userBox.isNotEmpty, true);
      expect(orgBox.isNotEmpty, true);
      expect(urlBox.isNotEmpty, true);

      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));

      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenAnswer((_) => Future.value());

      await sessionManager.refreshSession();

      expect(userBox.isEmpty, true);
      expect(orgBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
    });

    test('refreshSession returns true when successful', () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'valid_token'));
      when(databaseFunctions.refreshAccessToken('valid_token'))
          .thenAnswer((_) async => true);

      final result = await sessionManager.refreshSession();

      expect(result, true);
      verify(databaseFunctions.refreshAccessToken('valid_token')).called(1);
    });

    test('refreshSession resets refreshing flag after success', () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'token'));
      when(databaseFunctions.refreshAccessToken('token'))
          .thenAnswer((_) async => true);

      final result1 = await sessionManager.refreshSession();
      expect(result1, true);

      final result2 = await sessionManager.refreshSession();
      expect(result2, true);

      verify(databaseFunctions.refreshAccessToken('token')).called(2);
    });

    test('refreshSession returns false immediately if refreshToken is empty',
        () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser).thenReturn(User(id: '1', refreshToken: ''));

      final result = await sessionManager.refreshSession();

      expect(result, false);

      verifyZeroInteractions(databaseFunctions);
    });

    test(
        'refreshSession returns false and retries when refreshAccessToken returns false',
        () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));

      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenAnswer((_) async => false);

      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Storage Error'));

      final result = await sessionManager.refreshSession();

      expect(result, false);

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

      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Skip Hive'));

      final result = await sessionManager.refreshSession();

      verify(databaseFunctions.refreshAccessToken('bad_token')).called(3);

      verify(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .called(1);

      expect(result, false);
    });

    test('refreshSession guards against concurrent calls', () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'any_token'));

      when(databaseFunctions.refreshAccessToken('any_token'))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        return true;
      });

      final future1 = sessionManager.refreshSession();
      final future2 = sessionManager.refreshSession();

      final result2 = await future2;
      expect(result2, false);

      final result1 = await future1;
      expect(result1, true);

      verify(databaseFunctions.refreshAccessToken('any_token')).called(1);
    });

    test('refreshSession clears in-memory state even if token storage fails',
        () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenThrow(Exception('Storage Error'));

      await Hive.box('url').put('key', 'http://example.com');

      final result = await sessionManager.refreshSession();

      expect(result, false);

      verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
          .called(1);

      verify(userConfig.currentOrg =
              OrgInfo(name: 'Organization Name', id: 'null'))
          .called(1);

      expect(Hive.box('url').isEmpty, true);
    });

    test('refreshSession handles Hive box failure during cleanup', () async {
      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser)
          .thenReturn(User(id: '1', refreshToken: 'bad_token'));
      when(databaseFunctions.refreshAccessToken('bad_token'))
          .thenThrow(Exception('Network Error'));

      when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
          .thenAnswer((_) => Future.value());

      await Hive.box<User>('currentUser').close();
      await Hive.box<OrgInfo>('currentOrg').close();
      await Hive.box('url').close();

      final result = await sessionManager.refreshSession();

      expect(result, false);

      verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
          .called(1);

      verify(userConfig.currentOrg =
              OrgInfo(name: 'Organization Name', id: 'null'))
          .called(1);
    });
  });
}
