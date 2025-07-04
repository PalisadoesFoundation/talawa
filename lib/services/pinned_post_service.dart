import 'dart:async';

import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/caching/base_feed_manager.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/pinned_post_queries.dart';

/// Service to manage pinned posts in the application.
class PinnedPostService extends BaseFeedManager<Post> {
  PinnedPostService() : super(HiveKeys.pinnedPostKey) {
    _pinnedPostStream = _pinnedPostStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
  }
  static const int _defaultPageSize = 10;
  final _pinnedPostStreamController = StreamController<List<Post>>();
  late final Stream<List<Post>> _pinnedPostStream;

  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late OrgInfo _currentOrg;
  List<Post> _pinnedPosts = [];

  /// Object to hold pagination information for posts. It contains information like `after`, `before`, `first`, and `last`.
  PageInfo pinnedPostInfo = PageInfo(
    hasNextPage: false,
    hasPreviousPage: false,
    startCursor: null,
    endCursor: null,
  );

  /// `after` is used to fetch posts after a certain cursor.
  String? after;

  /// `before` is used to fetch posts before a certain cursor.
  String? before;

  /// `first` is used to limit the number of posts fetched in a single request.
  int? first = 10;

  /// `last` is used to limit the number of posts fetched so i dont thinkin a single request from the end.
  int? last;

  /// Returns a stream of pinned posts.
  Stream<List<Post>> get pinnedPostStream => _pinnedPostStream;

  /// Returns current organisation.
  OrgInfo get currentOrg => _currentOrg;

  @override
  Future<List<Post>> fetchDataFromApi() async {
    final query = PinnedPostQueries().getPinnedPostsByOrgID();
    final variables = {
      'orgId': _currentOrg.id,
      'first': first,
      'after': after,
      'before': before,
      'last': last,
    };
    final result = await _dbFunctions.gqlAuthQuery(query, variables: variables);
    if (result.data == null) throw Exception('Unable to fetch pinned posts');
    final organization = result.data!['organization'] as Map<String, dynamic>?;
    if (organization == null) {
      throw Exception('Organization not found in response');
    }
    final pinnedPost = organization['pinnedPosts'] as Map<String, dynamic>?;
    if (pinnedPost == null) {
      throw Exception('Pinned posts not found in response');
    }

    pinnedPostInfo =
        PageInfo.fromJson(pinnedPost['pageInfo'] as Map<String, dynamic>);

    final List<Post> newPosts = [];
    for (final postJson in pinnedPost['edges'] as List) {
      final post = Post.fromJson(
        (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
      );
      // Fetch presigned URL for attachments if they exist
      await post.getPresignedUrl(userConfig.currentOrg.id);

      post.isPinned = true;
      newPosts.insert(0, post);
    }
    return newPosts;
  }

  /// Fetches pinned posts from API, updates cache and stream.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshPinnedPosts() async {
    after = null;
    before = null;
    first = _defaultPageSize;
    last = null;
    _pinnedPosts = await getNewFeedAndRefreshCache();
    _pinnedPostStreamController.add(_pinnedPosts);
  }

  ///  Method to load cached data from Hive database.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchPostsInitial() async {
    _pinnedPosts = await loadCachedData();
    _pinnedPostStreamController.add(_pinnedPosts);
    await refreshPinnedPosts();
  }

  ///This method sets up a stream that constantly listens to change in current org.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void setOrgStreamSubscription() {
    _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
      if (updatedOrganization != _currentOrg) {
        _pinnedPosts.clear();
        _currentOrg = updatedOrganization;
        refreshPinnedPosts();
      }
    });
  }
}
