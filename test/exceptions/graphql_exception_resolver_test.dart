import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';

import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  registerServices();
  graphqlConfig.test();
  group('Test GraphQl Exception resolver', () {
    test('CriticalActionException', () {
      final CriticalActionException criticalActionException =
          CriticalActionException('Test Error');
      final result = GraphqlExceptionResolver.encounteredExceptionOrError(
        criticalActionException,
      );
      verify(
        navigationService.showCustomToast('Test Error'),
      );
      expect(result, false);
    });
    test('userNotFound', () {
      final OperationException operationException = OperationException();

      const GraphQLError userNotFound =
          GraphQLError(message: TalawaErrors.userNotFound);

      operationException.graphqlErrors.add(userNotFound);

      final result = GraphqlExceptionResolver.encounteredExceptionOrError(
        operationException,
        showSnackBar: true,
      );

      expect(result, false);
    });

    test('refreshAccessTokenExpiredException', () {
      final OperationException operationException = OperationException();

      const refreshToken = 'refreshToken';
      when(userConfig.currentUser).thenReturn(User(refreshToken: refreshToken));

      when(
        databaseFunctions.refreshAccessToken(refreshToken),
      ).thenAnswer((_) async => true);

      when(graphqlConfig.getToken()).thenAnswer((_) async => true);

      const GraphQLError refreshAccessTokenExpiredException = GraphQLError(
        message: TalawaErrors.refreshAccessTokenExpiredException,
      );

      operationException.graphqlErrors.add(refreshAccessTokenExpiredException);

      final result = GraphqlExceptionResolver.encounteredExceptionOrError(
        operationException,
      );

      expect(result, true);
    });
  });
}
