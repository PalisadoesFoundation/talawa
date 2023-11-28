import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/demo_server_data/pinned_post_demo_data.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/pinned_post.dart';

import '../../helpers/test_helpers.dart';

/// List of pinned posts.
List<Post> _pinnedPosts =
    pinnedPostsDemoData.map((e) => Post.fromJson(e)).toList();

/// getter for pinned post.
///
/// **params**:

List<Post> get pinnedPosts {
  return _pinnedPosts;
}

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  setupLocator();
  locator<SizeConfig>().test();
  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });
  tearDown(() {
    unregisterServices();
  });

  testWidgets('If conatiner is coming on calling pinnedwidget',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byKey(const Key('hello')), findsOneWidget);
  });

  testWidgets('Text widget is present when there are pinned posts',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.byType(Text), findsWidgets);
  });

  testWidgets('Text widget displays the correct text', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PinnedPost(pinnedPost: pinnedPosts),
      ),
    );
    await widgetTester.pumpAndSettle();
    expect(find.text('Church Meeting'), findsOneWidget);
  });
}
