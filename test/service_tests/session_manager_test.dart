import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/session_manager.dart';

import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SessionManager sessionManager;

  setUpAll(() {
    setupLocator();
  });

  group('Test Session Manager', () {
    setUp(() {
      getAndRegisterDatabaseMutationFunctions();
      getAndRegisterUserConfig();

      when(userConfig.loggedIn).thenReturn(true);
      when(userConfig.currentUser).thenReturn(User(
        id: "id",
        name: "Test User",
        refreshToken: "testtoken",
      ));

      sessionManager = SessionManager();
    });

    test('Test Session Manager Constructor', () {
      expect(sessionManager, isA<SessionManager>());
    });

    test('Refresh Interval is set.', () {
      expect(sessionManager.refreshInterval, 600);
    });

    test('initialize refresh interval sets timer', () {
      fakeAsync((async) {
        SessionManager();
        when(databaseFunctions.refreshAccessToken("testtoken"))
            .thenAnswer((_) async => true);

        async.elapse(const Duration(seconds: 600));

        verify(databaseFunctions.refreshAccessToken("testtoken")).called(1);
      });
    });

    test('refreshSession success on first attempt', () async {
      when(databaseFunctions.refreshAccessToken("testtoken"))
          .thenAnswer((_) async => true);

      final success = await sessionManager.refreshSession();
      expect(success, true);

      verify(databaseFunctions.refreshAccessToken("testtoken")).called(1);
    });

    test('refreshSession retries on failure and eventually succeeds', () {
      var attempts = 0;
      when(databaseFunctions.refreshAccessToken("testtoken"))
          .thenAnswer((_) async {
        attempts++;
        if (attempts < 3) return false;
        return true;
      });

      fakeAsync((async) async {
        final future = sessionManager.refreshSession();

        async.elapse(const Duration(milliseconds: 100));
        async.elapse(const Duration(milliseconds: 200));

        final success = await future;
        expect(success, true);
      });

      verify(databaseFunctions.refreshAccessToken("testtoken")).called(3);
    });

    test('refreshSession fails after retries and clears tokens', () {
      when(databaseFunctions.refreshAccessToken("testtoken"))
          .thenAnswer((_) async => false);

      fakeAsync((async) async {
        final future = sessionManager.refreshSession();

        async.elapse(const Duration(milliseconds: 1000));

        final success = await future;
        expect(success, false);

        verify(userConfig.currentUser =
                argThat(predicate<User>((u) => u.id == null)) as User)
            .called(1);
      });

      verify(databaseFunctions.refreshAccessToken("testtoken")).called(3);
    });

    test('refreshSession prevents concurrent calls', () {
      when(databaseFunctions.refreshAccessToken("testtoken"))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 1));
        return true;
      });

      fakeAsync((async) async {
        final f1 = sessionManager.refreshSession();
        final f2 = sessionManager.refreshSession();

        async.elapse(const Duration(seconds: 2));

        final s1 = await f1;
        final s2 = await f2;

        expect(s1, true);
        expect(s2, false);
      });

      verify(databaseFunctions.refreshAccessToken("testtoken")).called(1);
    });
  });
}
