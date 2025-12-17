import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat.dart';

import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/services/app_config_service.dart';
import 'package:talawa/services/chat_core_service.dart';
import 'package:talawa/services/chat_membership_service.dart';
import 'package:talawa/services/chat_message_service.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/pinned_post_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/services/user_profile_service.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/waiting_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';

import '../service_tests/user_config_test.dart';
import '../views/main_screen_test.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<GraphqlConfig>(
      as: #MockGraphqlConfig,
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<GraphQLClient>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<PostService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<MultiMediaPickerService>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<EventService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<FundService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<UserConfig>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppLanguage>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<SignupDetailsViewModel>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<Post>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DataBaseMutationFunctions>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<OrganizationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ExploreEventsViewModel>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<OrganizationFeedViewModel>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<FundViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<Validator>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<CommentService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppTheme>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<CreateEventViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DirectChatViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<GroupChatViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<SelectContactViewModel>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<AppSettingViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImageCropper>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImagePicker>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImageService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ActionHandlerService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<XFile>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ConnectivityService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<Connectivity>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<FlutterImageCompress>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<GraphQLCache>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<Store>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<PageInfo>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppLinks>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatCoreService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatMembershipService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatMessageService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<UserProfileService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<PinnedPostService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<User>(onMissingStub: OnMissingStub.returnDefault),
  ],
)

/// member1 represents a member of the organization.
final User member1 = User(id: "testMem1");

/// member2 represents a member of the organization.
final User member2 = User(id: "testMem2");

/// admin1 represents an admin of the organization.
final User admin1 = User(id: "testAdmin1");

/// admin2 represents an admin of the organization.
final User admin2 = User(id: "testAdmin2");

/// members represents a list of members of the organization.
final List<User> members = [member1, member2];

/// admins represents a list of admins of the organization.
final List<User> admins = [admin1, admin2];

/// fakeOrgInfo represents a mock organization.
final fakeOrgInfo = OrgInfo(
  id: "XYZ",
  name: "Organization Name",
  userRegistrationRequired: true,
);

/// `removeRegistrationIfExists` removes the registration of a service if it is already registered.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

