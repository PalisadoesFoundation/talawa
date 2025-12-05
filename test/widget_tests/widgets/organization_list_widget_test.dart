import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/organization_list.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// Main test suite for OrganizationList widget.
void main() {
  late SelectOrganizationViewModel mockViewModel;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    mockViewModel = SelectOrganizationViewModel();
  });

  tearDown(() {
    mockViewModel.dispose();
  });

  /// Helper function to create test widget.
  Widget createOrganizationListTestWidget({
    required SelectOrganizationViewModel model,
  }) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        body: GraphQLProvider(
          client: ValueNotifier<GraphQLClient>(graphqlConfig.clientToQuery()),
          child: OrganizationList(model: model),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (settings) {
        if (settings.name == '/OrganisationInfoScreen') {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Org Info')),
              body: const Center(child: Text('Organization Info Screen')),
            ),
          );
        }
        return null;
      },
    );
  }

  group('OrganizationList Widget Tests - UI Rendering', () {
    testWidgets('Renders Scrollbar with ListView', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scrollbar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Shows loading indicator when loading', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );

      // Before data loads
      await tester.pump(const Duration(milliseconds: 100));

      // May show loading indicator
      expect(
        find.byType(CupertinoActivityIndicator),
        findsWidgets,
      );
    });

    testWidgets('Renders CustomListTile for each organization', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Check if CustomListTiles are rendered
      expect(find.byType(CustomListTile), findsWidgets);
    });

    testWidgets('CustomListTile has correct TileType.org', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final tiles = tester.widgetList<CustomListTile>(
        find.byType(CustomListTile),
      );

      for (final tile in tiles) {
        expect(tile.type, equals(TileType.org));
      }
    });

    testWidgets('Scrollbar is interactive and visible', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      final scrollbar = tester.widget<Scrollbar>(find.byType(Scrollbar));
      expect(scrollbar.thumbVisibility, isTrue);
      expect(scrollbar.interactive, isTrue);
    });

    testWidgets('ListView uses correct scroll controller', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.controller, equals(mockViewModel.allOrgController));
    });
  });

  group('OrganizationList Widget Tests - Navigation', () {
    testWidgets('Tapping organization navigates to info screen',
        (tester) async {
      // Create mock organizations
      final mockOrgs = [
        OrgInfo(
          id: 'org1',
          name: 'Test Organization 1',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      ];

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Find and tap the first organization tile
      final tileFinder = find.byType(CustomListTile);
      expect(tileFinder, findsOneWidget);

      await tester.tap(tileFinder.first);
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Organization Info Screen'), findsOneWidget);
    });

    testWidgets('CustomListTile is wired with correct OrgInfo', (tester) async {
      final mockOrgs = [
        OrgInfo(
          id: 'org1',
          name: 'Test Organization 1',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      ];

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final tileFinder = find.byType(CustomListTile);
      expect(tileFinder, findsOneWidget);

      final tile = tester.widget<CustomListTile>(tileFinder.first);
      expect(tile.orgInfo, equals(mockOrgs[0]));
    });
  });

  group('OrganizationList Widget Tests - Pagination', () {
    testWidgets('Shows loading indicator when data is loading', (tester) async {
      // Create enough orgs to trigger pagination
      final mockOrgs = List.generate(
        20,
        (i) => OrgInfo(
          id: 'org$i',
          name: 'Test Organization $i',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      );

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pump(const Duration(milliseconds: 100));

      // Should show activity indicator while loading
      expect(find.byType(CupertinoActivityIndicator), findsWidgets);
    });

    testWidgets('VisibilityDetector widget exists for pagination',
        (tester) async {
      final mockOrgs = List.generate(
        20,
        (i) => OrgInfo(
          id: 'org$i',
          name: 'Test Organization $i',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      );

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify VisibilityDetector exists for pagination
      expect(find.byKey(const Key('OrgSelItem')), findsWidgets);
    });

    testWidgets('ListView shrinkWrap is enabled', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.shrinkWrap, isTrue);
    });

    testWidgets('ListView padding is zero', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.padding, equals(EdgeInsets.zero));
    });
  });

  group('OrganizationList Widget Tests - Error Handling', () {
    testWidgets('Handles empty organization list gracefully', (tester) async {
      mockViewModel.organizations = [];

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Should not crash and render no organization tiles
      expect(find.byType(OrganizationList), findsOneWidget);
      expect(find.byType(CustomListTile), findsNothing);
    });

    testWidgets('Widget rebuilds when organizations change', (tester) async {
      mockViewModel.organizations = [];

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      // Update organizations
      mockViewModel.organizations = [
        OrgInfo(
          id: 'org1',
          name: 'New Org',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      ];

      // Trigger rebuild and verify UI reflects the new data
      await tester.pumpAndSettle();
      expect(find.byType(CustomListTile), findsOneWidget);
    });
  });

  group('OrganizationList Widget Tests - Item Keys', () {
    testWidgets('CustomListTile items have unique keys', (tester) async {
      final mockOrgs = List.generate(
        5,
        (i) => OrgInfo(
          id: 'org$i',
          name: 'Test Organization $i',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      );

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify unique keys exist
      for (int i = 0; i < 5; i++) {
        expect(find.byKey(Key('OrgSelItem$i')), findsOneWidget);
      }
    });

    testWidgets('VisibilityDetector has correct key', (tester) async {
      final mockOrgs = List.generate(
        20,
        (i) => OrgInfo(
          id: 'org$i',
          name: 'Test Organization $i',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      );

      mockViewModel.organizations = mockOrgs;

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify VisibilityDetector key
      expect(find.byKey(const Key('OrgSelItem')), findsOneWidget);
    });
  });

  group('OrganizationList Widget Tests - GraphQL Integration', () {
    testWidgets('Widget wraps content in GraphQLProvider', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GraphQLProvider), findsOneWidget);
    });

    testWidgets('Uses correct ViewModel for data binding', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle();

      // Widget should exist and use the provided model
      expect(find.byType(OrganizationList), findsOneWidget);
      final widget = tester.widget<OrganizationList>(
        find.byType(OrganizationList),
      );
      expect(widget.model, equals(mockViewModel));
    });
  });
}
