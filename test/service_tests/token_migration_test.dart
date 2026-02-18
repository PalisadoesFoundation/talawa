import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/secure_storage_service.dart';
import '../helpers/fake_secure_storage_service.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

// Define MockQueryResult properly if not found elsewhere
class MockQueryResult extends Mock implements QueryResult {
  @override
  bool get hasException => super.noSuchMethod(
        Invocation.getter(#hasException),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool;

  @override
  Map<String, dynamic>? get data => super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: null,
        returnValueForMissingStub: null,
      ) as Map<String, dynamic>?;
}

void main() {
  group('Token Migration Tests -', () {
    late FakeSecureStorageService fakeSecureStorage;
    late MockGraphqlConfig mockGraphqlConfig;
    late MockDataBaseMutationFunctions mockDatabaseFunctions;
    late MockQueryResult mockQueryResult;

    setUp(() async {
      try {
        Hive.init('test/hive_storage');
      } catch (e) {
        // Ignore initialization error if Hive is already initialized
      }

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

      // CacheService needs this box open
      if (!Hive.isBoxOpen(HiveKeys.offlineActionQueueKey)) {
        await Hive.openBox<CachedUserAction>(HiveKeys.offlineActionQueueKey);
      }

      testSetupLocator();

      fakeSecureStorage =
          locator<SecureStorageService>() as FakeSecureStorageService;
      mockGraphqlConfig = getAndRegisterGraphqlConfig() as MockGraphqlConfig;
      mockDatabaseFunctions = getAndRegisterDatabaseMutationFunctions()
          as MockDataBaseMutationFunctions;
      mockQueryResult = MockQueryResult();
    });

    tearDown(() async {
      locator.reset();
      await Hive.close();
      Hive.resetAdapters();
    });

    test('Migration happens when Hive has token and SecureStorage is empty',
        () async {
      final legacyUser = User(
        id: 'legacy_user',
        authToken: 'hive_access_token',
        refreshToken: 'hive_refresh_token',
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
      final urlBox = await Hive.openBox('url');

      await userBox.put('user', legacyUser);
      await orgBox.put('org', OrgInfo(id: 'org1', name: 'Test Org'));
      await urlBox.put('url', 'http://test.com');

      await fakeSecureStorage.deleteAll();

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);

      final mockData = {
        'user': {
          'id': 'legacy_user',
          'firstName': 'Test',
          'lastName': 'User',
          'email': 'test@example.com',
        }
      };
      when(mockQueryResult.hasException).thenReturn(false);
      when(mockQueryResult.data).thenReturn(mockData);

      await userConfig.userLoggedIn();

      expect(userConfig.currentUser.authToken, 'hive_access_token');
      expect(userConfig.currentUser.refreshToken, 'hive_refresh_token');

      expect(
          await fakeSecureStorage.readToken('authToken'), 'hive_access_token');
      expect(await fakeSecureStorage.readToken('refreshToken'),
          'hive_refresh_token');

      await userBox.deleteFromDisk();
      await orgBox.deleteFromDisk();
      await urlBox.deleteFromDisk();
    });

    test('SecureStorage overrides Hive when both contain tokens', () async {
      final hiveUser = User(
        id: 'legacy_user',
        authToken: 'hive_access_token',
        refreshToken: 'hive_refresh_token',
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
      final urlBox = await Hive.openBox('url');

      await userBox.put('user', hiveUser);
      await orgBox.put('org', OrgInfo(id: 'org1', name: 'Test Org'));
      await urlBox.put('url', 'http://test.com');

      // Setup Secure Storage with DIFFERENT tokens
      await fakeSecureStorage.writeToken('authToken', 'secure_access_token');
      await fakeSecureStorage.writeToken(
          'refreshToken', 'secure_refresh_token');

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);

      final mockData = {
        'user': {
          'id': 'legacy_user',
          'firstName': 'Test',
          'lastName': 'User',
          'email': 'test@example.com',
        }
      };
      when(mockQueryResult.hasException).thenReturn(false);
      when(mockQueryResult.data).thenReturn(mockData);

      await userConfig.userLoggedIn();

      // Assert that Secure Storage values took precedence
      expect(userConfig.currentUser.authToken, 'secure_access_token');
      expect(userConfig.currentUser.refreshToken, 'secure_refresh_token');

      // Assert Secure Storage still has the correct values
      expect(await fakeSecureStorage.readToken('authToken'),
          'secure_access_token');
      expect(await fakeSecureStorage.readToken('refreshToken'),
          'secure_refresh_token');

      await userBox.deleteFromDisk();
      await orgBox.deleteFromDisk();
      await urlBox.deleteFromDisk();
    });
    test('SecureStorage has ONLY authToken (Hive has both)', () async {
      final hiveUser = User(
        id: 'legacy_user',
        authToken: 'hive_access_token',
        refreshToken: 'hive_refresh_token',
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
      final urlBox = await Hive.openBox('url');

      await userBox.put('user', hiveUser);
      await orgBox.put('org', OrgInfo(id: 'org1', name: 'Test Org'));
      await urlBox.put('url', 'http://test.com');

      // SecureStorage has only authToken
      await fakeSecureStorage.writeToken('authToken', 'secure_access_token');
      await fakeSecureStorage.deleteToken('refreshToken');

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);

      final mockData = {
        'user': {
          'id': 'legacy_user',
          'firstName': 'Test',
          'lastName': 'User',
          'email': 'test@example.com',
        }
      };
      when(mockQueryResult.hasException).thenReturn(false);
      when(mockQueryResult.data).thenReturn(mockData);

      await userConfig.userLoggedIn();

      // Expectation: SecureStorage authToken takes precedence.
      // RefreshToken from Hive is retained in memory because it wasn't overwritten by logic (secureRefreshToken was null).
      expect(userConfig.currentUser.authToken, 'secure_access_token');
      expect(userConfig.currentUser.refreshToken, 'hive_refresh_token');

      // Verify SecureStorage wasn't unexpectedly modified (no migration should happen if secureAuthToken exists)
      expect(await fakeSecureStorage.readToken('authToken'),
          'secure_access_token');
      expect(await fakeSecureStorage.readToken('refreshToken'), null);

      await userBox.deleteFromDisk();
      await orgBox.deleteFromDisk();
      await urlBox.deleteFromDisk();
    });

    test('SecureStorage has ONLY refreshToken (Hive has both)', () async {
      final hiveUser = User(
        id: 'legacy_user',
        authToken: 'hive_access_token',
        refreshToken: 'hive_refresh_token',
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
      final urlBox = await Hive.openBox('url');

      await userBox.put('user', hiveUser);
      await orgBox.put('org', OrgInfo(id: 'org1', name: 'Test Org'));
      await urlBox.put('url', 'http://test.com');

      // SecureStorage has only refreshToken
      await fakeSecureStorage.deleteToken('authToken');
      await fakeSecureStorage.writeToken(
          'refreshToken', 'secure_refresh_token');

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);

      final mockData = {
        'user': {
          'id': 'legacy_user',
          'firstName': 'Test',
          'lastName': 'User',
          'email': 'test@example.com',
        }
      };
      when(mockQueryResult.hasException).thenReturn(false);
      when(mockQueryResult.data).thenReturn(mockData);

      await userConfig.userLoggedIn();

      // Logic: secureAuthToken is null -> Migration triggers.
      // Hive tokens overwrite SecureStorage.
      expect(userConfig.currentUser.authToken, 'hive_access_token');
      expect(userConfig.currentUser.refreshToken, 'hive_refresh_token');

      expect(
          await fakeSecureStorage.readToken('authToken'), 'hive_access_token');
      expect(await fakeSecureStorage.readToken('refreshToken'),
          'hive_refresh_token');

      await userBox.deleteFromDisk();
      await orgBox.deleteFromDisk();
      await urlBox.deleteFromDisk();
    });

    test('Hive contains empty-string tokens', () async {
      final hiveUser = User(
        id: 'legacy_user',
        authToken: '',
        refreshToken: '',
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      await userBox.put('user', hiveUser);

      await fakeSecureStorage.deleteAll();

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      // We don't expect it to reach gqlAuthQuery successfully if token is empty,
      // but if it does, mock it to avoid crash.
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);
      when(mockQueryResult.hasException).thenReturn(true); // Fail if called

      try {
        await userConfig.userLoggedIn();
      } catch (e) {
        // Ignore downstream errors
      }

      // Verify NO migration occurred
      expect(await fakeSecureStorage.readToken('authToken'), null);
      expect(await fakeSecureStorage.readToken('refreshToken'), null);

      await userBox.deleteFromDisk();
    });

    test('Hive has authToken but NO refreshToken (Migration)', () async {
      final hiveUser = User(
        id: 'legacy_user',
        authToken: 'hive_access_token',
        refreshToken: null,
        joinedOrganizations: [],
      );

      final userBox = await Hive.openBox<User>('currentUser');
      final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
      await userBox.put('user', hiveUser);
      await orgBox.put('org', OrgInfo(id: 'org1', name: 'Test Org'));

      await fakeSecureStorage.deleteAll();

      when(mockGraphqlConfig.getToken()).thenReturn(null);
      when(mockDatabaseFunctions.init()).thenReturn(null);
      when(mockDatabaseFunctions.gqlAuthQuery(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) async => mockQueryResult);

      final mockData = {
        'user': {
          'id': 'legacy_user',
          'firstName': 'Test',
          'lastName': 'User',
          'email': 'test@example.com',
        }
      };
      when(mockQueryResult.hasException).thenReturn(false);
      when(mockQueryResult.data).thenReturn(mockData);

      await userConfig.userLoggedIn();

      // Auth token migrated
      expect(
          await fakeSecureStorage.readToken('authToken'), 'hive_access_token');
      // Refresh token NOT migrated (null)
      expect(await fakeSecureStorage.readToken('refreshToken'), null);

      await userBox.deleteFromDisk();
      await orgBox.deleteFromDisk();
    });
  });
}
