import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
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
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: null,
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'id': 'comment1',
              'body': 'This is a test comment',
              'createdAt': '2023-10-01T12:00:00Z',
              'creator': null,
            },
          },
          {
            'node': {
              'id': 'comment2',
              'body': 'This is another test comment',
              'createdAt': '2023-10-02T12:00:00Z',
              'creator': null,
            },
          }
        ],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );
    final post = Post(id: 'testPostID', caption: 'Test Post');
    final commentsViewModel = CommentsViewModel();

    await commentsViewModel.initialise(post);

    expect(commentsViewModel, isNotNull);
    expect(commentsViewModel.post.id, 'testPostID');
    expect(commentsViewModel.commentList.length, 2);
    expect(commentsViewModel.commentList[0].body, 'This is a test comment');
    expect(
      commentsViewModel.commentList[1].body,
      'This is another test comment',
    );
    expect(commentsViewModel.pageInfo.hasNextPage, false);
  });

  test('getComments parses and adds comments', () async {
    final CommentService commentService = locator<CommentService>();
    final viewModel = CommentsViewModel();

    /// we don't want to test initialization but initialization is necessary to work with view model.
    /// This mock will help to initalize viewmodel and will not affect our result.
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: null,
      ),
    ).thenAnswer(
      (_) async => {
        'comments': <Map<String, dynamic>>[],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );
    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    /// this is when we are testing.
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: null,
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'id': 'comment1',
              'body': 'This is a test comment',
              'createdAt': '2023-10-01T12:00:00Z',
              'creator': null,
            },
          },
          {
            'node': {
              'id': 'comment2',
              'body': 'This is another test comment',
              'createdAt': '2023-10-02T12:00:00Z',
              'creator': null,
            },
          }
        ],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );
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

    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: null,
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'id': 'comment1',
              'body': 'This is a test comment',
              'createdAt': '2023-10-01T12:00:00Z',
              'creator': null,
            },
          },
          {
            'node': {
              'id': 'comment2',
              'body': 'This is another test comment',
              'createdAt': '2023-10-02T12:00:00Z',
              'creator': null,
            },
          }
        ],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );
    final post = Post(id: 'testPostID', caption: 'Test Post');
    viewModel.initialise(post);

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
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'id': 'comment1',
              'body': 'This is a test comment',
              'createdAt': '2023-10-01T12:00:00Z',
              'creator': null,
            },
          }
        ],
        'pageInfo': {
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    viewModel.pageInfo.hasNextPage = true;
    viewModel.pageInfo.endCursor = 'random cursor';

    await viewModel.fetchNextPage();

    /// One time for initialization and second time for refetching
    expect(viewModel.commentList.length, 2);
    expect(viewModel.commentList[0].body, 'This is a test comment');
    expect(viewModel.commentList[1].body, 'This is a test comment');

    /// One time for initialization and second time for refetching
    verify(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).called(2);
  });

  test('fetchNextPage does not call getComments if hasNextPage is false',
      () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();

    // Mock the service to return comments
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': [
          {
            'node': {
              'id': 'comment1',
              'body': 'This is a test comment',
              'createdAt': '2023-10-01T12:00:00Z',
              'creator': null,
            },
          }
        ],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    viewModel.pageInfo.hasNextPage = false;
    viewModel.pageInfo.endCursor = 'random cursor';

    await viewModel.fetchNextPage();

    /// One time for initialization only
    expect(viewModel.commentList.length, 1);

    /// One time for initialization only
    verify(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).called(1);
  });

  test('createComment calls CommentService and adds locally', () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();
    final PostService postService = locator<PostService>();

    /// this is just for initialization
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': <Map<String, dynamic>>[],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    // Create a mock Comment object
    final mockComment = Comment(
      id: 'comment1',
      body: 'Hello!',
      createdAt: DateTime.now().toIso8601String(),
    );

    when(commentService.createComments('testPostID', 'Hello!'))
        .thenAnswer((_) async => mockComment);

    final initialCount = viewModel.commentList.length;
    await viewModel.createComment('Hello!');

    expect(viewModel.commentList.length, initialCount + 1);
    expect(
      viewModel.commentList.first.body,
      'Hello!',
    );
    verify(commentService.createComments('testPostID', 'Hello!')).called(1);
    verify(postService.addCommentLocally(post)).called(1);
  });

  test('addCommentLocally adds a comment and notifies listeners', () async {
    final viewModel = CommentsViewModel();
    final postService = locator<PostService>();
    final CommentService commentService = locator<CommentService>();

    /// this is just for initialization
    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': <Map<String, dynamic>>[],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);
    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });

    // Create a mock Comment object
    final mockComment = Comment(
      id: 'comment1',
      body: 'Local comment',
      createdAt: DateTime.now().toIso8601String(),
    );

    viewModel.addCommentLocally(mockComment);

    expect(viewModel.commentList.length, 1);
    expect(viewModel.commentList.first.body, 'Local comment');
    expect(notified, isTrue);
    verify(postService.addCommentLocally(post)).called(1);
  });

  test('addCommentLocally handles null comment gracefully', () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();

    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': <Map<String, dynamic>>[],
        'pageInfo': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    final initialCount = viewModel.commentList.length;
    viewModel.addCommentLocally(null);

    expect(viewModel.commentList.length, initialCount);
  });

  test('hasNextPage getter returns correct value', () async {
    final viewModel = CommentsViewModel();
    final CommentService commentService = locator<CommentService>();

    when(
      commentService.getCommentsForPost(
        postId: 'testPostID',
        first: 10,
        after: anyNamed('after'),
      ),
    ).thenAnswer(
      (_) async => {
        'comments': <Map<String, dynamic>>[],
        'pageInfo': {
          'hasNextPage': true,
          'hasPreviousPage': false,
          'startCursor': null,
          'endCursor': null,
        },
      },
    );

    final post = Post(id: 'testPostID', caption: 'Test Post');
    await viewModel.initialise(post);

    expect(viewModel.hasNextPage, true);

    viewModel.pageInfo.hasNextPage = false;
    expect(viewModel.hasNextPage, false);
  });
}
