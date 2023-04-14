// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  late OrganizationFeedViewModel model;
  final notifyListenerCallback = MockCallbackFunction();

  setUp(() {
    registerServices();
    model = OrganizationFeedViewModel()..addListener(notifyListenerCallback);
  });

  group('OrganizationFeedViewModel Tests:', () {
    test('Test initialise function', () {
      expect(model.currentOrgName, '');
      model.initialise();
      expect(model.currentOrgName, 'Organization Name');

      locator<UserConfig>()
          .currentOrgInfoController
          .add(OrgInfo(name: 'Updated Organization Name'));

      expect(model.posts.length, 0);

      model.initializeWithDemoData();
    });

    test('Test setCurrentOrganizationName function', () {
      model.setCurrentOrganizationName('Updated Organization Name');
      expect(model.posts.length, 0);
      expect(model.currentOrgName, 'Updated Organization Name');
    });

    test('Test fetchNewPosts function', () {
      model.fetchNewPosts();
      verify(locator<PostService>().getPosts());
    });

    test('Test buildNewPosts function', () {
      model.buildNewPosts([
        Post(sId: '1', creator: User()),
        Post(sId: '2', creator: User()),
      ]);

      expect(model.posts.length, 2);
      verify(notifyListenerCallback());
    });

    test('Test navigateToIndividualPage function', () {
      final post = Post(sId: '1', creator: User());

      model.navigateToIndividualPage(post);

      verify(
        locator<NavigationService>().pushScreen(
          Routes.individualPost,
          arguments: post,
        ),
      );
    });

    test('Test navigateToPinnedPostPage function', () {
      model.navigateToPinnedPostPage();

      final captured = verify(
        (locator<NavigationService>() as MockNavigationService).pushScreen(
          Routes.pinnedPostPage,
          arguments: captureAnyNamed('arguments'),
        ),
      ).captured;

      expect(captured[0].length, 4);
    });

    test('Test addNewPost function', () {
      final post = Post(sId: '1', creator: User());

      model.addNewPost(post);

      expect(model.posts[0], post);
      verify(notifyListenerCallback());
    });

    test('Test updatedPost function', () {
      final post = Post(sId: '1', creator: User());
      model.addNewPost(post);

      final updatedPost = Post(
        sId: '1',
        description: 'updated',
        creator: User(),
      );
      model.updatedPost(updatedPost);

      expect(model.posts[0], updatedPost);
      verify(notifyListenerCallback()).called(2);
    });
  });
}
