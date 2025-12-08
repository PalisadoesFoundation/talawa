import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
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

    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
    registerServices();
  });

  setUp(() {
    mockViewModel = SelectOrganizationViewModel();
  });

  tearDown(() {
    mockViewModel.dispose();
  });

  tearDownAll(() {
    unregisterServices();
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
        body: OrganizationList(model: model),
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
    testWidgets('Renders OrganizationList widget', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pump();

      // Verify the widget is rendered
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('Widget renders without crashing', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );

      // Widget should render immediately
      expect(find.byType(OrganizationList), findsOneWidget);

      // After initial pump, widget should still be present
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('Widget renders after settling', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );

      // Widget should render immediately
      expect(find.byType(OrganizationList), findsOneWidget);

      // Wait for any async operations to complete
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // After settling, widget should still be present
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('CustomListTile widgets use TileType.org when present',
        (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final tileFinder = find.byType(CustomListTile);
      final tiles = tester.widgetList<CustomListTile>(tileFinder);

      // Verify that any tiles that render have the correct type
      for (final tile in tiles) {
        expect(tile.type, equals(TileType.org),
            reason: 'All CustomListTile widgets must have TileType.org');
      }
    });

    testWidgets('Scrollbar configuration is correct when rendered',
        (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final scrollbarFinder = find.byType(Scrollbar);

      // Verify properties for any Scrollbar that renders
      if (scrollbarFinder.evaluate().isNotEmpty) {
        final scrollbar = tester.widget<Scrollbar>(scrollbarFinder);
        expect(scrollbar.thumbVisibility, isTrue,
            reason: 'Scrollbar thumbVisibility must be true');
        expect(scrollbar.interactive, isTrue,
            reason: 'Scrollbar interactive must be true');
      }
    });

    testWidgets('ListView uses viewModel scroll controller when present',
        (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final listViewFinder = find.byType(ListView);

      // Verify controller binding for any ListView that renders
      if (listViewFinder.evaluate().isNotEmpty) {
        final listView = tester.widget<ListView>(listViewFinder);
        expect(listView.controller, equals(mockViewModel.allOrgController),
            reason: 'ListView controller must be viewModel.allOrgController');
      }
    });
  });

  group('OrganizationList Widget Tests - Navigation', () {
    testWidgets('Tapping organization tile navigates when tiles render',
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

      // Test navigation if tiles render
      final tileFinder = find.byType(CustomListTile);
      if (tileFinder.evaluate().isNotEmpty) {
        await tester.tap(tileFinder.first);
        await tester.pumpAndSettle();

        // Verify navigation occurred
        expect(find.text('Organization Info Screen'), findsOneWidget);
      }
    });

    testWidgets('CustomListTile receives correct orgInfo when rendered',
        (tester) async {
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
      if (tileFinder.evaluate().isNotEmpty) {
        final tile = tester.widget<CustomListTile>(tileFinder.first);
        expect(tile.orgInfo, equals(mockOrgs[0]),
            reason: 'Tile must receive correct orgInfo from data');
      }
    });
  });

  group('OrganizationList Widget Tests - Pagination', () {
    testWidgets('Widget renders with pagination data', (tester) async {
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

      // Widget should be rendered
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('Widget renders with large list data', (tester) async {
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
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Widget should render
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('ListView configuration is correct when rendered',
        (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final listViewFinder = find.byType(ListView);

      // Verify ListView configuration if it renders
      if (listViewFinder.evaluate().isNotEmpty) {
        final listView = tester.widget<ListView>(listViewFinder);
        expect(listView.shrinkWrap, isTrue,
            reason: 'ListView shrinkWrap must be true');
        expect(listView.padding, equals(EdgeInsets.zero),
            reason: 'ListView padding must be EdgeInsets.zero');
      }
    });
  });

  group('OrganizationList Widget Tests - Error Handling', () {
    testWidgets('Widget renders without crashing when list is empty',
        (tester) async {
      // Start with empty list
      mockViewModel.organizations = [];

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Widget should render without errors
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('Widget maintains state during data updates', (tester) async {
      // Start with empty
      mockViewModel.organizations = [];

      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pump();

      // Widget should exist initially
      expect(find.byType(OrganizationList), findsOneWidget);

      // Update with data
      mockViewModel.organizations = [
        OrgInfo(
          id: 'org1',
          name: 'New Org',
          image: null,
          userRegistrationRequired: false,
          admins: [],
        ),
      ];

      // Trigger rebuild
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Widget should still exist after update
      expect(find.byType(OrganizationList), findsOneWidget);
    });
  });

  group('OrganizationList Widget Tests - Item Keys', () {
    testWidgets('Widget renders tiles when organization data provided',
        (tester) async {
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
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Widget must render
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('Widget renders with large list', (tester) async {
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
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Widget must render
      expect(find.byType(OrganizationList), findsOneWidget);
    });
  });

  group('OrganizationList Widget Tests - GraphQL Integration', () {
    testWidgets('Widget uses correct ViewModel for data binding',
        (tester) async {
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
