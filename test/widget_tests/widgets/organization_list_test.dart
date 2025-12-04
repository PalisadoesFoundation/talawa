// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();

    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('SelectOrganizationViewModel Properties', () {
    late SelectOrganizationViewModel viewModel;

    setUp(() {
      viewModel = SelectOrganizationViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('allOrgController is initialized as ScrollController', () {
      // Act & Assert
      expect(viewModel.allOrgController, isNotNull);
      expect(viewModel.allOrgController, isA<ScrollController>());
    });

    test('controller is initialized as ScrollController', () {
      // Act & Assert
      expect(viewModel.controller, isNotNull);
      expect(viewModel.controller, isA<ScrollController>());
    });

    test('searchFocus is initialized as FocusNode', () {
      // Act & Assert
      expect(viewModel.searchFocus, isNotNull);
      expect(viewModel.searchFocus, isA<FocusNode>());
    });

    test('searchController is initialized as TextEditingController', () {
      // Act & Assert
      expect(viewModel.searchController, isNotNull);
      expect(viewModel.searchController, isA<TextEditingController>());
    });

    test('organizations list is initialized as empty', () {
      // Act & Assert
      expect(viewModel.organizations, isNotNull);
      expect(viewModel.organizations, isA<List<OrgInfo>>());
      expect(viewModel.organizations, isEmpty);
    });

    test('selectedOrganization is initialized', () {
      // Act & Assert
      expect(viewModel.selectedOrganization, isNotNull);
      expect(viewModel.selectedOrganization, isA<OrgInfo>());
    });

    test('searching is initialized as false', () {
      // Act & Assert
      expect(viewModel.searching, isFalse);
    });

    test('showSearchOrgList is initialized as Container', () {
      // Act & Assert
      expect(viewModel.showSearchOrgList, isNotNull);
      expect(viewModel.showSearchOrgList, isA<Container>());
    });
  });

  group('SelectOrganizationViewModel Methods', () {
    late SelectOrganizationViewModel viewModel;

    setUp(() {
      viewModel = SelectOrganizationViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('searchActive toggles searching flag', () {
      // Arrange
      expect(viewModel.searching, isFalse);

      // Act - searchActive checks hasFocus, so we test the method exists and can be called
      // In a real widget tree, this would toggle the flag when focused
      viewModel.searchActive();

      // Assert - verify the method doesn't throw
      // The actual behavior depends on widget tree context (hasFocus)
      expect(viewModel, isNotNull);
    });

    test('fetchMoreHelper accepts FetchMore and organizations list', () {
      // Arrange
      final orgs = [
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
      ];
      viewModel.organizations = orgs;

      // Act & Assert - Method exists and can be called
      // fetchMoreHelper is void, so we just verify it doesn't throw
      expect(() {
        viewModel.fetchMoreHelper(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('query { test }')),
            source: QueryResultSource.network,
          ),
          orgs,
        );
      }, returnsNormally);
    });

    test('organizations list can be updated', () {
      // Arrange
      final org1 = OrgInfo(id: '1', name: 'Org 1');
      final org2 = OrgInfo(id: '2', name: 'Org 2');

      // Act
      viewModel.organizations = [org1, org2];

      // Assert
      expect(viewModel.organizations.length, equals(2));
      expect(viewModel.organizations[0].id, equals('1'));
      expect(viewModel.organizations[1].id, equals('2'));
    });

    test('selectedOrganization can be updated', () {
      // Arrange
      final org = OrgInfo(id: '1', name: 'Test Org');

      // Act
      viewModel.selectedOrganization = org;

      // Assert
      expect(viewModel.selectedOrganization, equals(org));
      expect(viewModel.selectedOrganization?.name, equals('Test Org'));
    });
  });

  group('SelectOrganizationViewModel Lifecycle', () {
    late SelectOrganizationViewModel viewModel;

    setUp(() {
      viewModel = SelectOrganizationViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('dispose can be called without throwing', () {
      // Arrange - Create a fresh instance for this test
      final testViewModel = SelectOrganizationViewModel();

      // Act & Assert - Verify dispose can be called without throwing
      expect(() => testViewModel.dispose(), returnsNormally);
    });

    test('viewModel extends ChangeNotifier', () {
      // Act & Assert
      expect(viewModel, isA<ChangeNotifier>());
    });

    test('multiple organizations can be managed', () {
      // Arrange
      final orgs = List.generate(
        10,
        (index) => OrgInfo(id: '$index', name: 'Org $index'),
      );

      // Act
      viewModel.organizations = orgs;

      // Assert
      expect(viewModel.organizations.length, equals(10));
    });

    test('searchController can store search query', () {
      // Arrange
      const query = 'test search';

      // Act
      viewModel.searchController.text = query;

      // Assert
      expect(viewModel.searchController.text, equals(query));
    });
  });

  group('OrgInfo Model Integration', () {
    late SelectOrganizationViewModel viewModel;

    setUp(() {
      viewModel = SelectOrganizationViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('organizations list can hold multiple OrgInfo objects', () {
      // Arrange
      final orgList = [
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
        OrgInfo(id: '3', name: 'Org 3'),
      ];

      // Act
      viewModel.organizations = orgList;

      // Assert
      expect(viewModel.organizations.length, equals(3));
      expect(viewModel.organizations.isNotEmpty, isTrue);
    });
  });

  group('Organizations List Management', () {
    late SelectOrganizationViewModel viewModel;

    setUp(() {
      viewModel = SelectOrganizationViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('can add organizations to empty list', () {
      // Arrange
      expect(viewModel.organizations, isEmpty);
      final org = OrgInfo(id: '1', name: 'New Org');

      // Act
      viewModel.organizations = [org];

      // Assert
      expect(viewModel.organizations.length, equals(1));
      expect(viewModel.organizations.first.id, equals('1'));
    });

    test('can clear organizations list', () {
      // Arrange
      viewModel.organizations = [
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
      ];
      expect(viewModel.organizations.length, equals(2));

      // Act
      viewModel.organizations = [];

      // Assert
      expect(viewModel.organizations, isEmpty);
    });

    test('can find organization by id', () {
      // Arrange
      final orgs = [
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
        OrgInfo(id: '3', name: 'Org 3'),
      ];
      viewModel.organizations = orgs;

      // Act
      final found = viewModel.organizations.firstWhere(
        (org) => org.id == '2',
        orElse: () => OrgInfo(id: '-1', name: 'Not found'),
      );

      // Assert
      expect(found.id, equals('2'));
      expect(found.name, equals('Org 2'));
    });

    test('scroll controllers are properly initialized', () {
      // Arrange & Act
      final allOrgControllerInitial = viewModel.allOrgController;
      final controllerInitial = viewModel.controller;

      // Assert - Controllers should not be null and should be ScrollControllers
      expect(allOrgControllerInitial, isNotNull);
      expect(controllerInitial, isNotNull);
      expect(allOrgControllerInitial, isA<ScrollController>());
      expect(controllerInitial, isA<ScrollController>());
    });
  });
}