///  `getAndRegisterNavigationService` returns a mock instance of the `NavigationService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `NavigationService`: A mock instance of the `NavigationService` class.
NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  final key = GlobalKey<NavigatorState>();
  when(service.navigatorKey).thenReturn(key);
  when(service.removeAllAndPush(any, any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.pushScreen(any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.popAndPushScreen(any, arguments: '-1')).thenAnswer((_) async {});
  when(service.pushDialog(any)).thenAnswer((_) {});
  when(service.showTalawaErrorSnackBar(any, any)).thenAnswer((_) {});
  locator.registerSingleton<NavigationService>(service);
  return service;
}

/// Registers and returns a mock OrganizationService instance.
///
/// **params**:
///   None
///
/// **returns**:
/// * `OrganizationService`: Mock service instance for testing purposes.
OrganizationService getAndRegisterOrganizationService() {
  _removeRegistrationIfExists<OrganizationService>();
  final service = MockOrganizationService();
  locator.registerSingleton<OrganizationService>(service);

  final User user1 = User(
    id: "fakeUser1",
    name: 'ayush chaudhary',
    image: 'www.image.com',
  );
  final User user2 = User(
    id: "fakeUser2",
    name: 'ayush chaudhary',
    image: 'www.image.com',
  );
  final List<User> users = [user1, user2];
  when(service.getOrgMembersList('XYZ')).thenAnswer((realInvocation) async {
    return users;
  });
  return service;
}

/// `getAndRegisterAppTheme` returns a mock instance of the `AppTheme` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `AppTheme`: A mock instance of the `AppTheme` class.
AppTheme getAndRegisterAppTheme() {
  _removeRegistrationIfExists<AppTheme>();
  final service = MockAppTheme();
  locator.registerSingleton<AppTheme>(service);
  return service;
}

/// `getAndRegisterCommentService` returns a mock instance of the `CommentService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `CommentService`: A mock instance of the `CommentService` class.
CommentService getAndRegisterCommentService() {
  _removeRegistrationIfExists<CommentService>();
  final service = MockCommentService();
  locator.registerSingleton<CommentService>(service);
  return service;
}

/// `getAndRegisterSessionManager` returns a mock instance of the `SessionManager` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `SessionManager`: A mock instance of the `SessionManager` class.
SessionManager getAndRegisterSessionManager() {
  _removeRegistrationIfExists<SessionManager>();
  final service = MockSessionManger();
  locator.registerSingleton<SessionManager>(service);
  return service;
}

/// `getAndRegisterChatService` returns a mock instance of the `ChatService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ChatService`: A mock instance of the `ChatService` class.
ChatService getAndRegisterChatService() {
  _removeRegistrationIfExists<ChatService>();
  final service = MockChatService();

  // Mock streams for the new PostgreSQL chat system
  final StreamController<Chat> chatController = StreamController();
  final Stream<Chat> chatStream = chatController.stream.asBroadcastStream();

  final StreamController<ChatMessage> chatMessageController =
      StreamController<ChatMessage>();
  final Stream<ChatMessage> messageStream =
      chatMessageController.stream.asBroadcastStream();

  // Mock the updated service methods
  when(service.chatListStream).thenAnswer((invocation) => chatStream);
  when(service.chatMessagesStream).thenAnswer((invocation) => messageStream);

  // Mock createChat method
  when(
    service.createChat(
      name: 'Test Chat',
      description: 'A test chat',
    ),
  ).thenAnswer((invocation) async {
    final chat = Chat(
      id: 'test-chat-id',
      name: 'Test Chat',
      description: 'A test chat',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      members: [],
      messages: [],
    );
    chatController.add(chat);
    return chat;
  });

  // Mock createChatMembership method
  when(
    service.createChatMembership(
      chatId: 'test-chat-id',
      userId: 'test-user-id',
    ),
  ).thenAnswer((invocation) async => true);

  // Mock getChatsByUser method
  when(service.getChatsByUser()).thenAnswer((invocation) async {
    final chat = Chat(
      id: 'test-chat-id',
      name: 'Test Chat',
      description: 'A test chat',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      members: [
        ChatUser(
          firstName: 'Test',
          id: '1',
          image: 'fakeHttp',
        ),
      ],
      messages: [],
    );
    chatController.add(chat);
    return [chat]; // Return a list of chats
  });

  // Mock getChatDetails method (with and without isInitialLoad parameter)
  when(service.getChatDetails('test-chat-id')).thenAnswer((invocation) async {
    return Chat(
      id: 'test-chat-id',
      name: 'Test Chat',
      description: 'A test chat',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      members: [
        ChatUser(
          firstName: 'Test',
          id: '1',
          image: 'fakeHttp',
        ),
      ],
      messages: [
        ChatMessage(
          id: 'test-message-id',
          body: 'Test message',
          creator: ChatUser(
            firstName: 'Test',
            id: '1',
            image: 'fakeHttp',
          ),
          chatId: 'test-chat-id',
          createdAt: DateTime.now().toIso8601String(),
        ),
      ],
    );
  });

  // Mock getChatDetails with isInitialLoad parameter
  when(service.getChatDetails('test-chat-id', isInitialLoad: true))
      .thenAnswer((invocation) async {
    return Chat(
      id: 'test-chat-id',
      name: 'Test Chat',
      description: 'A test chat',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      members: [
        ChatUser(
          firstName: 'Test',
          id: '1',
          image: 'fakeHttp',
        ),
      ],
      messages: [
        ChatMessage(
          id: 'test-message-id',
          body: 'Test message',
          creator: ChatUser(
            firstName: 'Test',
            id: '1',
            image: 'fakeHttp',
          ),
          chatId: 'test-chat-id',
          createdAt: DateTime.now().toIso8601String(),
        ),
      ],
    );
  });

  when(service.getChatDetails('test-chat-id', isInitialLoad: false))
      .thenAnswer((invocation) async {
    return Chat(
      id: 'test-chat-id',
      name: 'Test Chat',
      description: 'A test chat',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      members: [
        ChatUser(
          firstName: 'Test',
          id: '1',
          image: 'fakeHttp',
        ),
      ],
      messages: [
        ChatMessage(
          id: 'test-message-id',
          body: 'Test message',
          creator: ChatUser(
            firstName: 'Test',
            id: '1',
            image: 'fakeHttp',
          ),
          chatId: 'test-chat-id',
          createdAt: DateTime.now().toIso8601String(),
        ),
      ],
    );
  });

  // Mock sendMessage method
  when(
    service.sendMessage(
      chatId: 'test-chat-id',
      body: 'Test message',
    ),
  ).thenAnswer((invocation) async {
    final chatMessage = ChatMessage(
      id: 'test-message-id',
      body: 'Test message',
      creator: ChatUser(
        firstName: 'Test',
        id: '1',
        image: 'fakeHttp',
      ),
      chatId: 'test-chat-id',
      createdAt: DateTime.now().toIso8601String(),
    );
    chatMessageController.add(chatMessage);
    return chatMessage;
  });

  // Mock subscribeToChatMessages method
  when(service.subscribeToChatMessages(any))
      .thenAnswer((invocation) => messageStream);

  // Mock new pagination methods
  when(service.loadMoreMessages(any)).thenAnswer((invocation) async => []);
  when(service.hasMoreMessages(any)).thenReturn(false);

  // Mock specific test cases
  when(service.loadMoreMessages('test-chat-id'))
      .thenAnswer((invocation) async => []);
  when(service.hasMoreMessages('test-chat-id')).thenReturn(false);

  locator.registerSingleton<ChatService>(service);
  return service;
}

/// `getAndRegisterAppLanguage` returns a mock instance of the `AppLanguage` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `AppLanguage`: A mock instance of the `AppLanguage` class.
AppLanguage getAndRegisterAppLanguage() {
  _removeRegistrationIfExists<AppLanguage>();
  final service = MockAppLanguage();

  when(service.appLocal).thenReturn(const Locale('en'));

  locator.registerSingleton<AppLanguage>(service);
  return service;
}

/// `getAndRegisterFundService` returns a mock instance of the `FundService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `FundService`: A mock instance of the `FundService` class.
FundService getAndRegisterFundService() {
  _removeRegistrationIfExists<FundService>();
  final service = MockFundService();

  _removeRegistrationIfExists<FundService>();
  locator.registerSingleton<FundService>(service);
  return service;
}

/// `getAndRegisterLocalActionHandlerService` returns a mock instance of the `ActionHandlerService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `MockActionHandlerService`: A mock instance of the `ActionHandlerService` class.
MockActionHandlerService getAndRegisterLocalActionHandlerService() {
  if (locator.isRegistered<ActionHandlerService>()) {
    locator.unregister<ActionHandlerService>();
  }
  final service = MockActionHandlerService();
  locator.registerSingleton<ActionHandlerService>(service);
  return service;
}

/// `getAndRegisterGraphqlConfig` returns a mock instance of the `GraphqlConfig` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `GraphqlConfig`: A mock instance of the `GraphqlConfig` class.
GraphqlConfig getAndRegisterGraphqlConfig() {
  _removeRegistrationIfExists<GraphqlConfig>();
  final service = MockGraphqlConfig();

  final mockLink = HttpLink(
    'https://talawa-graphql-api.herokuapp.com/graphql',
    httpClient: MockHttpClient(),
  );

  // Use stub instead of when for better null safety handling
  when(service.httpLink).thenReturn(mockLink);

  when(service.clientToQuery()).thenAnswer((realInvocation) {
    // return GraphQLClient(
    //   cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    //   link: service.httpLink,
    // );

    return locator<GraphQLClient>();
  });

  when(service.authClient()).thenAnswer((realInvocation) {
    // final AuthLink authLink =
    //     AuthLink(getToken: () async => 'Bearer ${GraphqlConfig.token}');
    // final Link finalAuthLink = authLink.concat(service.httpLink);
    // return GraphQLClient(
    //   cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    //   link: finalAuthLink,
    // );
    return locator<GraphQLClient>();
  });

  when(service.getToken()).thenAnswer((_) => "sample_token");

  locator.registerSingleton<GraphqlConfig>(service);
  return service;
}

/// `getAndRegisterGraphQLClient` returns a mock instance of the `GraphQLClient` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `GraphQLClient`: A mock instance of the `GraphQLClient` class.
GraphQLClient getAndRegisterGraphQLClient() {
  _removeRegistrationIfExists<GraphQLClient>();

  final service = MockGraphQLClient();

  // Either fill this with mock data or override this stub
  // and return null

  when(service.defaultPolicies).thenAnswer(
    (realInvocation) => DefaultPolicies(),
  );
  when(service.queryManager).thenAnswer(
    (realInvocation) => QueryManager(
      link: HttpLink("testurl"),
      cache: GraphQLCache(),
    ),
  );

  locator.registerSingleton<GraphQLClient>(service);

  return service;
}

/// `getAndRegisterDatabaseMutationFunctions` returns a mock instance of the `DataBaseMutationFunctions` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `DataBaseMutationFunctions`: A mock instance of the `DataBaseMutationFunctions` class.
DataBaseMutationFunctions getAndRegisterDatabaseMutationFunctions() {
  _removeRegistrationIfExists<DataBaseMutationFunctions>();
  final service = MockDataBaseMutationFunctions();
  when(service.refreshAccessToken('testtoken')).thenAnswer((_) async {
    return true;
  });
  locator.registerSingleton<DataBaseMutationFunctions>(service);
  return service;
}

/// `getAndRegisterUserConfig` returns a mock instance of the `UserConfig` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `UserConfig`: A mock instance of the `UserConfig` class.
UserConfig getAndRegisterUserConfig() {
  _removeRegistrationIfExists<UserConfig>();
  final service = MockUserConfig();

  when(service.userLoggedIn()).thenAnswer(
    (realInvocation) => Future<bool>.value(false),
  );

  when(service.currentUser).thenReturn(
    User(
      id: 'id',
      name: 'john snow',
    ),
  );

  //Mock Data for current organizaiton.
  when(service.currentOrg).thenReturn(
    OrgInfo(
      id: "XYZ",
      name: "Organization Name",
    ),
  );

  //Mock Stream for currentOrgStream
  final StreamController<OrgInfo> streamController = StreamController();
  final Stream<OrgInfo> stream = streamController.stream.asBroadcastStream();
  when(service.currentOrgInfoController)
      .thenAnswer((invocation) => streamController);
  when(service.currentOrgInfoStream).thenAnswer((invocation) => stream);

  //Mkock current user
  when(service.currentUser).thenReturn(
    User(
      id: "xzy1",
      name: "Test User",
      email: "testuser@gmail.com",
      refreshToken: "testtoken",
      authToken: 'testtoken',
      joinedOrganizations: [
        OrgInfo(
          id: '3',
          name: 'test org 3',
          userRegistrationRequired: false,
        ),
        OrgInfo(
          id: '4',
          name: 'test org 4',
          userRegistrationRequired: true,
        ),
        OrgInfo(
          id: "XYZ",
          name: "Organization Name",
        ),
      ],
      membershipRequests: ["1", "2"],
    ),
  );

  locator.registerSingleton<UserConfig>(service);

  return service;
}

/// `getAndRegisterPostService` returns a mock instance of the `PostService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `PostService`: A mock instance of the `PostService` class.
PostService getAndRegisterPostService() {
  _removeRegistrationIfExists<PostService>();
  final service = MockPostService();

  //Mock Stream for currentOrgStream
  final StreamController<List<Post>> streamController = StreamController();
  final Stream<List<Post>> stream = streamController.stream.asBroadcastStream();
  // _streamController.add(posts);
  when(service.postStream).thenAnswer((invocation) => stream);

  final StreamController<Post> updateStreamController = StreamController();
  final Stream<Post> updateStream =
      updateStreamController.stream.asBroadcastStream();
  when(service.updatedPostStream).thenAnswer((invocation) => updateStream);

  locator.registerSingleton<PostService>(service);
  return service;
}

/// `getAndRegisterPinnedPostService` returns a mock instance of the `PinnedPostService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `PinnedPostService`: A mock instance of the `PinnedPostService` class.
PinnedPostService getAndRegisterPinnedPostService() {
  _removeRegistrationIfExists<PinnedPostService>();
  final service = MockPinnedPostService();

  final StreamController<List<Post>> streamController = StreamController();
  final Stream<List<Post>> stream = streamController.stream.asBroadcastStream();
  when(service.pinnedPostStream).thenAnswer((_) => stream);
  when(service.refreshPinnedPosts()).thenAnswer((_) async {});

  locator.registerSingleton<PinnedPostService>(service);
  return service;
}

/// `getAndRegisterMultiMediaPickerService` returns a mock instance of the `MultiMediaPickerService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `MultiMediaPickerService`: A mock instance of the `MultiMediaPickerService` class.
MultiMediaPickerService getAndRegisterMultiMediaPickerService() {
  _removeRegistrationIfExists<MultiMediaPickerService>();
  final service = MockMultiMediaPickerService();
  locator.registerSingleton<MultiMediaPickerService>(service);
  return service;
}

/// `getAndRegisterImageCropper` returns a mock instance of the `ImageCropper` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ImageCropper`: A mock instance of the `ImageCropper` class.
ImageCropper getAndRegisterImageCropper() {
  _removeRegistrationIfExists<ImageCropper>();
  final service = MockImageCropper();
  locator.registerLazySingleton<ImageCropper>(() => service);
  return service;
}

/// `getAndRegisterImageService` returns a mock instance of the `ImageService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ImageService`: A mock instance of the `ImageService` class.
ImageService getAndRegisterImageService() {
  _removeRegistrationIfExists<ImageService>();
  final service = MockImageService();
  // Mock the convertToBase64 method to return a proper base64 string
  when(service.convertToBase64(any)).thenAnswer((realInvocation) async {
    // Return a dummy base64 string for testing
    return 'VGVzdCBmaWxlIGNvbnRlbnQ='; // "Test file content" in base64
  });

  // Mock the cropImage method
  when(service.cropImage(imageFile: anyNamed('imageFile')))
      .thenAnswer((realInvocation) async {
    final imageFile = realInvocation.namedArguments[#imageFile] as File;
    return imageFile; // Return the same file for testing
  });

  locator.registerLazySingleton<ImageService>(() => service);
  return service;
}

/// `getAndRegisterImagePicker` returns a mock instance of the `ImagePicker` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ImagePicker`: A mock instance of the `ImagePicker` class.
ImagePicker getAndRegisterImagePicker() {
  _removeRegistrationIfExists<ImagePicker>();
  final service = MockImagePicker();
  locator.registerLazySingleton<ImagePicker>(() => service);
  return service;
}

/// `getAndRegisterEventService` returns a mock instance of the `EventService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `EventService`: A mock instance of the `EventService` class.
EventService getAndRegisterEventService() {
  _removeRegistrationIfExists<EventService>();
  final service = MockEventService();

  //Mock Stream for currentOrgStream
  final StreamController<List<Event>> streamController = StreamController();
  final Stream<List<Event>> stream =
      streamController.stream.asBroadcastStream();
  when(service.eventStream).thenAnswer((invocation) => stream);
  when(service.getEvents()).thenAnswer(
    (invocation) async => streamController.add([
      Event(
        id: '1',
        name: 'test',
        startAt: DateTime.now(),
        endAt: DateTime.now().add(const Duration(hours: 1)),
        location: 'ABC',
        description: 'test',
        creator: User(
          id: "xzy1",
          name: "Test User",
          email: "testuser@gmail.com",
          refreshToken: "testtoken",
          authToken: 'testtoken',
        ),
        admins: [
          User(
            id: "xzy1",
            name: "Test User",
          ),
        ],
        isPublic: true,
        organization: OrgInfo(id: 'XYZ'),
      ),
    ]),
  );
  const data = {
    'getEventAttendeesByEventId': [
      {
        'userId': 'xzy1',
      }
    ],
  };
  when(service.fetchAttendeesByEvent('1')).thenAnswer(
    (realInvocation) async => QueryResult(
      source: QueryResultSource.network,
      data: data,
      options: QueryOptions(
        document: gql(
          EventQueries().attendeesByEvent('1'),
        ),
      ),
    ),
  );

  locator.registerSingleton<EventService>(service);
  return service;
}

/// `getAndRegisterConnectivity` returns a mock instance of the `Connectivity` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Connectivity`: A mock instance of the `Connectivity` class.
Connectivity getAndRegisterConnectivity() {
  _removeRegistrationIfExists<Connectivity>();
  final service = MockConnectivity();
  locator.registerSingleton<Connectivity>(service);
  return service;
}

/// `getAndRegisterConnectivityService` returns a mock instance of the `ConnectivityService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ConnectivityService`: A mock instance of the `ConnectivityService` class.
ConnectivityService getAndRegisterConnectivityService() {
  _removeRegistrationIfExists<ConnectivityService>();
  final service = MockConnectivityService();

  when(service.connectionStream).thenAnswer((_) =>
      Stream<List<ConnectivityResult>>.value([ConnectivityResult.wifi])
          .asBroadcastStream());
  when(service.connectionStatusController)
      .thenReturn(StreamController<List<ConnectivityResult>>());
  when(service.getConnectionType())
      .thenAnswer((_) async => [ConnectivityResult.wifi]);

  locator.registerSingleton<ConnectivityService>(service);
  return service;
}

/// `getPostMockModel` returns a mock instance of the `Post` class.
///
/// **params**:
/// * `sId`: represent the post id.
/// * `description`: represent the post description.
/// * `duration`: represent the post duration.
///
/// **returns**:
/// * `Post`: A mock instance of the `Post` class.
Post getPostMockModel({
  String sId = "PostID",
  String description = "TestDescription",
  String duration = "2 Months Ago",
}) {
  final postMock = MockPost();
  when(postMock.id).thenReturn(sId);
  when(postMock.creator).thenReturn(
    User(
      name: "TestName",
    ),
  );
  when(postMock.caption).thenReturn(description);
  when(postMock.getPostCreatedDuration()).thenReturn(duration);
  return postMock;
}

/// `getAndRegisterCreateEventModel` returns a mock instance of the `CreateEventViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `CreateEventViewModel`: A mock instance of the `CreateEventViewModel` class.
CreateEventViewModel getAndRegisterCreateEventModel() {
  _removeRegistrationIfExists<CreateEventViewModel>();
  final cachedViewModel = MockCreateEventViewModel();

  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  final focusNode = FocusNode();

  when(cachedViewModel.formKey).thenReturn(formKey);
  when(cachedViewModel.titleFocus).thenReturn(focusNode);
  when(cachedViewModel.locationFocus).thenReturn(focusNode);
  when(cachedViewModel.descriptionFocus).thenReturn(focusNode);
  when(cachedViewModel.eventLocationTextController)
      .thenReturn(textEditingController);
  when(cachedViewModel.eventTitleTextController)
      .thenReturn(textEditingController);
  when(cachedViewModel.eventDescriptionTextController)
      .thenReturn(textEditingController);
  when(cachedViewModel.eventStartDate).thenReturn(DateTime.now());
  when(cachedViewModel.eventEndDate).thenReturn(DateTime.now());
  when(cachedViewModel.eventStartTime).thenReturn(TimeOfDay.now());
  when(cachedViewModel.eventEndTime).thenReturn(TimeOfDay.now());
  when(cachedViewModel.isPublicSwitch).thenReturn(true);
  when(cachedViewModel.isRegisterableSwitch).thenReturn(true);

  final User user1 = User(
    id: "fakeUser1",
    name: 'r p',
  );

  final mapType = {user1.id!: true};

  when(cachedViewModel.getCurrentOrgUsersList())
      .thenAnswer((realInvocation) async {
    return [user1];
  });

  when(cachedViewModel.selectedMembers).thenReturn([user1]);
  when(cachedViewModel.orgMembersList).thenReturn([user1]);
  when(cachedViewModel.memberCheckedMap).thenReturn(mapType);
  when(cachedViewModel.isAllDay).thenReturn(true);
  when(cachedViewModel.eventStartTime).thenReturn(TimeOfDay.now());

  when(cachedViewModel.eventEndTime).thenReturn(
    TimeOfDay.now().replacing(
      hour:
          (TimeOfDay.now().hour + (TimeOfDay.now().minute >= 30 ? 1 : 0)) % 24,
      minute: (TimeOfDay.now().minute + 30) % 60,
    ),
  );

  when(cachedViewModel.removeUserFromList(userId: "fakeUser1"))
      .thenAnswer((realInvocation) {
    when(cachedViewModel.selectedMembers).thenReturn([]);
  });

  when(cachedViewModel.createEvent()).thenAnswer((realInvocation) async {
    print('called');
  });

  locator.registerSingleton<CreateEventViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterDirectChatViewModel` returns a mock instance of the `DirectChatViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `DirectChatViewModel`: A mock instance of the `DirectChatViewModel` class.
DirectChatViewModel getAndRegisterDirectChatViewModel() {
  _removeRegistrationIfExists<DirectChatViewModel>();
  final cachedViewModel = MockDirectChatViewModel();
  final formKey = GlobalKey<AnimatedListState>();
  final ChatUser chatUser1 =
      ChatUser(firstName: "XYZ", id: "XYZ", image: "XYZ");
  final ChatUser chatUser2 =
      ChatUser(firstName: "ABC", id: "ABC", image: "ABC");
  final ChatMessage chatMessage1 = ChatMessage(
    id: "XYZ",
    body: "XYZ",
    creator: chatUser1,
    chatId: "XYZ",
    createdAt: DateTime.now().toIso8601String(),
  );
  final ChatMessage chatMessage2 = ChatMessage(
    id: "ABC",
    body: "Something",
    creator: chatUser1,
    chatId: "XYZ",
    createdAt: DateTime.now().toIso8601String(),
  );
  final Map<String, List<ChatMessage>> messages = {
    "XYZ": [chatMessage1],
  };
  final ChatListTileDataModel chatListTileDataModel1 = ChatListTileDataModel(
    id: "XYZ",
    users: [chatUser1, chatUser2],
    chat: Chat(
      id: "XYZ",
      name: "Test Chat",
      members: [chatUser1, chatUser2],
      messages: [chatMessage1],
    ),
  );

  when(cachedViewModel.listKey).thenReturn(formKey);
  // Default is the loaded state
  when(cachedViewModel.chatState).thenReturn(ChatState.complete);
  when(cachedViewModel.name).thenReturn("XYZ");
  when(cachedViewModel.chats).thenReturn([chatListTileDataModel1]);
  when(cachedViewModel.chatMessagesByUser).thenReturn(messages);
  when(cachedViewModel.initialise()).thenAnswer((realInvocation) async {});
  when(cachedViewModel.sendMessageToDirectChat("XYZ", "Something"))
      .thenAnswer((realInvocation) async {
    messages['XYZ']?.add(chatMessage2);
  });
  when(cachedViewModel.getChatMessages("XYZ"))
      .thenAnswer((realInvocation) async {});
  when(cachedViewModel.chatName("XYZ")).thenReturn("Test Chat");

  // Mock new pagination methods
  when(cachedViewModel.loadMoreMessages("XYZ"))
      .thenAnswer((realInvocation) async {});
  when(cachedViewModel.hasMoreMessages("XYZ")).thenReturn(false);
  when(cachedViewModel.isLoadingMoreMessages("XYZ")).thenReturn(false);

  locator.registerSingleton<DirectChatViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterSelectContactViewModel` returns a mock instance of the `SelectContactViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `SelectContactViewModel`: A mock instance of the `SelectContactViewModel` class.
SelectContactViewModel getAndRegisterSelectContactViewModel() {
  _removeRegistrationIfExists<SelectContactViewModel>();
  final cachedViewModel = MockSelectContactViewModel();

  // Mock data for testing
  final User testUser1 = User(id: "user1", name: "John Doe");
  final User testUser2 = User(id: "user2", name: "Jane Smith");
  final List<User> orgMembersList = [testUser1, testUser2];

  when(cachedViewModel.orgMembersList).thenReturn(orgMembersList);
  when(cachedViewModel.initialise()).thenReturn(null);
  when(cachedViewModel.getCurrentOrgUsersList())
      .thenAnswer((realInvocation) async {});
  when(cachedViewModel.createChatWithUser(any))
      .thenAnswer((realInvocation) async => "testChatId");

  locator.registerSingleton<SelectContactViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterGroupChatViewModel` returns a mock instance of the `GroupChatViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `GroupChatViewModel`: A mock instance of the `GroupChatViewModel` class.
GroupChatViewModel getAndRegisterGroupChatViewModel() {
  _removeRegistrationIfExists<GroupChatViewModel>();
  final cachedViewModel = MockGroupChatViewModel();
  final formKey = GlobalKey<AnimatedListState>();

  // Create mock group chat users
  final ChatUser chatUser1 =
      ChatUser(firstName: "Alice", id: "user1", image: "avatar1.jpg");
  final ChatUser chatUser2 =
      ChatUser(firstName: "Bob", id: "user2", image: "avatar2.jpg");
  final ChatUser chatUser3 =
      ChatUser(firstName: "Charlie", id: "user3", image: "avatar3.jpg");

  // Create mock group chat messages
  final ChatMessage groupMessage1 = ChatMessage(
    id: "msg1",
    body: "Welcome to the group!",
    creator: chatUser1,
    chatId: "group1",
    createdAt: DateTime.now().toIso8601String(),
  );
  final ChatMessage groupMessage2 = ChatMessage(
    id: "msg2",
    body: "Thanks for adding me!",
    creator: chatUser2,
    chatId: "group1",
    createdAt: DateTime.now().toIso8601String(),
  );

  // Create mock group chat
  final Chat groupChat = Chat(
    id: "group1",
    name: "Test Group Chat",
    members: [chatUser1, chatUser2, chatUser3],
    messages: [groupMessage1, groupMessage2],
  );

  final Map<String, List<ChatMessage>> messages = {
    "group1": [groupMessage1, groupMessage2],
  };

  final ChatListTileDataModel groupChatListTile = ChatListTileDataModel(
    id: "group1",
    users: [chatUser1, chatUser2, chatUser3],
    chat: groupChat,
  );

  when(cachedViewModel.listKey).thenReturn(formKey);
  when(cachedViewModel.chatState).thenReturn(ChatState.complete);
  when(cachedViewModel.name).thenReturn("Test Group Chat");
  when(cachedViewModel.groupChats).thenReturn([groupChatListTile]);
  when(cachedViewModel.chatMessagesByUser).thenReturn(messages);
  when(cachedViewModel.initialise()).thenAnswer((realInvocation) async {});
  when(cachedViewModel.getChatMessages("group1"))
      .thenAnswer((realInvocation) async {});
  when(cachedViewModel.sendMessageToGroupChat("group1", "New message"))
      .thenAnswer((realInvocation) async {
    messages['group1']?.add(
      ChatMessage(
        id: "msg3",
        body: "New message",
        creator: chatUser1,
        chatId: "group1",
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
  });

  // Mock pagination methods
  when(cachedViewModel.loadMoreMessages("group1"))
      .thenAnswer((realInvocation) async {});
  when(cachedViewModel.hasMoreMessages("group1")).thenReturn(false);
  when(cachedViewModel.isLoadingMoreMessages("group1")).thenReturn(false);

  // Mock refresh method
  when(cachedViewModel.refreshChats()).thenReturn(null);

  // Mock getAvailableMembers method
  when(cachedViewModel.getAvailableMembers(any)).thenReturn([]);

  // Mock group management methods
  when(
    cachedViewModel.addGroupMember(
      chatId: anyNamed('chatId'),
      userId: anyNamed('userId'),
    ),
  ).thenAnswer((_) async => true);
  when(cachedViewModel.deleteGroupChat(any)).thenAnswer((_) async => true);
  when(cachedViewModel.leaveGroupChat(any, any)).thenAnswer((_) async => true);

  // Add default stub for createGroupChat to prevent ResponseFormatException
  when(
    cachedViewModel.createGroupChat(
      groupName: anyNamed('groupName'),
      description: anyNamed('description'),
      memberIds: anyNamed('memberIds'),
    ),
  ).thenAnswer((_) async => null);

  locator.registerSingleton<GroupChatViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterExploreEventsViewModel` returns a mock instance of the `ExploreEventsViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `ExploreEventsViewModel`: A mock instance of the `ExploreEventsViewModel` class.
ExploreEventsViewModel getAndRegisterExploreEventsViewModel() {
  _removeRegistrationIfExists<ExploreEventsViewModel>();
  final cachedViewModel = MockExploreEventsViewModel();

  const String chosenValue = 'All Events';
  const String emptyListMessage = "Looks like there aren't any events.";

  final EventService mockEventService = EventService();

  when(cachedViewModel.eventService).thenReturn(mockEventService);
  when(cachedViewModel.chosenValue).thenReturn(chosenValue);
  when(cachedViewModel.emptyListMessage).thenReturn(emptyListMessage);

  locator.registerSingleton<ExploreEventsViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterMainViewModel` returns a mock instance of the `MainScreenViewModel` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `MainScreenViewModel`: A mock instance of the `MainScreenViewModel` class.
MainScreenViewModel getAndRegisterMainViewModel() {
  _removeRegistrationIfExists<MainScreenViewModel>();
  final cachedViewModel = MockMainScreenViewModel();

  locator.registerSingleton<MainScreenViewModel>(cachedViewModel);
  return cachedViewModel;
}

/// `getAndRegisterPageInfo` returns a mock instance of the `PageInfo` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `PageInfo`: A mock instance of the `PageInfo` class.
PageInfo getPageInfoMock() {
  return PageInfo(
    hasNextPage: false,
    hasPreviousPage: true,
    startCursor: "start-cursor",
    endCursor: "end-cursor",
  );
}

/// `getAndRegisterUserProfileService` returns a mock instance of the `UserProfileService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `UserProfileService`: A mock instance of the `UserProfileService` class.
UserProfileService getAndRegisterUserProfileService() {
  _removeRegistrationIfExists<UserProfileService>();
  final service = MockUserProfileService();
  locator.registerSingleton<UserProfileService>(service);
  return service;
}

/// `registerServices` registers all the services required for the test.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterAppLanguage();
  getAndRegisterGraphQLClient();
  getAndRegisterGraphqlConfig();
  getAndRegisterUserConfig();
  getAndRegisterPostService();
  getAndRegisterPinnedPostService();
  getAndRegisterEventService();
  getAndRegisterMultiMediaPickerService();
  getAndRegisterConnectivity();
  getAndRegisterConnectivityService();
  getAndRegisterDatabaseMutationFunctions();
  getAndRegisterOrganizationService();
  getAndRegisterCommentService();
  getAndRegisterChatService();
  getAndRegisterImageCropper();
  getAndRegisterImagePicker();
  getAndRegisterImageService();
  getAndRegisterFundService();

  getAndRegisterUserProfileService();
  mockFlutterSecureStorage();
}

/// `unregisterServices` unregisters all the services required for the test.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void unregisterServices() {
  _removeRegistrationIfExists<NavigationService>();
  _removeRegistrationIfExists<GraphqlConfig>();
  _removeRegistrationIfExists<UserConfig>();
  _removeRegistrationIfExists<PostService>();
  _removeRegistrationIfExists<PinnedPostService>();
  _removeRegistrationIfExists<EventService>();
  _removeRegistrationIfExists<FundService>();
  _removeRegistrationIfExists<MultiMediaPickerService>();
  _removeRegistrationIfExists<Connectivity>();
  _removeRegistrationIfExists<ConnectivityService>();
  _removeRegistrationIfExists<DataBaseMutationFunctions>();
  _removeRegistrationIfExists<OrganizationService>();
  _removeRegistrationIfExists<CommentService>();
  _removeRegistrationIfExists<ImageCropper>();
  _removeRegistrationIfExists<ImagePicker>();
  _removeRegistrationIfExists<ImageService>();
  _removeRegistrationIfExists<ChatService>();
  _removeRegistrationIfExists<UserProfileService>();
  _removeRegistrationIfExists<AppConfigService>();
  PluginManager.instance.reset();
}

/// Mock FlutterSecureStorage channel.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void mockFlutterSecureStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel =
      MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
    return null;
  });
}

/// registerViewModels registers all the view models required for the test.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void registerViewModels() {
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator
      .registerFactory<CreateEventViewModel>(() => MockCreateEventViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => InteractionsViewModel());
  locator.registerFactory(() => SizeConfig());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => EditAgendaItemViewModel());
  locator.registerFactory(() => EventInfoViewModel());
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => SelectOrganizationViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => SelectContactViewModel());
}

/// `unregisterViewModels` unregisters all the view models required for the test.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void unregisterViewModels() {
  locator.unregister<MainScreenViewModel>();
  locator.unregister<EditAgendaItemViewModel>();
  locator.unregister<OrganizationFeedViewModel>();
  locator.unregister<ExploreEventsViewModel>();
  locator.unregister<CreateEventViewModel>();
  locator.unregister<AddPostViewModel>();
  locator.unregister<ProfilePageViewModel>();
  locator.unregister<InteractionsViewModel>();
  locator.unregister<SizeConfig>();
  locator.unregister<DirectChatViewModel>();
  locator.unregister<WaitingViewModel>();
  locator.unregister<EventInfoViewModel>();
  locator.unregister<ProgressDialogViewModel>();
  locator.unregister<SelectOrganizationViewModel>();
  locator.unregister<CustomDrawerViewModel>();
  locator.unregister<SelectContactViewModel>();
}

/// Helper to setup mock GraphQL client with custom response.
///
/// **params**:
/// * `data`: A map containing the mock data to return.
///
/// **returns**:
///   None
void setupMockGraphQLClient(Map<String, dynamic> data) {
  final mockGraphqlConfig = locator<GraphqlConfig>() as MockGraphqlConfig;
  final mockHttpClient = MockHttpClient();

  when(mockHttpClient.send(any)).thenAnswer((_) async {
    return http.StreamedResponse(
      Stream.fromIterable([
        utf8.encode(jsonEncode({"data": data}))
      ]),
      200,
    );
  });

  final link = HttpLink(
    'https://talawa-graphql-api.herokuapp.com/graphql',
    httpClient: mockHttpClient,
  );

  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );

  when(mockGraphqlConfig.clientToQuery()).thenReturn(client);
  when(mockGraphqlConfig.authClient()).thenReturn(client);
}
