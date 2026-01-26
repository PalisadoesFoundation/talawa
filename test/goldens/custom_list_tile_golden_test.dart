// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  Widget createListTileForGolden({
    required ThemeMode themeMode,
    required TileType type,
    OrgInfo? orgInfo,
    User? userInfo,
    Attendee? attendeeInfo,
    Options? option,
  }) {
    return themedWidget(
      CustomListTile(
        key: const Key('test_tile'),
        index: 0,
        type: type,
        orgInfo: orgInfo,
        userInfo: userInfo,
        attendeeInfo: attendeeInfo,
        option: option,
      ),
      themeMode: themeMode,
    );
  }

  group('CustomListTile Golden Tests', () {
    testWidgets('custom_list_tile org type - light theme',
        (WidgetTester tester) async {
      final orgInfo = OrgInfo(
        id: '1',
        name: 'Test Organization',
        city: 'New York',
        countryCode: 'US',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.org,
          orgInfo: orgInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'org_type', 'light'),
        ),
      );
    });

    testWidgets('custom_list_tile org type - dark theme',
        (WidgetTester tester) async {
      final orgInfo = OrgInfo(
        id: '1',
        name: 'Test Organization',
        city: 'New York',
        countryCode: 'US',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.dark,
          type: TileType.org,
          orgInfo: orgInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'org_type', 'dark'),
        ),
      );
    });

    testWidgets('custom_list_tile org without location - light theme',
        (WidgetTester tester) async {
      final orgInfo = OrgInfo(
        id: '1',
        name: 'Organization Without Location',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.org,
          orgInfo: orgInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'org_no_location', 'light'),
        ),
      );
    });

    testWidgets('custom_list_tile org without location - dark theme',
        (WidgetTester tester) async {
      final orgInfo = OrgInfo(
        id: '1',
        name: 'Organization Without Location',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.dark,
          type: TileType.org,
          orgInfo: orgInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'org_no_location', 'dark'),
        ),
      );
    });

    testWidgets('custom_list_tile user type - light theme',
        (WidgetTester tester) async {
      final userInfo = User(
        id: '1',
        name: 'John Doe',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.user,
          userInfo: userInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'user_type', 'light'),
        ),
      );
    });

    testWidgets('custom_list_tile user type - dark theme',
        (WidgetTester tester) async {
      final userInfo = User(
        id: '1',
        name: 'John Doe',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.dark,
          type: TileType.user,
          userInfo: userInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'user_type', 'dark'),
        ),
      );
    });

    testWidgets('custom_list_tile attendee type - light theme',
        (WidgetTester tester) async {
      final attendeeInfo = Attendee(
        id: '1',
        firstName: 'Jane',
        lastName: 'Smith',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.attendee,
          attendeeInfo: attendeeInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'attendee_type', 'light'),
        ),
      );
    });

    testWidgets('custom_list_tile attendee type - dark theme',
        (WidgetTester tester) async {
      final attendeeInfo = Attendee(
        id: '1',
        firstName: 'Jane',
        lastName: 'Smith',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.dark,
          type: TileType.attendee,
          attendeeInfo: attendeeInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'attendee_type', 'dark'),
        ),
      );
    });

    testWidgets('custom_list_tile option type - light theme',
        (WidgetTester tester) async {
      final option = Options(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        subtitle: 'Configure app settings',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.option,
          option: option,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'option_type', 'light'),
        ),
      );
    });

    testWidgets('custom_list_tile option type - dark theme',
        (WidgetTester tester) async {
      final option = Options(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        subtitle: 'Configure app settings',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.dark,
          type: TileType.option,
          option: option,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'option_type', 'dark'),
        ),
      );
    });

    testWidgets('custom_list_tile long org name - light theme',
        (WidgetTester tester) async {
      final orgInfo = OrgInfo(
        id: '1',
        name: 'Very Long Organization Name That Should Be Displayed',
        city: 'San Francisco',
        countryCode: 'US',
      );

      await tester.pumpWidget(
        createListTileForGolden(
          themeMode: ThemeMode.light,
          type: TileType.org,
          orgInfo: orgInfo,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_list_tile', 'long_org_name', 'light'),
        ),
      );
    });
  });
}
