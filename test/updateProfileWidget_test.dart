import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/pages/organization/update_profile_page.dart';

void main() {
  testWidgets("3 TestFormField Exist in Profile Page Update",
      (WidgetTester tester) async {
    await tester.pumpWidget(new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: UpdateProfilePage(
        userDetails: [
          {
            "firstName": "Test",
            "lastName": "User",
            "email": "test@test.com",
          }
        ],
      )),
    ));

    var textField = find.byType(TextFormField);
    expect(textField, findsNWidgets(3));
  });

  testWidgets("Flexible Space Bar in Profile Widget",
      (WidgetTester tester) async {
    await tester.pumpWidget(new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: UpdateProfilePage(
        userDetails: [
          {
            "firstName": "Test",
            "lastName": "User",
            "email": "test@test.com",
          }
        ],
      )),
    ));

    var textField = find.byType(FlexibleSpaceBar);
    expect(textField, findsOneWidget);
  });

  testWidgets("Floating Action Button Profile Update",
      (WidgetTester tester) async {
    await tester.pumpWidget(new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: UpdateProfilePage(
        userDetails: [
          {
            "firstName": "Test",
            "lastName": "User",
            "email": "test@test.com",
          }
        ],
      )),
    ));

    var textField = find.byType(FloatingActionButton);
    expect(textField, findsOneWidget);
  });
}
