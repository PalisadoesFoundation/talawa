import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

const backgroundColor = Colors.black;
const foregroundColor = Colors.white;
const key = Key('ravidi');
const buttonLabel = 'm_button';

int count = 0;

void onTap() {
  count++;
}

Widget createRaisedRoundButton(
    {double? width, double? height, bool showArrow = false}) {
  return MaterialApp(
      home: Scaffold(
    body: RaisedRoundedButton(
      key: key,
      backgroundColor: backgroundColor,
      textColor: foregroundColor,
      buttonLabel: buttonLabel,
      onTap: onTap,
      width: width,
      height: height,
      showArrow: showArrow,
    ),
  ));
}

void main() {
  SizeConfig().test();
  group('Test for RaisedRoundButton widget', () {
    testWidgets('Check if the widget shows up', (tester) async {
      await tester.pumpWidget(createRaisedRoundButton());
      await tester.pump();

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Check if tapping works', (tester) async {
      await tester.pumpWidget(createRaisedRoundButton());
      await tester.pump();

      expect(count, 0);
      await tester.tap(find.byType(GestureDetector));
      expect(count, 1);
    });

    testWidgets('Check for size (without providing size)', (tester) async {
      await tester.pumpWidget(createRaisedRoundButton());
      await tester.pump();

      final containerFinder = find.byType(Container);
      final container = tester.firstWidget(containerFinder);

      expect(containerFinder, findsOneWidget);

      expect(
        (container as Container).constraints,
        BoxConstraints(
          minWidth: SizeConfig.screenWidth! * 0.94,
          maxWidth: SizeConfig.screenWidth! * 0.94,
          minHeight: SizeConfig.screenHeight! * 0.07,
          maxHeight: SizeConfig.screenHeight! * 0.07,
        ),
      );
    });

    testWidgets('Check for size (providing size)', (tester) async {
      await tester.pumpWidget(createRaisedRoundButton(width: 100, height: 100));
      await tester.pump();

      final containerFinder = find.byType(Container);
      final container = tester.firstWidget(containerFinder);

      expect(containerFinder, findsOneWidget);

      expect(
        (container as Container).constraints,
        const BoxConstraints(
          minWidth: 100,
          maxWidth: 100,
          minHeight: 100,
          maxHeight: 100,
        ),
      );
    });

    testWidgets('Check for inner widget (show arrow)', (tester) async {
      await tester.pumpWidget(createRaisedRoundButton(showArrow: true));
      await tester.pump();

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsNWidgets(3));

      final iconFinder = find.byType(Icon);
      expect(iconFinder, findsNWidgets(2));

      final iconOne = tester.widgetList(iconFinder).first;
      final iconTwo = tester.widgetList(iconFinder).last;

      expect(
        iconOne,
        isA<Icon>()
          ..having(
            (icon) => icon.icon,
            'icon',
            Icons.arrow_forward,
          )
          ..having(
            (icon) => icon.color,
            'color',
            Colors.transparent,
          ),
      );

      expect(
        iconTwo,
        isA<Icon>()
          ..having(
            (icon) => icon.icon,
            'icon',
            Icons.arrow_forward,
          )
          ..having(
            (icon) => icon.color,
            'color',
            foregroundColor,
          ),
      );

      expect(find.byType(Text), findsOneWidget);
      expect(find.textContaining(buttonLabel), findsOneWidget);
    });

    testWidgets("Check for inner widget (don't show arrow)", (tester) async {
      await tester.pumpWidget(createRaisedRoundButton());
      await tester.pump();

      expect(find.byType(Row), findsNothing);
      expect(find.textContaining(buttonLabel), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
