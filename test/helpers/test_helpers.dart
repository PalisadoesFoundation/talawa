import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/waiting_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(returnNullOnMissingStub: true),
    MockSpec<GraphqlConfig>(returnNullOnMissingStub: true),
    MockSpec<PostService>(returnNullOnMissingStub: true),
    MockSpec<MultiMediaPickerService>(returnNullOnMissingStub: true),
    MockSpec<EventService>(returnNullOnMissingStub: true),
    MockSpec<ChatService>(returnNullOnMissingStub: true),
    MockSpec<UserConfig>(returnNullOnMissingStub: true),
    MockSpec<AppLanguage>(returnNullOnMissingStub: true),
    MockSpec<Connectivity>(returnNullOnMissingStub: true),
    MockSpec<SignupDetailsViewModel>(returnNullOnMissingStub: true),
    MockSpec<Post>(returnNullOnMissingStub: true),
    MockSpec<DataBaseMutationFunctions>(returnNullOnMissingStub: true),
    MockSpec<OrganizationService>(returnNullOnMissingStub: true),
    MockSpec<ExploreEventsViewModel>(returnNullOnMissingStub: true),
    MockSpec<Validator>(returnNullOnMissingStub: true),
    MockSpec<QRViewController>(returnNullOnMissingStub: true),
    MockSpec<CommentService>(returnNullOnMissingStub: true),
    MockSpec<AppTheme>(returnNullOnMissingStub: true),
  ],
)
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  when(service.navigatorKey).thenReturn(GlobalKey<NavigatorState>());
  when(service.removeAllAndPush(any, any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.pushScreen(any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.popAndPushScreen(any, arguments: '-1')).thenAnswer((_) async {});
  locator.registerSingleton<NavigationService>(service);
  return service;
}

OrganizationService getAndRegisterOrganizationService() {
  _removeRegistrationIfExists<OrganizationService>();
  final service = MockOrganizationService();
  locator.registerSingleton<OrganizationService>(service);
  return service;
}

AppTheme getAndRegisterAppTheme() {
  _removeRegistrationIfExists<AppTheme>();
  final service = MockAppTheme();
  locator.registerSingleton<AppTheme>(service);
  return service;
}

CommentService getAndRegisterCommentService() {
  _removeRegistrationIfExists<CommentService>();
  final service = MockCommentService();
  locator.registerSingleton<CommentService>(service);
  return service;
}

ChatService getAndRegisterChatService() {
  _removeRegistrationIfExists<ChatService>();
  final service = MockChatService();
  final StreamController<ChatListTileDataModel> _streamController =
      StreamController();
  final Stream<ChatListTileDataModel> _stream =
      _streamController.stream.asBroadcastStream();

  final StreamController<ChatMessage> _chatMessageController =
      StreamController<ChatMessage>();
  final Stream<ChatMessage> _messagestream =
      _chatMessageController.stream.asBroadcastStream();

  when(service.chatListStream).thenAnswer((invocation) => _stream);
  when(service.chatMessagesStream).thenAnswer((invocation) => _messagestream);
  when(service.getDirectChatsByUserId())
      .thenAnswer((invocation) async => _streamController.add(
            ChatListTileDataModel([
              ChatUser(
                firstName: 'test',
                id: '1',
                image: 'fakeHttp',
              )
            ], '1'),
          ));
  locator.registerSingleton<ChatService>(service);
  return service;
}

AppLanguage getAndRegisterAppLanguage() {
  _removeRegistrationIfExists<AppLanguage>();
  final service = MockAppLanguage();
  locator.registerSingleton<AppLanguage>(service);
  return service;
}

GraphqlConfig getAndRegisterGraphqlConfig() {
  _removeRegistrationIfExists<GraphqlConfig>();
  final service = MockGraphqlConfig();

  when(service.httpLink).thenReturn(HttpLink(
    'https://talawa-graphql-api.herokuapp.com/graphql',
    httpClient: MockHttpClient(),
  ));

  when(service.clientToQuery()).thenAnswer((realInvocation) {
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: service.httpLink,
    );
  });

  when(service.authClient()).thenAnswer((realInvocation) {
    final AuthLink authLink =
        AuthLink(getToken: () async => 'Bearer ${GraphqlConfig.token}');
    final Link finalAuthLink = authLink.concat(service.httpLink);
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: finalAuthLink,
    );
  });

  locator.registerSingleton<GraphqlConfig>(service);
  return service;
}

DataBaseMutationFunctions getAndRegisterDatabaseMutationFunctions() {
  _removeRegistrationIfExists<DataBaseMutationFunctions>();
  final service = MockDataBaseMutationFunctions();
  locator.registerSingleton<DataBaseMutationFunctions>(service);
  return service;
}

