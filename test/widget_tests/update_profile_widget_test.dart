import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/post_provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/organization/update_profile_page.dart';

Widget createProfileUpdateScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        home: Builder(builder: (BuildContext context) {
          SizeConfig().init(context);
          return const UpdateProfilePage(
            userDetails: [
              {
                "firstName": "Test",
                "lastName": "User",
                "email": "test@test.com",
              }
            ],
          );
        }),
      ),
    );

void main() {
  group('Member Info Page Widget Tests', () {
    testWidgets("3 TestFormField Exist in Profile Page Update",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          createProfileUpdateScreen(), const Duration(microseconds: 100));

      final textField = find.byType(TextFormField);
      expect(textField, findsNWidgets(3));
    });

    testWidgets("Flexible Space Bar in Profile Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          createProfileUpdateScreen(), const Duration(microseconds: 100));

      final tile = find.byType(ListTile);
      expect(tile, findsOneWidget);
    });
  });
}
