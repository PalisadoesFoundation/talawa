import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/views/pages/organization/update_profile_page_view.dart';

Widget createProfileUpdateScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<NewsFeedProvider>(
            create: (_) => NewsFeedProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Builder(builder: (BuildContext context) {
          SizeConfig().init(context);
          const user = User(
            firstName: "Test",
            lastName: "User",
            email: "test@test.com",
          );
          return const UpdateProfileView(
            userDetails: [user],
          );
        }),
      ),
    );

void main() {
  setupLocator();
  group('Member Info Page Widget Tests', () {
    testWidgets("3 TestFormField Exist in Profile Page Update",
        (WidgetTester tester) async {
      await tester.pumpWidget(createProfileUpdateScreen());
      await tester.pumpAndSettle();

      final textField = find.byType(TextFormField);
      expect(textField, findsNWidgets(3));
    });

    testWidgets("Flexible Space Bar in Profile Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(createProfileUpdateScreen());
      await tester.pumpAndSettle();

      final tile = find.byType(ListTile);
      expect(tile, findsOneWidget);
    });
  });
}
