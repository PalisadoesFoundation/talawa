// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/member_name_tile.dart';

bool isDeleted = false;

void onDelete() {
  isDeleted = true;
}

Widget createMemberNameTile({String? userImage}) {
  return MaterialApp(
    theme: TalawaTheme.darkTheme,
    home: Material(
      child: MemberNameTile(
        userName: 'ravidev',
        userImage: userImage,
        onDelete: onDelete,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();

  group('Tests for MemberNameTile widget', () {
    testWidgets('Checking if the widget shows up', (tester) async {
      await tester.pumpWidget(createMemberNameTile());

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('Checking for the child Container', (tester) async {
      await tester.pumpWidget(createMemberNameTile());

      final containerFinder = find.byType(Container).first;
      final container = tester.firstWidget(find.byType(Container));

      expect(containerFinder, findsOneWidget);

      expect(
        (container as Container).decoration,
        BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.02),
          color: TalawaTheme.darkTheme.colorScheme.primaryContainer,
        ),
      );
    });

    testWidgets('Checking for the Row', (tester) async {
      await tester.pumpWidget(createMemberNameTile());

      final rowFinder = find.byType(Row);
      final row = tester.firstWidget(rowFinder);

      expect(rowFinder, findsOneWidget);

      expect((row as Row).mainAxisAlignment, MainAxisAlignment.spaceBetween);
      expect(row.crossAxisAlignment, CrossAxisAlignment.center);

      expect(row.children[0], isA<CircleAvatar>());
      expect(row.children[1], isA<Padding>());
      expect(row.children[2], isA<IconButton>());
    });

    testWidgets('Checking for CircleAvatar (without image)', (tester) async {
      await tester.pumpWidget(createMemberNameTile());

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.firstWidget(circleAvatarFinder);
      expect(circleAvatarFinder, findsOneWidget);

      expect(
        (circleAvatar as CircleAvatar).radius,
        SizeConfig.screenHeight! * 0.0201,
      );
      expect(
        circleAvatar.backgroundColor,
        TalawaTheme.darkTheme.colorScheme.secondary,
      );
      expect(
        circleAvatar.child,
        isA<Text>().having(
          (text) => text.style,
          'Checking text style',
          const TextStyle(color: Colors.white),
        ),
      );

      expect(find.textContaining('R'), findsOneWidget);
    });

    testWidgets('Checking for CircleAvatar (with image)', (tester) async {
      const String userImage = 'https://www.example.org/non-existent.png';

      // Mock NetworkImages for CircularAvatar
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          createMemberNameTile(userImage: userImage),
        ),
      );

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.firstWidget(circleAvatarFinder);

      expect(circleAvatarFinder, findsOneWidget);

      expect(
        (circleAvatar as CircleAvatar).radius,
        SizeConfig.screenHeight! * 0.0201,
      );
      expect(
        circleAvatar.backgroundImage,
        const NetworkImage(userImage),
      );
      expect(
        circleAvatar.backgroundColor,
        null,
      );
      expect(
        circleAvatar.child,
        null,
      );

      expect(find.textContaining('R'), findsNWidgets(0));
    });

    testWidgets('Checking for the cancel button', (tester) async {
      await tester.pumpWidget(createMemberNameTile());

      final iconButtonFinder = find.byType(IconButton);
      final iconButton = tester.firstWidget(iconButtonFinder);

      expect(iconButtonFinder, findsOneWidget);

      expect((iconButton as IconButton).padding, EdgeInsets.zero);
      expect(
        iconButton.icon,
        isA<Icon>()
            .having((icon) => icon.color, 'color', const Color(0xff524F4F))
            .having((icon) => icon.size, 'size', 19),
      );

      expect(isDeleted, false);
      await tester.tap(iconButtonFinder);
      await tester.pump();
      expect(isDeleted, true);
    });
  });
}
