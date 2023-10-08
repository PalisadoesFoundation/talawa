// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';

import '../../../helpers/test_locator.dart';

Widget createApp() {
  final Map<String, String> postDetails = {
    'title': 'Debate over stocks bybacks.',
    'postId': 'agdjvfhsjaf',
    'imageUrl':
        'https://m.wsj.net/video/20200105/wsjglossarystockbuybackssplash/wsjglossarystockbuybackssplash_640x360.jpg',
    'time': '9',
  };
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: TextButton(
      onPressed: () async {
        final OrgInfo org = OrgInfo(
          id: '2',
          name: 'test org',
          isPublic: true,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        );
        print(org);
        await navigationService.pushScreen(
          '/pinnedpostscreen',
          arguments: postDetails,
        );
      },
      child: const Text('Ayush'),
    ),
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

void main() {
  SizeConfig().test();

  testSetupLocator();

  group('description', () {
    testWidgets('Check if SignUp screen shows up', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(SignUpDetails), findsNothing);

      await tester.tap(find.textContaining('Ayush'));
      await tester.pumpAndSettle();

      // expect(find.byType(SignUpDetails), findsOneWidget);
    });
  });
}
