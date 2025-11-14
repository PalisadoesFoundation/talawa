// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    AppConnectivity.isOnline = true;
  });
  late OrganizationFeedViewModel model;
  final notifyListenerCallback = MockCallbackFunction();

  setUp(() {
    registerServices();
    model = OrganizationFeedViewModel()..addListener(notifyListenerCallback);
  });
  tearDown(() {
    unregisterServices();
  });
  test('setPosts sets posts, userPosts, and notifies listeners', () {
    // Arrange

    final viewModel = OrganizationFeedViewModel();
    when(userConfig.currentUser).thenReturn(User(id: 'user1'));

    final posts = [
      Post(id: '1', caption: 'A', creator: User(id: 'user1')),
      Post(id: '2', caption: 'B', creator: User(id: 'user2')),
      Post(id: '3', caption: 'C', creator: User(id: 'user1')),
      Post(id: '1', caption: 'A', creator: User(id: 'user1')), // duplicate
    ];

    // Act
    viewModel.setPosts(posts);

    // Assert
    expect(viewModel.posts, posts);
    // Only posts by user1, no duplicates
    expect(viewModel.userPosts.length, 2);
    expect(viewModel.userPosts[0].id, '3');
    expect(viewModel.userPosts[1].id, '1');
    expect(viewModel.isFetchingPosts, true);
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
    });

    test('Test pinnedPosts getter when  is true', () {
      final pinnedPosts = model.pinnedPosts;

      expect(pinnedPosts, isEmpty);
    });

    test('Test setCurrentOrganizationName function', () {
      model.setCurrentOrganizationName('Updated Organization Name');
      expect(model.posts.length, 0);
      expect(model.userPosts.length, 0);
      expect(model.currentOrgName, 'Updated Organization Name');
    });

    test('Test refreshPosts function', () {
      model.refreshPosts();
      verify(locator<PostService>().refreshFeed());
    });

    test('Test navigateToIndividualPage function', () {
      final post = Post(id: '1', creator: User());

      model.navigateToIndividualPage(post);

      verify(
        locator<NavigationService>().pushScreen(
          Routes.individualPost,
          arguments: post,
        ),
      );
    });

    test('Test addNewPost function', () {
      final post = Post(id: '1', creator: User());

      model.addNewPost(post);

      expect(model.posts[0], post);
      verify(notifyListenerCallback());
    });

    test('Test updatedPost function', () {
      final post = Post(id: '1', creator: User());
      model.addNewPost(post);

      final updatedPost = Post(
        id: '1',
        caption: 'updated',
        creator: User(),
      );
      model.updatedPost(updatedPost);

      expect(model.posts[0], updatedPost);
      verify(notifyListenerCallback()).called(2);
    });
  });

  test('Test removePost function', () async {
    final post = Post(id: '1', creator: User());
    model.addNewPost(post);
    model.initialise();

    when(locator<PostService>().deletePost(post)).thenAnswer(
      (realInvocation) async => QueryResult(
        options: QueryOptions(document: gql(PostQueries().deletePost())),
        data: {
          'test': 'data',
        },
        source: QueryResultSource.network,
      ),
    );

    await model.deletePost(post);

    expect(model.posts.isEmpty, true);
  });
  test("test nextpage", () {
    model.nextPage();
    expect(model.posts.isEmpty, true);
  });
  test('navigateToPinnedPostPage calls pushScreen with pinned posts', () {
    final navigationService = locator<NavigationService>();
    final viewModel = OrganizationFeedViewModel();

    // Set up pinned posts
    final pinnedPosts = [
      Post(id: '1', caption: 'Pinned 1'),
      Post(id: '2', caption: 'Pinned 2'),
    ];
    viewModel.setPinnedPosts(pinnedPosts);

    // Act
    viewModel.navigateToPinnedPostPage();

    // Assert
    verify(
      navigationService.pushScreen(
        Routes.pinnedPostPage,
        arguments: pinnedPosts,
      ),
    ).called(1);
  });
}
