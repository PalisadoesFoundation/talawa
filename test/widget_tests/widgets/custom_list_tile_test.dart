// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

TileType _tileType = TileType.org;
OrgInfo _orgInfo = OrgInfo();
const Key _key = Key('CustomListTileKey');
int _index = 0;
Options _option = Options(
  icon: const Icon(Icons.add),
  title: 'Test',
  subtitle: 'Just a test',
);
bool _showIcon = false;
User _userInfo = User();

// ignore: prefer_function_declarations_over_variables
dynamic Function(OrgInfo)? _onTapOrgInfo = (OrgInfo orgInfo) => true;

// ignore: prefer_function_declarations_over_variables
void Function()? _onTapOption = () => {};

// ignore: prefer_function_declarations_over_variables
dynamic Function()? _onTapUserInfo = () => {};

Widget _createCustomListTile() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: CustomListTile(
        key: _key,
        index: _index,
        type: _tileType,
        option: _option,
        showIcon: _showIcon,
        onTapOrgInfo: _onTapOrgInfo,
        onTapOption: _onTapOption,
        userInfo: _userInfo,
        orgInfo: _orgInfo,
        onTapUserInfo: _onTapUserInfo,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  setUp(() async {
    _tileType = TileType.org;
    _orgInfo = OrgInfo();
    _index = 0;
    _option = Options(
      icon: const Icon(Icons.add),
      title: 'Test',
      subtitle: 'Just a test',
    );
    _showIcon = false;
    _onTapOrgInfo = (OrgInfo orgInfo) => true;

    _userInfo = User();
    _onTapOption = () => {};
    _onTapUserInfo = () => {};
    registerServices();
  });
  tearDown(() {
    unregisterServices();
  });
  group('Custom list tile test', () {
    testWidgets("Test type is org ", (WidgetTester tester) async {
      bool executed = false;
      _orgInfo = OrgInfo(
        name: 'Test Name',
        isPublic: true,
        creatorInfo: User(
          firstName: 'Test firstname',
          lastName: 'Test lastname',
        ),
      );
      _onTapOrgInfo = (OrgInfo orgInfo) {
        executed = true;
      };
      _tileType = TileType.org;
      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // test to see if custom list tile widget shows up
      expect(find.byKey(_key), findsOneWidget);

      // test to see if onTap of Inkwell works
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(executed, true);

      // test to check that there is a custom avatar
      expect(find.byType(CustomAvatar), findsOneWidget);

      // test to check that there is no icon
      expect(find.byIcon(Icons.add), findsNothing);

      // test the properties passed to CustomAvatar
      final customAvatarFinder = find.byType(CustomAvatar);
      final customAvatarWidget =
          tester.firstWidget(customAvatarFinder) as CustomAvatar;
      expect(customAvatarWidget.isImageNull, true);
      expect(customAvatarWidget.imageUrl, null);
      expect(customAvatarWidget.firstAlphabet, 'T');

      // Testing Text for that contains org's name
      final orgNameFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .first;

      final orgNameWidget = tester.firstWidget(orgNameFinder) as Text;

      expect(orgNameWidget.data, 'Test Name');
      expect(
        orgNameWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall,
      );

      // Testing Text for that contains org's creator name
      final orgCreatorFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .at(1);

      final orgCreatorWidget = tester.firstWidget(orgCreatorFinder) as Text;

      expect(
        orgCreatorWidget.data,
        '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.strictTranslate("Creator")}: Test firstname Test lastname',
      );
      expect(
        orgCreatorWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge,
      );

      // Test for is public display
      expect(
        find.text(
          AppLocalizations.of(navigationService.navigatorKey.currentContext!)!
              .strictTranslate('Public'),
        ),
        findsOneWidget,
      );

      // Test for icon when is public is true
      expect(find.byIcon(Icons.lock_open), findsOneWidget);

      final iconFinder = find.descendant(
        of: find.byType(Expanded).at(2),
        matching: find.byType(Icon),
      );
      final iconWidget = tester.firstWidget(iconFinder) as Icon;

      expect(iconWidget.color, const Color(0xFF34AD64));

      // Test for sized box when showIcon is false
      final sizedBoxFinder = find
          .descendant(
            of: find.byType(Expanded).at(2),
            matching: find.byType(SizedBox),
          )
          .at(1);
      expect(sizedBoxFinder, findsOneWidget);
    });
    testWidgets("Test for orgs when is Public is false ",
        (WidgetTester tester) async {
      _orgInfo = OrgInfo(
        name: 'Test Name',
        isPublic: false,
        creatorInfo: User(
          firstName: 'Test firstname',
          lastName: 'Test lastname',
        ),
      );
      _tileType = TileType.org;

      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // Test for is public display
      expect(
        find.text(
          AppLocalizations.of(navigationService.navigatorKey.currentContext!)!
              .strictTranslate('Private'),
        ),
        findsOneWidget,
      );

      // Test for icon when is public is false
      expect(find.byIcon(Icons.lock), findsOneWidget);

      final iconFinder = find.descendant(
        of: find.byType(Expanded).at(2),
        matching: find.byType(Icon),
      );
      final iconWidget = tester.firstWidget(iconFinder) as Icon;

      expect(iconWidget.color, const Color(0xffFABC57));
    });
    testWidgets("Test for orgs when show icon is true",
        (WidgetTester tester) async {
      _showIcon = true;
      _orgInfo = OrgInfo(
        name: 'Test Name',
        isPublic: true,
        creatorInfo: User(
          firstName: 'Test firstname',
          lastName: 'Test lastname',
        ),
      );
      _tileType = TileType.org;

      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // Test for icon when is public is false
      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });
    testWidgets("Test when type is user ", (WidgetTester tester) async {
      bool executed = false;
      _tileType = TileType.user;
      _userInfo = User(
        firstName: 'Test firstname',
        lastName: 'Test lastname',
      );
      _onTapUserInfo = () => {executed = true};
      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // test to see if custom list tile widget shows up
      expect(find.byKey(_key), findsOneWidget);

      // test to see if onTap of Inkwell works
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(executed, true);

      // test to check that there is a custom avatar
      expect(find.byType(CustomAvatar), findsOneWidget);

      // test to check that there is no icon
      expect(find.byIcon(Icons.add), findsNothing);

      // test the properties passed to CustomAvatar
      final customAvatarFinder = find.byType(CustomAvatar);
      final customAvatarWidget =
          tester.firstWidget(customAvatarFinder) as CustomAvatar;
      expect(customAvatarWidget.isImageNull, true);
      expect(customAvatarWidget.imageUrl, null);
      expect(customAvatarWidget.firstAlphabet, 'T');

      // Testing Text for that contains user's name
      final userNameFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .first;

      final userNameWidget = tester.firstWidget(userNameFinder) as Text;

      expect(userNameWidget.data, 'Test firstname Test lastname');
      expect(
        userNameWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge,
      );

      // Testing SizedBox for users fallback for creater info
      final userSizedBoxFallback = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(SizedBox),
          )
          .first;

      expect(userSizedBoxFallback, findsOneWidget);

      // Testing SizedBox for users fallback for isPublic info
      final userSizedBoxFallback1 = find
          .descendant(
            of: find.byType(Expanded).at(2),
            matching: find.byType(SizedBox),
          )
          .first;

      expect(userSizedBoxFallback1, findsOneWidget);
    });
    testWidgets("Test when type is option", (WidgetTester tester) async {
      bool executed = false;
      _tileType = TileType.option;
      _onTapOption = () => {executed = true};
      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // test to see if custom list tile widget shows up
      expect(find.byKey(_key), findsOneWidget);

      // test to see if onTap of Inkwell works
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(executed, true);

      // test to check that there is no custom avatar
      expect(find.byType(CustomAvatar), findsNothing);

      // test to check that there is an icon
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Testing Text that contains option's title
      final optionTitleFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .first;

      final optionTitleWidget = tester.firstWidget(optionTitleFinder) as Text;

      expect(optionTitleWidget.data, 'Test');
      expect(
        optionTitleWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .bodyMedium,
      );

      // Testing Text that contains option's subtitle
      final optionSubtitleFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .at(1);

      final optionSubtitleWidget =
          tester.firstWidget(optionSubtitleFinder) as Text;

      expect(optionSubtitleWidget.data, 'Just a test');
      expect(
        optionSubtitleWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .bodySmall,
      );

      // Testing SizedBox for option when trailing icon button is null (fallback for creater info)
      final optionSizedBoxFallback = find
          .descendant(
            of: find.byType(Expanded).at(2),
            matching: find.byType(SizedBox),
          )
          .first;

      expect(optionSizedBoxFallback, findsOneWidget);
    });
    testWidgets("Test when option trailing icon button is not null",
        (WidgetTester tester) async {
      _tileType = TileType.option;
      _option = Options(
        icon: const Icon(Icons.add),
        title: 'Test',
        subtitle: 'Just a test',
        trailingIconButton: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
      );
      await tester.pumpWidget(_createCustomListTile());
      await tester.pumpAndSettle();

      // Testing TextStyle that contains option's title
      final optionTitleFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .first;

      final optionTitleWidget = tester.firstWidget(optionTitleFinder) as Text;

      expect(
        optionTitleWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 18),
      );

      // Testing TextStyle that contains option's subtitle
      final optionSubtitleFinder = find
          .descendant(
            of: find.byType(Expanded).at(1),
            matching: find.byType(Text),
          )
          .at(1);

      final optionSubtitleWidget =
          tester.firstWidget(optionSubtitleFinder) as Text;

      expect(
        optionSubtitleWidget.style,
        Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge,
      );

      // Test for checking if trailing icon button is shown
      expect(find.byIcon(Icons.send), findsOneWidget);
    });
  });
}
