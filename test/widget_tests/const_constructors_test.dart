import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/widgets/about_tile.dart';

void main() {
  testWidgets("check const constructor", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyAboutTile(),
      ),
    ));
    expect(find.byType(FlutterLogo), findsNothing);
    expect(find.byType(SizedBox), findsNothing);
    expect(find.byType(Text), findsOneWidget);
  });
}
