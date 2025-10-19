import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  group(
    "AccessScreenViewModel Test- ",
    () {
      test("Check if it's initialized correctly", () {
        final org = userConfig.currentOrg;
        final model = AccessScreenViewModel();
        expect(model.selectedOrganization.id, '-1');
        model.initialise(org);
        expect(model.selectedOrganization.id, 'XYZ');
      });

      test("Check if error is shown when no organization is selected",
          () async {
        final model = AccessScreenViewModel();
        // selectedOrganization remains with default id '-1'

        await model.sendMembershipRequest();

        verify(
          locator<NavigationService>().showTalawaErrorSnackBar(
            'Please select an organization',
            MessageType.error,
          ),
        );
      });

      test("Check if error is shown when organization id is null", () async {
        final model = AccessScreenViewModel();
        model.selectedOrganization = fakeOrgInfo;
        model.selectedOrganization.id = null;

        await model.sendMembershipRequest();

        verify(
          locator<NavigationService>().showTalawaErrorSnackBar(
            'Please select an organization',
            MessageType.error,
          ),
        );
      });

      test("Check membership request with organization ID mismatch", () async {
        final org = userConfig.currentOrg;
        final model = AccessScreenViewModel();
        model.initialise(org);

        when(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest()),
            ),
            data: {
              'sendMembershipRequest': {
                'userId': 'test-user-id',
                'membershipRequestId': 'test-request-id',
                'organizationId': 'DIFFERENT_ID', // Different from expected
                'status': 'PENDING',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        );

        verify(
          locator<NavigationService>().showTalawaErrorSnackBar(
            'Some error occurred. Please try again later.',
            MessageType.error,
          ),
        );
      });

      test(
          "Check if snackbar is showing in case of not empty joined organization",
          () async {
        final org = userConfig.currentOrg;
        final model = AccessScreenViewModel();
        model.initialise(org);

        when(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest()),
            ),
            data: {
              'sendMembershipRequest': {
                'userId': 'test-user-id',
                'membershipRequestId': 'test-request-id',
                'organizationId': 'XYZ', // Matches expected
                'status': 'PENDING',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        );

        verify(locator<NavigationService>().pop());
        verify(
          locator<NavigationService>().showTalawaErrorSnackBar(
            "Join in request sent to Organization Name successfully",
            MessageType.info,
          ),
        );
      });

      test("Removing joined organizations for testing", () async {
        getAndRegisterUserConfig();
        final org = userConfig.currentOrg;
        userConfig.currentUser.joinedOrganizations = [];
        final model = AccessScreenViewModel();
        model.initialise(org);

        when(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest()),
            ),
            data: {
              'sendMembershipRequest': {
                'userId': 'test-user-id',
                'membershipRequestId': 'test-request-id',
                'organizationId': 'XYZ', // Matches expected
                'status': 'PENDING',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        );

        verify(
          locator<NavigationService>().removeAllAndPush(
            Routes.waitingScreen,
            Routes.splashScreen,
          ),
        );
      });

      test("Check if null data is handled properly", () async {
        final org = userConfig.currentOrg;
        final model = AccessScreenViewModel();
        model.initialise(org);

        when(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest()),
            ),
            data: null, // Null data
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(),
            variables: anyNamed('variables'),
          ),
        );

        // Should not call any navigation or snackbar methods when data is null
        verifyNever(locator<NavigationService>().pop());
      });

      test("Check optionalMessageController initialization", () {
        final model = AccessScreenViewModel();
        expect(model.optionalMessageController, isNotNull);
        expect(model.optionalMessageController.text, isEmpty);
      });
    },
  );
}
