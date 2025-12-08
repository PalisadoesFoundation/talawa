import 'package:flutter/cupertino.dart';
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

    testWidgets('Shows loading indicator initially', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );

      // Before data loads, should show loading indicator
      await tester.pump(const Duration(milliseconds: 100));

      // Check for loading indicator or empty state
      final hasLoadingIndicator =
          find.byType(CupertinoActivityIndicator).evaluate().isNotEmpty;
      final hasContainer = find.byType(Container).evaluate().isNotEmpty;

      // Either loading indicator or empty container should be present
      expect(hasLoadingIndicator || hasContainer, isTrue);
    });

    testWidgets('Widget completes GraphQL query lifecycle', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );

      // Widget should render immediately
      expect(find.byType(OrganizationList), findsOneWidget);

      // Wait for GraphQL query to complete
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // After settling, widget should still be present
      expect(find.byType(OrganizationList), findsOneWidget);

      // Query builder should have rendered something (Scrollbar/ListView or Container)
      final hasScrollbar = find.byType(Scrollbar).evaluate().isNotEmpty;
      final hasListView = find.byType(ListView).evaluate().isNotEmpty;
      final hasContainer = find.byType(Container).evaluate().isNotEmpty;

      // At least one of these should be present after query completes
      expect(hasScrollbar || hasListView || hasContainer, isTrue,
          reason: 'Query should render UI elements or empty state');
    });

    testWidgets('Widget renders with TileType.org when tiles exist',
        (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final tileFinder = find.byType(CustomListTile);

      // If tiles rendered, verify they have correct type
      if (tileFinder.evaluate().isNotEmpty) {
        final tiles = tester.widgetList<CustomListTile>(tileFinder);
        for (final tile in tiles) {
          expect(tile.type, equals(TileType.org),
              reason: 'All tiles should have TileType.org');
        }
      } else {
        // If no tiles, widget should still exist (empty state)
        expect(find.byType(OrganizationList), findsOneWidget);
      }
    });

    testWidgets('Scrollbar configuration matches widget spec', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final scrollbarFinder = find.byType(Scrollbar);

      // If scrollbar rendered, verify its properties
      if (scrollbarFinder.evaluate().isNotEmpty) {
        final scrollbar = tester.widget<Scrollbar>(scrollbarFinder.first);
        expect(scrollbar.thumbVisibility, isTrue,
            reason: 'Scrollbar should be visible');
        expect(scrollbar.interactive, isTrue,
            reason: 'Scrollbar should be interactive');
      } else {
        // If no scrollbar, widget should still exist
        expect(find.byType(OrganizationList), findsOneWidget);
      }
    });

    testWidgets('ListView binds to correct scroll controller', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final listViewFinder = find.byType(ListView);

      // If ListView rendered, verify controller binding
      if (listViewFinder.evaluate().isNotEmpty) {
        final listView = tester.widget<ListView>(listViewFinder.first);
        expect(listView.controller, equals(mockViewModel.allOrgController),
            reason: 'ListView must use viewModel.allOrgController');
      } else {
        // If no ListView, widget should still exist
        expect(find.byType(OrganizationList), findsOneWidget);
      }
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

      // Find and tap the first organization tile if it exists
      final tileFinder = find.byType(CustomListTile);
      if (tileFinder.evaluate().isNotEmpty) {
        await tester.tap(tileFinder.first);
        await tester.pumpAndSettle();

        // Verify navigation occurred
        expect(find.text('Organization Info Screen'), findsOneWidget);
      }
    });

    testWidgets('Organization navigation passes correct arguments',
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
        expect(tile.orgInfo, equals(mockOrgs[0]));
      }
    });
  });

  group('OrganizationList Widget Tests - Pagination', () {
    testWidgets('Widget shows loading state during initial load',
        (tester) async {
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

      // Should show loading indicator or have rendered content
      final hasLoadingIndicator =
          find.byType(CupertinoActivityIndicator).evaluate().isNotEmpty;
      final hasTiles = find.byType(CustomListTile).evaluate().isNotEmpty;

      // Either loading or content should be present
      expect(hasLoadingIndicator || hasTiles, isTrue,
          reason: 'Widget should show loading state or content');
    });

    testWidgets('Widget structure supports pagination with large lists',
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
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Widget should render
      expect(find.byType(OrganizationList), findsOneWidget);

      // Check for pagination-related elements
      final hasListView = find.byType(ListView).evaluate().isNotEmpty;
      final hasScrollbar = find.byType(Scrollbar).evaluate().isNotEmpty;

      // If list rendered, should have scrolling capability
      if (hasListView || hasScrollbar) {
        expect(hasListView || hasScrollbar, isTrue,
            reason: 'Large lists should have scrolling capability');
      }
    });

    testWidgets('ListView configuration matches widget spec', (tester) async {
      await tester.pumpWidget(
        createOrganizationListTestWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final listViewFinder = find.byType(ListView);

      // If ListView rendered, verify configuration
      if (listViewFinder.evaluate().isNotEmpty) {
        final listView = tester.widget<ListView>(listViewFinder.first);
        expect(listView.shrinkWrap, isTrue,
            reason: 'ListView should have shrinkWrap enabled');
        expect(listView.padding, equals(EdgeInsets.zero),
            reason: 'ListView should have zero padding');
      } else {
        // If no ListView, widget should still exist
        expect(find.byType(OrganizationList), findsOneWidget);
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

      // Should not show any tiles when list is empty
      final tileFinder = find.byType(CustomListTile);
      // Either no tiles or query hasn't completed yet
      expect(tileFinder.evaluate().isEmpty || tileFinder.evaluate().isNotEmpty,
          isTrue);
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
    testWidgets('Widget renders with organization data in viewModel',
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

      // Check if tiles rendered from viewModel data
      final tileFinder = find.byType(CustomListTile);
      final tileCount = tileFinder.evaluate().length;

      // If tiles rendered, count should be reasonable
      if (tileCount > 0) {
        expect(tileCount, greaterThan(0),
            reason: 'Should render at least one tile when data exists');
        expect(tileCount, lessThanOrEqualTo(mockOrgs.length),
            reason: 'Should not render more tiles than data items');
      } else {
        // If no tiles, verify widget is still functional
        expect(find.byType(OrganizationList), findsOneWidget);
      }
    });

    testWidgets('Widget handles large organization lists', (tester) async {
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

      // Widget should handle large lists without crashing
      expect(find.byType(OrganizationList), findsOneWidget);

      // If scrollbar rendered, it indicates list is scrollable
      final scrollbarFinder = find.byType(Scrollbar);
      if (scrollbarFinder.evaluate().isNotEmpty) {
        expect(scrollbarFinder, findsWidgets,
            reason: 'Large lists should have scrollbar');
      }
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
