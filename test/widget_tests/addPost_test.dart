import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/views/pages/newsfeed/addPost.dart';

Widget createAddPostScreen() => MaterialApp(
      home: AddPost(),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  group('NewsFeed Page Widget Test', () {
    testWidgets("Testing if AddPost page shows up", (tester) async {
      await tester.pumpWidget(createAddPostScreen());

      // Verify if AddPost Page shows up by checking appbar.
      expect(find.byKey(Key('AddPostAppBar')), findsOneWidget);

      //Verify presence of 2 TextFormFields
      expect(find.byKey(Key('TITLE_FIELD')), findsOneWidget);

      expect(find.byKey(Key('POST_FIELD')), findsOneWidget);

      //verify presence of floatingActionButton

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createAddPostScreen());
      // Verify if AddPost Page shows up by checking appbar.
      expect(find.byKey(Key('AddPostAppBar')), findsOneWidget);
    });

    testWidgets("Testing overflow of New Article in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createAddPostScreen());

      // Verify if AddPost Page shows up by checking appbar.
      expect(find.byKey(Key('AddPostAppBar')), findsOneWidget);
    });

    testWidgets('Press FloatingActionButton when both textFormFields are empty',
        (tester) async {
      await tester.pumpWidget(createAddPostScreen());
      var floatingActionButton = find.byType(FloatingActionButton);
      //Does not show any warnings
      expect(find.text('This field is Required'), findsNothing);
      await tester.tap(floatingActionButton);

      await tester.pumpAndSettle();
      //Shows 2 warnings.
      expect(find.text('This field is Required'), findsNWidgets(2));
    });

    testWidgets('Press FloatingActionButton with valid input', (tester) async {
      await tester.pumpWidget(createAddPostScreen());
      var titleTextField = find.byKey(Key('TITLE_FIELD'));
      var postTextField = find.byKey(Key('POST_FIELD'));

      //Check if TextField is empty
      expect(find.text('TALAWA'), findsNothing);

      //Enter text in titleTextField
      await tester.enterText(titleTextField, 'TALAWA');
      expect(find.text('TALAWA'), findsOneWidget);

      //Enter text in postTextField
      await tester.enterText(postTextField, 'Thanks for contributing!');
      expect(find.text('Thanks for contributing!'), findsOneWidget);
      //press floatingActionButton
      var floatingActionButton = find.byType(FloatingActionButton);
      await tester.tap(floatingActionButton);

      await tester.pumpAndSettle();
      // verify if AddPost page is absent
      expect(find.byKey(Key('AddPostAppBar')), findsNothing);
    });

    testWidgets('Testing for invalid inputs', (tester) async {
      await tester.pumpWidget(createAddPostScreen());
      var titleTextField = find.byKey(Key('TITLE_FIELD'));

      //Verify if warning message is absent
      expect(find.text('Title cannot be longer than 20 letters'), findsNothing);

      // Enterinvalid input in titleTextField
      await tester.enterText(titleTextField, 'TALAWA' * 8);
      expect(find.text('TALAWA' * 8), findsOneWidget);
      await tester.pumpAndSettle();

      //verify if warning shows up
      expect(
          find.text('Title cannot be longer than 20 letters'), findsOneWidget);
    });
  });
}
