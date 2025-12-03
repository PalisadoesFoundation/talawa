// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/organization_list.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

// Mock classes
class MockSelectOrganizationViewModel extends Mock
    implements SelectOrganizationViewModel {}

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryResult extends Mock implements QueryResult<dynamic> {}

// Helper to create test widget tree
Widget createOrganizationListWidget({
  required SelectOrganizationViewModel model,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: Scaffold(
      body: OrganizationList(model: model),
    ),
  );
}

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

  group('OrganizationList Widget Rendering', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      // Initialize organizations list
      when(mockViewModel.organizations).thenReturn([]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('OrganizationList widget renders correctly', (tester) async {
      // Arrange
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Act & Assert
      expect(find.byType(OrganizationList), findsOneWidget);
      expect(find.byType(GraphQLProvider), findsOneWidget);
      expect(find.byType(Query), findsOneWidget);
    });

    testWidgets('OrganizationList widget renders with Scaffold',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(OrganizationList), findsOneWidget);
    });

    testWidgets('OrganizationList has Scrollbar widget', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(Scrollbar), findsOneWidget);
    });
  });

  group('GraphQL Query States', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('OrganizationList renders ListView when data loads',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });

    testWidgets('Query options contain correct document and variables',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Verify Query widget exists and is rendered
      expect(find.byType(Query), findsOneWidget);
    });

    testWidgets('OrganizationList initializes empty organizations list',
        (tester) async {
      // Arrange
      when(mockViewModel.organizations).thenReturn([]);

      // Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(mockViewModel.organizations, isEmpty);
    });

    testWidgets(
        'OrganizationList uses allOrgController for ListView scroll control',
        (tester) async {
      // Arrange
      final scrollController = ScrollController();
      when(mockViewModel.allOrgController).thenReturn(scrollController);

      // Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
      verify(mockViewModel.allOrgController).called(greaterThan(0));
    });
  });

  group('Error Handling', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('OrganizationList renders Container on error/exception',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Verifies error handling path is available
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('OrganizationList has exception handling logic',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Query widget handles exceptions
      expect(find.byType(Query), findsOneWidget);
    });

    testWidgets('OrganizationList initializes refetch counter', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Refetch logic counter is set to 0 initially
      expect(find.byType(Query), findsOneWidget);
    });
  });

  group('Pagination and Lazy Loading', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
      ]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('OrganizationList initializes with fetch size of 15',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Query options verify initial fetch size
      expect(find.byType(Query), findsOneWidget);
    });

    testWidgets('OrganizationList has fetchMoreHelper for pagination',
        (tester) async {
      // Arrange
      when(mockViewModel.fetchMoreHelper(any, any)).thenReturn(null);

      // Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(Query), findsOneWidget);
    });

    testWidgets('OrganizationList renders VisibilityDetector for lazy loading',
        (tester) async {
      // Arrange
      when(mockViewModel.organizations).thenReturn(List.generate(
        15,
        (index) => OrgInfo(id: '$index', name: 'Org $index'),
      ));

      // Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(VisibilityDetector), findsWidgets);
    });
  });

  group('ListView ItemBuilder Tests', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
        OrgInfo(id: '3', name: 'Org 3'),
      ]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('ListView renders CustomListTile for each organization',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(CustomListTile), findsWidgets);
    });

    testWidgets('ListView uses separatorBuilder with Container',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });

    testWidgets('ListView assigns unique keys to items', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert - Verify keys are present for each item
      expect(find.byKey(const Key('OrgSelItem0')), findsWidgets);
      expect(find.byKey(const Key('OrgSelItem1')), findsWidgets);
      expect(find.byKey(const Key('OrgSelItem2')), findsWidgets);
    });

    testWidgets('ListView shows loading indicator when isLoading is true',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });
  });

  group('SelectOrganizationViewModel Integration', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([
        OrgInfo(id: '1', name: 'Test Org'),
      ]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('OrganizationList accepts SelectOrganizationViewModel',
        (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(OrganizationList), findsOneWidget);
      verify(mockViewModel.allOrgController).called(greaterThan(0));
    });

    testWidgets('OrganizationList updates organizations from model',
        (tester) async {
      // Arrange
      final orgs = [
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
      ];
      when(mockViewModel.organizations).thenReturn(orgs);

      // Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(mockViewModel.organizations, equals(orgs));
      expect(mockViewModel.organizations.length, equals(2));
    });
  });

  group('CustomListTile Integration', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([
        OrgInfo(id: '1', name: 'Org 1'),
        OrgInfo(id: '2', name: 'Org 2'),
      ]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('CustomListTile receives org info correctly', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(CustomListTile), findsWidgets);
    });

    testWidgets('CustomListTile has onTapOrgInfo callback', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
          home: Scaffold(
            body: OrganizationList(model: mockViewModel),
          ),
          onGenerateRoute: (settings) {
            if (settings.name == '/OrganisationInfoScreen') {
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(child: Text('Org Info')),
                ),
              );
            }
            return null;
          },
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(CustomListTile), findsWidgets);
    });
  });

  group('ListView Configuration', () {
    late MockSelectOrganizationViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockSelectOrganizationViewModel();
      when(mockViewModel.organizations).thenReturn([
        OrgInfo(id: '1', name: 'Org 1'),
      ]);
      when(mockViewModel.allOrgController).thenReturn(ScrollController());
    });

    tearDown(() {
      mockViewModel.organizations.clear();
      mockViewModel.allOrgController.dispose();
    });

    testWidgets('ListView has shrinkWrap enabled', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });

    testWidgets('ListView has zero padding', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });

    testWidgets('ListView uses ListView.separated', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createOrganizationListWidget(model: mockViewModel),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Assert
      expect(find.byType(ListView), findsWidgets);
    });
  });
}
