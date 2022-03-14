import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talawa/widgets/custom_avatar.dart';

Widget createCustomAvatar({required bool isImageNull}) {
  return MaterialApp(
    home: Scaffold(
      body: CustomAvatar(
        isImageNull: isImageNull,
        imageUrl: 'fakeUrl',
        firstAlphabet: 'A',
      ),
    ),
  );
}

void main() {
  group('Test for CustomAvatar', () {
    testWidgets('Check if CustomAvatar widget shows up if image is null',
        (tester) async {
      await tester.pumpWidget(createCustomAvatar(isImageNull: true));
      await tester.pump();

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
      expect(find.byType(Center), findsNWidgets(2));
    });

    testWidgets('Check if CustomAvatar widget shows up if image is not null',
        (tester) async {
      await tester.pumpWidget(createCustomAvatar(isImageNull: false));
      await tester.pump();

      // Test numbers of generic widgets created
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(CircleAvatar), findsNWidgets(2));

      // Test CircleAvatar theme
      const CircleAvatar themeCircleAvatar =
          CircleAvatar(backgroundColor: Colors.lightBlueAccent);
      expect(find.byWidget(themeCircleAvatar), findsOneWidget);

      // Test placeholder attribute
      expect(find.byType(Shimmer), findsOneWidget);
    });
  });
}
