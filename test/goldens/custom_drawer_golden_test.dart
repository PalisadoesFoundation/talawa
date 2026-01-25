// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  setUp(() async {
    await locator.reset();
    SizeConfig().test();
    registerServices();
    registerViewModels();

    // We register MainScreenViewModel as a singleton for easier mocking/configuration in tests
    locator.unregister<MainScreenViewModel>();
    locator.registerSingleton<MainScreenViewModel>(MainScreenViewModel());

    // Set default logged in state
    when(userConfig.loggedIn).thenReturn(true);
  });

  tearDown(() async {
    // No need to unregister manually if we reset at the start of each test
  });

  Widget createDrawerForGolden({
    required ThemeMode themeMode,
    required MainScreenViewModel homeModel,
  }) {
    return themedWidget(
      Builder(
        builder: (context) {
          return Scaffold(
            drawer: CustomDrawer(homeModel: homeModel),
            body: Builder(
              builder: (innerContext) {
                // Auto-open drawer for golden test
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scaffold.of(innerContext).openDrawer();
                });
                return Container();
              },
            ),
          );
        },
      ),
      themeMode: themeMode,
    );
  }

  group('CustomDrawer Golden Tests', () {
    testWidgets('custom_drawer with single organization - light theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up single organization
        userConfig.currentOrg = OrgInfo(
          id: '1',
          name: 'Test Organization',
        );
        userConfig.currentUser = User(
          id: '1',
          name: 'John Doe',
          joinedOrganizations: [
            OrgInfo(id: '1', name: 'Test Organization'),
          ],
        );

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.light,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'single_org', 'light'),
          ),
        );
      });
    });

    testWidgets('custom_drawer with single organization - dark theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up single organization
        userConfig.currentOrg = OrgInfo(
          id: '1',
          name: 'Test Organization',
        );
        userConfig.currentUser = User(
          id: '1',
          name: 'John Doe',
          joinedOrganizations: [
            OrgInfo(id: '1', name: 'Test Organization'),
          ],
        );

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.dark,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'single_org', 'dark'),
          ),
        );
      });
    });

    testWidgets('custom_drawer with multiple organizations - light theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up multiple organizations
        userConfig.currentOrg = OrgInfo(
          id: '1',
          name: 'Current Organization',
        );
        userConfig.currentUser = User(
          id: '1',
          name: 'John Doe',
          joinedOrganizations: [
            OrgInfo(id: '1', name: 'Current Organization'),
            OrgInfo(id: '2', name: 'Tech Community'),
            OrgInfo(id: '3', name: 'Sports Club'),
          ],
        );

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.light,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'multiple_orgs', 'light'),
          ),
        );
      });
    });

    testWidgets('custom_drawer with multiple organizations - dark theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up multiple organizations
        userConfig.currentOrg = OrgInfo(
          id: '1',
          name: 'Current Organization',
        );
        userConfig.currentUser = User(
          id: '1',
          name: 'John Doe',
          joinedOrganizations: [
            OrgInfo(id: '1', name: 'Current Organization'),
            OrgInfo(id: '2', name: 'Tech Community'),
            OrgInfo(id: '3', name: 'Sports Club'),
          ],
        );

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.dark,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'multiple_orgs', 'dark'),
          ),
        );
      });
    });

    testWidgets('custom_drawer logged out state - light theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up logged out state
        when(userConfig.loggedIn).thenReturn(false);
        userConfig.currentUser = User(id: 'null', name: 'Guest');
        userConfig.currentOrg = OrgInfo(id: 'null', name: 'No Organization');

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.light,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'logged_out', 'light'),
          ),
        );
      });
    });

    testWidgets('custom_drawer logged out state - dark theme',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        // Set up logged out state
        when(userConfig.loggedIn).thenReturn(false);
        userConfig.currentUser = User(id: 'null', name: 'Guest');
        userConfig.currentOrg = OrgInfo(id: 'null', name: 'No Organization');

        await tester.pumpWidget(
          createDrawerForGolden(
            themeMode: ThemeMode.dark,
            homeModel: homeModel,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile(
            goldenFileName('custom_drawer', 'logged_out', 'dark'),
          ),
        );
      });
    });
  });
}
