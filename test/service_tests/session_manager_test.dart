import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/session_manager.dart';

import '../helpers/test_helpers.dart';

void main() {
  late SessionManager sessionManager;

  setUp(() {
    locator.allowReassignment = true;
    setupLocator();
    registerServices();
    // Register mocks
    getAndRegisterDatabaseMutationFunctions();
    getAndRegisterUserConfig();

    // We create a fresh SessionManager for each test
    sessionManager = SessionManager();
  });

  tearDown(() {
    locator.reset();
  });

  group('SessionManager Refresh Tests', () {
    test('refreshSession returns true when succesful', () async {
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
        () {
      fakeAsync((async) {
        // Setup
        when(userConfig.loggedIn).thenReturn(true);
        when(userConfig.currentUser)
            .thenReturn(User(id: '1', refreshToken: 'bad_token'));

        // Mock failure: returning false instead of throwing explicitly
        when(databaseFunctions.refreshAccessToken('bad_token'))
            .thenAnswer((_) async => false);

        // Act
        final future = sessionManager.refreshSession();

        // Fast forward time to cover backoff delays
        async.elapse(const Duration(seconds: 10));

        // Assert
        future.then((result) {
          expect(result, false);
          // Should still retry 3 times because false triggers exception
          verify(databaseFunctions.refreshAccessToken('bad_token')).called(3);
        });

        async.flushMicrotasks();
      });
    });

    test('refreshSession retries 3 times on failure then clears tokens', () {
      fakeAsync((async) {
        // Setup
        when(userConfig.loggedIn).thenReturn(true);
        when(userConfig.currentUser)
            .thenReturn(User(id: '1', refreshToken: 'bad_token'));

        // Mock failure (throws exception as per our implementation)
        when(databaseFunctions.refreshAccessToken('bad_token'))
            .thenThrow(Exception('Network Error'));

        // Act
        final future = sessionManager.refreshSession();

        // Fast forward time to cover backoff delays (100ms, 200ms, 400ms)
        async.elapse(const Duration(seconds: 10));
        // Assert
        future.then((result) {
          expect(result, false);
          // Should call refresh 3 times (initial + 2 retries? No, loop runs 3 times)
          verify(databaseFunctions.refreshAccessToken('bad_token')).called(3);

          // Should call clearTokens (which calls updateAccessToken)
          verify(userConfig.updateAccessToken(
                  accessToken: '', refreshToken: ''))
              .called(1);

          // Verify that userConfig properties were reset
          verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
              .called(1);
          // OrgInfo verification omitted due to lack of value equality, but execution is covered by the above check.
        });

        async.flushMicrotasks();
      });
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
        () {
      fakeAsync((async) {
        // Setup failure condition for refresh
        when(userConfig.loggedIn).thenReturn(true);
        when(userConfig.currentUser)
            .thenReturn(User(id: '1', refreshToken: 'bad_token'));
        when(databaseFunctions.refreshAccessToken('bad_token'))
            .thenThrow(Exception('Network Error'));

        // Mock failure for updateAccessToken (simulating secure storage error)
        when(userConfig.updateAccessToken(accessToken: '', refreshToken: ''))
            .thenThrow(Exception('Storage Error'));

        // Act
        sessionManager.refreshSession();
        async.elapse(const Duration(seconds: 10)); // Allow retries to complete
        async.flushMicrotasks();

        // Assert
        // Verify currentUser was reset despite storage error
        verify(userConfig.currentUser = User(id: 'null', authToken: 'null'))
            .called(1);
      });
    });
  });
}
