import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/services/app_localization.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/model/orgmemeber.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/members/user_taskstab.dart';

Widget userTasksPage() => MultiProvider(
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
        home: Builder(builder: (context) {
          SizeConfig().init(context);
          return UserTasks(
            member: Member(
              id: '5f566b32dc1b6076634d30a0',
            ),
          );
        }),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("users task tab page tests", () {
    testWidgets("Testing if users task tab shows up", (tester) async {
      await tester.pumpWidget(userTasksPage());
      await tester.pumpAndSettle();

      //verify if [users task tab ] page appears
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets("Testing overflow of users task tab  page in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(
          SizeConfig.safeBlockHorizontal * 110,
          SizeConfig.safeBlockVertical * 100);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(userTasksPage());
      await tester.pumpAndSettle();

      //verify if [users task tab] page appears
      expect(find.byType(Container), findsWidgets);
    });
    testWidgets("Testing overflow of users task tab in a tablet screen",
        (tester) async {
      await tester.pumpWidget(userTasksPage());
      await tester.pumpAndSettle();

      binding.window.physicalSizeTestValue = Size(
          SizeConfig.safeBlockHorizontal * 256,
          SizeConfig.safeBlockVertical * 96);
      binding.window.devicePixelRatioTestValue = 1.0;

      //verify if [ users task tab ] page appears

      expect(find.byType(Container), findsWidgets);
    });
  });
}
