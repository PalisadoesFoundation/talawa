// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/waiting_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockDataBaseMutationFunctions mockDbFunctions;

  setUp(() {
    registerServices();
    mockDbFunctions = getAndRegisterDatabaseMutationFunctions()
        as MockDataBaseMutationFunctions;
  });

  tearDown(() {
    unregisterServices();
  });

  group("WaitingViewModel Test - ", () {
    test("Check if it's initialized correctly", () {
      final model = WaitingViewModel();
      model.initialise();
      expect(
        model.pendingRequestOrg,
        userConfig.currentUser.membershipRequests,
      );
    });

    test("Check if joinOrg() is pushing the joinOrg route", () {
      final model = WaitingViewModel();
      model.initialise();
      when(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'))
          .thenAnswer((_) async {});

      model.joinOrg();

      verify(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'));
    });

    test("Check if settingPageNavigation() is working properly", () {
      final model = WaitingViewModel();
      model.initialise();

      when(
        navigationService.pushScreen(
          Routes.appSettings,
        ),
      ).thenAnswer((_) async {});

      model.settingPageNavigation();

      verify(
        navigationService.pushScreen(
          Routes.appSettings,
        ),
      );
    });

    group('getOrgInfo Tests - ', () {
      test('returns OrgInfo on successful query', () async {
        final model = WaitingViewModel();
        model.initialise();

        const testOrgId = 'test-org-id';
        final query = Queries().fetchOrgById(testOrgId);

        final mockOrgData = {
          'organization': {
            '_id': testOrgId,
            'name': 'Test Organization',
            'description': 'Test Description',
            'isPublic': true,
            'creatorInfo': {'_id': 'creator-id'},
            'members': [],
            'admins': [],
          },
        };

        when(mockDbFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult.internal(
            parserFn: (map) => testOrgId,
            source: QueryResultSource.network,
            data: mockOrgData,
          ),
        );

        final result = await model.getOrgInfo(testOrgId);

        expect(result, isNotNull);
        expect(result, isA<OrgInfo>());
        expect(result!.id, testOrgId);
        expect(result.name, 'Test Organization');
      });

      test('returns null and shows snackbar when hasException is true',
          () async {
        final model = WaitingViewModel();
        model.initialise();

        const testOrgId = 'test-org-id';
        final query = Queries().fetchOrgById(testOrgId);

        when(mockDbFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult.internal(
            parserFn: (map) => testOrgId,
            source: QueryResultSource.network,
            data: null,
            exception: OperationException(
              graphqlErrors: [const GraphQLError(message: 'Test error')],
            ),
          ),
        );

        final result = await model.getOrgInfo(testOrgId);

        expect(result, isNull);
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Some error occurred. Please try again later.',
            MessageType.error,
          ),
        ).called(1);
      });

      test('returns null and shows snackbar when data is null', () async {
        final model = WaitingViewModel();
        model.initialise();

        const testOrgId = 'test-org-id';
        final query = Queries().fetchOrgById(testOrgId);

        when(mockDbFunctions.gqlAuthQuery(query)).thenAnswer(
          (_) async => QueryResult.internal(
            parserFn: (map) => testOrgId,
            source: QueryResultSource.network,
            data: null,
          ),
        );

        final result = await model.getOrgInfo(testOrgId);

        expect(result, isNull);
        verify(
          navigationService.showTalawaErrorSnackBar(
            'Some error occurred. Please try again later.',
            MessageType.error,
          ),
        ).called(1);
      });
    });
  });
}
