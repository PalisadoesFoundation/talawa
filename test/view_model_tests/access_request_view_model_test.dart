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
  testSetupLocator();

  setUpAll(() {
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

      test(
          "Check if snackbar is showing in case of not empty joined organization",
          () async {
        final org = userConfig.currentOrg;
        final model = AccessScreenViewModel();
        model.initialise(org);

        when(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(org.id!),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest(org.id!)),
            ),
            data: {
              'sendMembershipRequest': {
                'organization': {
                  '_id': 'XYZ',
                  'name': 'Organization Name',
                  'image': null,
                  'description': null,
                  'isPublic': false,
                  'creator': {
                    'firstName': 'ravidi',
                    'lastName': 'shaikh',
                    'image': null,
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(org.id!),
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
            queries.sendMembershipRequest(org.id!),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(
              document: gql(queries.sendMembershipRequest(org.id!)),
            ),
            data: {
              'sendMembershipRequest': {
                'organization': {
                  '_id': 'XYZ',
                  'name': 'Organization Name',
                  'image': null,
                  'description': null,
                  'isPublic': false,
                  'creator': {
                    'firstName': 'ravidi',
                    'lastName': 'shaikh',
                    'image': null,
                  },
                },
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await model.sendMembershipRequest();

        verify(
          databaseFunctions.gqlAuthMutation(
            queries.sendMembershipRequest(org.id!),
          ),
        );

        verify(
          locator<NavigationService>().removeAllAndPush(
            Routes.waitingScreen,
            Routes.splashScreen,
          ),
        );
      });
    },
  );
}
