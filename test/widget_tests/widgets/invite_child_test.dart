// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/invite_child.dart';

import '../../helpers/test_locator.dart';

class CreateInviteChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    sizeConfig.test(); //init(context);
    return MaterialApp(home: Scaffold(body: invite(context)));
  }
}

void main() {
  testSetupLocator();

  testWidgets("QR Code Checking", (WidgetTester tester) async {
    // finding the widgets

    // QR code can be tested only using links
    final qr = find.byKey(const ValueKey("QRcode"));

    // execute the test
    await tester.pumpWidget(CreateInviteChild());
    await tester.tap(qr);
    await tester.pump();

    // checking the output
    expect(qr, findsOneWidget);
  });

  testWidgets("Tapping On Twitter Button", (WidgetTester tester) async {
    // finding the widgets
    final twitter = find.byKey(const ValueKey("Twitter"));

    // execute the test
    await tester.pumpWidget(CreateInviteChild());
    await tester.tap(twitter);
    await tester.pump();

    // checking the output
    expect(twitter, findsOneWidget);
  });

  testWidgets("Tapping On WhatsApp Button", (WidgetTester tester) async {
    // finding the widgets
    final whatsapp = find.byKey(const ValueKey("WhatsApp"));

    // execute the test
    await tester.pumpWidget(CreateInviteChild());
    await tester.tap(whatsapp);
    await tester.pump();

    // checking the output
    expect(whatsapp, findsOneWidget);
  });

  testWidgets("Tapping On Telegram Button", (WidgetTester tester) async {
    // finding the widgets
    final telegram = find.byKey(const ValueKey("Telegram"));

    // execute the test
    await tester.pumpWidget(CreateInviteChild());
    await tester.tap(telegram);
    await tester.pump();

    // checking the output
    expect(telegram, findsOneWidget);
  });

  testWidgets("Tapping On Alt Button", (WidgetTester tester) async {
    // finding the widgets
    final alt = find.byKey(const ValueKey("Alt"));

    // execute the test
    await tester.pumpWidget(CreateInviteChild());
    await tester.tap(alt);
    await tester.pump();

    // checking the output
    expect(alt, findsOneWidget);
  });
}
