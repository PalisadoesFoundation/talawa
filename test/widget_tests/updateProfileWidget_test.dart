import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/organization/update_profile_page.dart';

Widget createProfileUpdateScreen() => MultiProvider(
        providers: [
          ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration(),
          ),
          ChangeNotifierProvider<OrgController>(
            create: (_) => OrgController(),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController(),
          ),
          ChangeNotifierProvider<Preferences>(
            create: (_) => Preferences(),
          ),
        ],
        child: MaterialApp(
            home: UpdateProfilePage(
          userDetails: [
            {
              "firstName": "Test",
              "lastName": "User",
              "email": "test@test.com",
            }
          ],
        )));

void main() {
  group('Member Info Page Widget Tests', () {
    testWidgets("3 TestFormField Exist in Profile Page Update",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          createProfileUpdateScreen(), Duration(microseconds: 100));

      var textField = find.byType(TextFormField);
      expect(textField, findsNWidgets(3));
    });

    testWidgets("Flexible Space Bar in Profile Widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          createProfileUpdateScreen(), Duration(microseconds: 100));

      var tile = find.byType(ListTile);
      expect(tile, findsOneWidget);
    });
  });
}
