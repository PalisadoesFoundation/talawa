import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/session_manager.dart';

import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupLocator();
  });

  group('Test Session Manger', () {
    setUpAll(() {
      getAndRegisterDatabaseMutationFunctions();
    });
    test('Test Session Manager Constructor', () {
      SessionManager();
    });

    test('initialize refresh interval', () {
      userConfig.currentUser = User(
        id: "99",
        firstName: 'Azad',
        refreshToken: 'refreshToken',
      );
      fakeAsync((async) {
        sessionManager.initializeSessionRefresher();
        async.elapse(const Duration(seconds: 600));
      });
    });

    test('Refresh Interval is set.', () {
      expect(sessionManager.refreshInterval, 600);
    });

    test('Refresh Token Method', () {
      sessionManager.refreshSession();
      verify(databaseFunctions.refreshAccessToken("refreshToken"));
    });
  });
}
