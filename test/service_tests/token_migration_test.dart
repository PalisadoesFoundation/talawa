import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
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

    setUp(() {
      testSetupLocator();

      fakeSecureStorage =
          locator<SecureStorageService>() as FakeSecureStorageService;
      mockGraphqlConfig = getAndRegisterGraphqlConfig() as MockGraphqlConfig;
      mockDatabaseFunctions = getAndRegisterDatabaseMutationFunctions()
          as MockDataBaseMutationFunctions;
      mockQueryResult = MockQueryResult();

      try {
        Hive.init('test/hive_storage');
      } catch (e) {
        // Ignore initialization error if Hive is already initialized
      }
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
  });
}
