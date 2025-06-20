import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUp(() {
    registerServices();
  });
  test('Testing model initialization and get functions after initialization',
      () async {
    final CommentService commentService = locator<CommentService>();
    when(commentService.getCommentsForPost(
      postId: 'testPostID',
    )).thenAnswer((_) async => {
          'comments': [
            {
              'node': {
                'id': 'comment1',
                'body': 'This is a test comment',
                'createdAt': '2023-10-01T12:00:00Z',
                'creator': null,
              }
            },
            {
              'node': {
                'id': 'comment2',
                'body': 'This is another test comment',
                'createdAt': '2023-10-02T12:00:00Z',
                'creator': null,
              }
            }
          ],
          'pageInfo': {
            'hasNextPage': false,
            'hasPreviousPage': false,
            'startCursor': null,
            'endCursor': null,
          }
        });

    final commentsViewModel = CommentsViewModel();

    await commentsViewModel.initialise('testPostID');

    expect(commentsViewModel, isNotNull);
    expect(commentsViewModel.postId, 'testPostID');
    expect(commentsViewModel.commentList.length, 2);
    expect(commentsViewModel.commentList[0].body, 'This is a test comment');
    expect(
        commentsViewModel.commentList[1].body, 'This is another test comment');
    expect(commentsViewModel.pageInfo.hasNextPage, false);
  });

  test('getComments parses and adds comments', () async {
    final CommentService commentService = locator<CommentService>();
    final viewModel = CommentsViewModel();

    /// we don't want to test initialization but initialization is necessary to work with view model.
    /// This mock will help to initalize viewmodel and will not affect our result.
    when(commentService.getCommentsForPost(
      postId: 'testPostID',
    )).thenAnswer((_) async => {
          'comments': <Map<String, dynamic>>[],
          'pageInfo': {
            'hasNextPage': false,
            'hasPreviousPage': false,
            'startCursor': null,
            'endCursor': null,
          }
        });
    await viewModel.initialise('testPostID');

    /// this is when we are testing.
    when(commentService.getCommentsForPost(
      postId: 'testPostID',
    )).thenAnswer((_) async => {
          'comments': [
            {
              'node': {
                'id': 'comment1',
                'body': 'This is a test comment',
                'createdAt': '2023-10-01T12:00:00Z',
                'creator': null,
              }
            },
            {
              'node': {
                'id': 'comment2',
                'body': 'This is another test comment',
                'createdAt': '2023-10-02T12:00:00Z',
                'creator': null,
              }
            }
          ],
          'pageInfo': {
            'hasNextPage': false,
            'hasPreviousPage': false,
            'startCursor': null,
            'endCursor': null,
          }
        });
    await viewModel.getComments();

    expect(viewModel.commentList.length, 2);
    expect(viewModel.commentList[0].body, 'This is a test comment');
    expect(viewModel.commentList[1].body, 'This is another test comment');
    expect(viewModel.pageInfo.hasNextPage, false);
  });
  test('getComments calls setState with busy and idle', () async {
    final states = <ViewState>[];
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();

    when(commentService.getCommentsForPost(
      postId: 'testPostID',
    )).thenAnswer((_) async => {
          'comments': [
            {
              'node': {
                'id': 'comment1',
                'body': 'This is a test comment',
                'createdAt': '2023-10-01T12:00:00Z',
                'creator': null,
              }
            },
            {
              'node': {
                'id': 'comment2',
                'body': 'This is another test comment',
                'createdAt': '2023-10-02T12:00:00Z',
                'creator': null,
              }
            }
          ],
          'pageInfo': {
            'hasNextPage': false,
            'hasPreviousPage': false,
            'startCursor': null,
            'endCursor': null,
          }
        });
    viewModel.initialise('testPostID');

    // Listen for state changes
    viewModel.addListener(() {
      states.add(viewModel.state);
    });
    await viewModel.getComments();
    expect(states, containsAll([ViewState.busy, ViewState.idle]));
  });

  test('fetchNextPage calls getComments if hasNextPage is true', () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();
    when(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .thenAnswer((_) async => {
              'comments': [
                {
                  'node': {
                    'id': 'comment1',
                    'body': 'This is a test comment',
                    'createdAt': '2023-10-01T12:00:00Z',
                    'creator': null,
                  }
                }
              ],
              'pageInfo': {
                'hasNextPage': true,
                'hasPreviousPage': false,
                'startCursor': null,
                'endCursor': null,
              }
            });

    viewModel.initialise('testPostID');

    viewModel.pageInfo.hasNextPage = true;
    viewModel.pageInfo.endCursor = 'random cursor';

    await viewModel.fetchNextPage();

    /// One time for initialization and second tume for refetching
    expect(viewModel.commentList.length, 2);
    expect(viewModel.commentList[0].body, 'This is a test comment');
    expect(viewModel.commentList[1].body, 'This is a test comment');

    /// One time for initialization and second tume for refetching
    verify(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .called(2);
  });

  test('fetchNextPage calls getComments if hasNextPage is false', () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();

    // Mock the service to return comments
    when(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .thenAnswer((_) async => {
              'comments': [
                {
                  'node': {
                    'id': 'comment1',
                    'body': 'This is a test comment',
                    'createdAt': '2023-10-01T12:00:00Z',
                    'creator': null,
                  }
                }
              ],
              'pageInfo': {
                'hasNextPage': true,
                'hasPreviousPage': false,
                'startCursor': null,
                'endCursor': null,
              }
            });

    viewModel.initialise('testPostID');

    viewModel.pageInfo.hasNextPage = false;
    viewModel.pageInfo.endCursor = 'random cursor';

    await viewModel.fetchNextPage();

    /// One time for initialization only
    expect(viewModel.commentList.length, 1);

    /// One time for initialization and second tume for refetching
    verify(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .called(1);
  });

  test('createComment calls CommentService and adds locally', () async {
    final viewModel = CommentsViewModel();
    locator.registerSingleton<ActionHandlerService>(ActionHandlerService());
    final CommentService commentService = locator<CommentService>();

    /// this if just for initialization
    when(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .thenAnswer((_) async => {
              'comments': <Map<String, dynamic>>[],
              'pageInfo': {
                'hasNextPage': true,
                'hasPreviousPage': false,
                'startCursor': null,
                'endCursor': null,
              }
            });

    viewModel.initialise('testPostID');

    when(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .thenAnswer((_) async => {
              'comments': [
                {
                  'node': {
                    'id': 'comment1',
                    'body': 'This is a test comment',
                    'createdAt': '2023-10-01T12:00:00Z',
                    'creator': null,
                  }
                }
              ],
              'pageInfo': {
                'hasNextPage': true,
                'hasPreviousPage': false,
                'startCursor': null,
                'endCursor': null,
              }
            });
    when(commentService.createComments('testPostID', 'Hello!'))
        .thenAnswer((_) async {});

    final initialCount = viewModel.commentList.length;
    await viewModel.createComment('Hello!');
    expect(viewModel.commentList.length, initialCount + 1);
    expect(viewModel.commentList.last.body, 'Hello!');
    verify(commentService.createComments('testPostID', 'Hello!')).called(1);
    verify(postService.addCommentLocally('testPostID')).called(1);
  });

  test('addCommentLocally adds a comment and notifies listeners', () {
    final viewModel = CommentsViewModel();
    final postService = locator<PostService>();
    final CommentService commentService = locator<CommentService>();

    /// this if just for initialization
    when(commentService.getCommentsForPost(
            postId: 'testPostID', after: anyNamed('after')))
        .thenAnswer((_) async => {
              'comments': <Map<String, dynamic>>[],
              'pageInfo': {
                'hasNextPage': true,
                'hasPreviousPage': false,
                'startCursor': null,
                'endCursor': null,
              }
            });

    viewModel.initialise('testPostID');
    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });

    viewModel.addCommentLocally('Local comment');

    expect(viewModel.commentList.length, 1);
    expect(viewModel.commentList.first.body, 'Local comment');
    expect(notified, isTrue);
    verify(postService.addCommentLocally('testPostID')).called(1);
  });
}