UserConfig getAndRegisterUserConfig() {
  _removeRegistrationIfExists<UserConfig>();
  final service = MockUserConfig();

  final User member1 = User(id: "testMem1");
  final User member2 = User(id: "testMem2");
  final User admin1 = User(id: "testAdmin1");
  final User admin2 = User(id: "testAdmin2");
  final List<User> members = [member1, member2];
  final List<User> admins = [admin1, admin2];

  //Mock Data for current organizaiton.
  when(service.currentOrg).thenReturn(
    OrgInfo(
      id: "XYZ",
      name: "Organization Name",
      members: members,
      admins: admins,
    ),
  );

  //Mock Stream for currentOrgStream
  final StreamController<OrgInfo> _streamController = StreamController();
  final Stream<OrgInfo> _stream = _streamController.stream.asBroadcastStream();
  when(service.currentOrgInfoController)
      .thenAnswer((invocation) => _streamController);
  when(service.currentOrgInfoStream).thenAnswer((invocation) => _stream);

  //Mkock current user
  when(service.currentUser).thenReturn(
    User(
      id: "xzy1",
      firstName: "Test",
      lastName: "User",
      email: "testuser@gmail.com",
      refreshToken: "testtoken",
      authToken: 'testtoken',
      adminFor: [],
      joinedOrganizations: [
        OrgInfo(
          id: '3',
          name: 'test org 3',
          isPublic: true,
          creatorInfo: User(firstName: 'test', lastName: '1'),
        ),
        OrgInfo(
          id: '4',
          name: 'test org 4',
          isPublic: false,
          creatorInfo: User(firstName: 'test', lastName: '2'),
        ),
        OrgInfo(
          id: "XYZ",
          name: "Organization Name",
        ),
      ],
      membershipRequests: [
        OrgInfo(
          id: '1',
          name: 'test org',
          isPublic: false,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        ),
        OrgInfo(
          id: '2',
          name: 'test org',
          isPublic: false,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        )
      ],
    ),
  );

  locator.registerSingleton<UserConfig>(service);

  return service;
}

PostService getAndRegisterPostService() {
  _removeRegistrationIfExists<PostService>();
  final service = MockPostService();

  //Mock Stream for currentOrgStream
  final StreamController<List<Post>> _streamController = StreamController();
  final Stream<List<Post>> _stream =
      _streamController.stream.asBroadcastStream();
  when(service.postStream).thenAnswer((invocation) => _stream);

  final StreamController<Post> _updateStreamController = StreamController();
  final Stream<Post> _updateStream =
      _updateStreamController.stream.asBroadcastStream();
  when(service.updatedPostStream).thenAnswer((invocation) => _updateStream);

  locator.registerSingleton<PostService>(service);
  return service;
}

MultiMediaPickerService getAndRegisterMultiMediaPickerService() {
  _removeRegistrationIfExists<MultiMediaPickerService>();
  final service = MockMultiMediaPickerService();
  locator.registerSingleton<MultiMediaPickerService>(service);
  return service;
}

EventService getAndRegisterEventService() {
  _removeRegistrationIfExists<EventService>();
  final service = MockEventService();

  //Mock Stream for currentOrgStream
  final StreamController<Event> _streamController = StreamController();
  final Stream<Event> _stream = _streamController.stream.asBroadcastStream();
  when(service.eventStream).thenAnswer((invocation) => _stream);
  when(service.getEvents()).thenAnswer(
    (invocation) async => _streamController.add(
      Event(
        id: '1',
        title: 'test',
        startTime: '10000',
        endTime: '20000',
        location: 'ABC',
        description: 'test',
        creator: User(
          id: "xzy1",
          firstName: "Test",
          lastName: "User",
          email: "testuser@gmail.com",
          refreshToken: "testtoken",
          authToken: 'testtoken',
        ),
        isPublic: true,
        organization: OrgInfo(id: 'XYZ'),
      ),
    ),
  );

  locator.registerSingleton<EventService>(service);
  return service;
}

Connectivity getAndRegisterConnectivityService() {
  _removeRegistrationIfExists<Connectivity>();
  final service = MockConnectivity();
  locator.registerSingleton<Connectivity>(service);
  return service;
}

Post getPostMockModel({
  String sId = "PostID",
  String description = "TestDescription",
  String duration = "2 Months Ago",
}) {
  final postMock = MockPost();
  when(postMock.sId).thenReturn(sId);
  when(postMock.creator).thenReturn(User(
    firstName: "TestName",
  ));
  when(postMock.description).thenReturn(description);
  when(postMock.comments).thenReturn([]);
  when(postMock.getPostCreatedDuration()).thenReturn(duration);
  return postMock;
}

void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterAppLanguage();
  getAndRegisterGraphqlConfig();
  getAndRegisterUserConfig();
  getAndRegisterPostService();
  getAndRegisterEventService();
  getAndRegisterMultiMediaPickerService();
  getAndRegisterConnectivityService();
  getAndRegisterDatabaseMutationFunctions();
  getAndRegisterOrganizationService();
  getAndRegisterCommentService();
  getAndRegisterChatService();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<GraphqlConfig>();
  locator.unregister<UserConfig>();
  locator.unregister<PostService>();
  locator.unregister<EventService>();
  locator.unregister<MultiMediaPickerService>();
  locator.unregister<Connectivity>();
  locator.unregister<DataBaseMutationFunctions>();
  locator.unregister<OrganizationService>();
  locator.unregister<CommentService>();
}

void registerViewModels() {
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => SizeConfig());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => EventInfoViewModel());
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => SelectOrganizationViewModel());
}

void unregisterViewModels() {
  locator.unregister<MainScreenViewModel>();
  locator.unregister<OrganizationFeedViewModel>();
  locator.unregister<ExploreEventsViewModel>();
  locator.unregister<AddPostViewModel>();
  locator.unregister<ProfilePageViewModel>();
  locator.unregister<LikeButtonViewModel>();
  locator.unregister<SizeConfig>();
  locator.unregister<DirectChatViewModel>();
  locator.unregister<WaitingViewModel>();
  locator.unregister<EventInfoViewModel>();
  locator.unregister<ProgressDialogViewModel>();
  locator.unregister<SelectOrganizationViewModel>();
}
