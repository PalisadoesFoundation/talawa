// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/enums/enums.dart';
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
import 'package:talawa/services/task_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/waiting_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<GraphqlConfig>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<GraphQLClient>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<PostService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<MultiMediaPickerService>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<EventService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<UserConfig>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppLanguage>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<Connectivity>(onMissingStub: OnMissingStub.returnDefault),
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
    MockSpec<Validator>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<QRViewController>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<CommentService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppTheme>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<TaskService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<CreateEventViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DirectChatViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImageCropper>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImagePicker>(onMissingStub: OnMissingStub.returnDefault)
  ],
)
final User member1 = User(id: "testMem1");
final User member2 = User(id: "testMem2");
final User admin1 = User(id: "testAdmin1");
final User admin2 = User(id: "testAdmin2");
final List<User> members = [member1, member2];
final List<User> admins = [admin1, admin2];

final fakeOrgInfo = OrgInfo(
  id: "XYZ",
  name: "Organization Name",
  members: members,
  admins: admins,
  creatorInfo: User(
    firstName: "ravidi",
    lastName: "shaikh",
  ),
  isPublic: false,
);

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

  final User user1 = User(
    id: "fakeUser1",
    firstName: 'ayush',
    lastName: 'chaudhary',
    image: 'www.image.com',
  );
  final User user2 = User(
    id: "fakeUser2",
    firstName: 'ayush',
    lastName: 'chaudhary',
    image: 'www.image.com',
  );
  final List<User> users = [user1, user2];
  when(service.getOrgMembersList('XYZ')).thenAnswer((realInvocation) async {
    return users;
  });
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
  final StreamController<ChatListTileDataModel> streamController =
      StreamController();
  final Stream<ChatListTileDataModel> stream =
      streamController.stream.asBroadcastStream();

  final StreamController<ChatMessage> chatMessageController =
      StreamController<ChatMessage>();
  final Stream<ChatMessage> messagestream =
      chatMessageController.stream.asBroadcastStream();

  when(service.chatListStream).thenAnswer((invocation) => stream);
  when(service.chatMessagesStream).thenAnswer((invocation) => messagestream);
  when(service.getDirectChatsByUserId()).thenAnswer(
    (invocation) async => streamController.add(
      ChatListTileDataModel(
        [
          ChatUser(
            firstName: 'test',
            id: '1',
            image: 'fakeHttp',
          )
        ],
        '1',
      ),
    ),
  );
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

  when(service.httpLink).thenReturn(
    HttpLink(
      'https://talawa-graphql-api.herokuapp.com/graphql',
      httpClient: MockHttpClient(),
    ),
  );

  when(service.clientToQuery()).thenAnswer((realInvocation) {
    // return GraphQLClient(
    //   cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    //   link: service.httpLink,
    // );

    return locator<GraphQLClient>();
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

GraphQLClient getAndRegisterGraphQLClient() {
  _removeRegistrationIfExists<GraphQLClient>();

  final service = MockGraphQLClient();

  // Either fill this with mock data or override this stub
  // and return null

  // when(service.query(QueryOptions(
  //   document: gql(queries.getPluginsList()),
  // ))).thenAnswer(
  //   (realInvocation) async {
  //     return QueryResult.internal(
  //       source: QueryResultSource.network,
  //       parserFn: (data) => {},
  //       data: {
  //         "getPlugins": [],
  //       },
  //     );
  //   },
  // );

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

DataBaseMutationFunctions getAndRegisterDatabaseMutationFunctions() {
  _removeRegistrationIfExists<DataBaseMutationFunctions>();
  final service = MockDataBaseMutationFunctions();
  when(service.refreshAccessToken('testtoken')).thenAnswer((_) async {
    return true;
  });
  when(service.fetchOrgById('fake_id')).thenAnswer((_) async {
    return fakeOrgInfo;
  });
  locator.registerSingleton<DataBaseMutationFunctions>(service);
  return service;
}

UserConfig getAndRegisterUserConfig() {
  _removeRegistrationIfExists<UserConfig>();
  final service = MockUserConfig();

  when(service.userLoggedIn()).thenAnswer(
    (realInvocation) => Future<bool>.value(false),
  );

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
  final StreamController<OrgInfo> streamController = StreamController();
  final Stream<OrgInfo> stream = streamController.stream.asBroadcastStream();
  when(service.currentOrgInfoController)
      .thenAnswer((invocation) => streamController);
  when(service.currentOrgInfoStream).thenAnswer((invocation) => stream);

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

MultiMediaPickerService getAndRegisterMultiMediaPickerService() {
  _removeRegistrationIfExists<MultiMediaPickerService>();
  final service = MockMultiMediaPickerService();
  locator.registerSingleton<MultiMediaPickerService>(service);
  return service;
}

ImageCropper getAndRegisterImageCropper() {
  _removeRegistrationIfExists<ImageCropper>();
  final service = MockImageCropper();
  locator.registerLazySingleton<ImageCropper>(() => service);
  return service;
}

ImagePicker getAndRegisterImagePicker() {
  _removeRegistrationIfExists<ImagePicker>();
  final service = MockImagePicker();
  locator.registerLazySingleton<ImagePicker>(() => service);
  return service;
}

TaskService getAndRegisterTaskService() {
  _removeRegistrationIfExists<TaskService>();
  final service = MockTaskService();

  when(service.tasks).thenReturn([]);

  when(
    service.createTask(
      title: anyNamed('title'),
      description: anyNamed('description'),
      deadline: anyNamed('deadline'),
      eventId: anyNamed('eventId'),
    ),
  ).thenAnswer((realInvocation) async => true);

  when(
    service.editTask(
      title: anyNamed('title'),
      description: anyNamed('description'),
      deadline: anyNamed('deadline'),
      taskId: anyNamed('taskId'),
    ),
  ).thenAnswer((realInvocation) async => true);

  locator.registerSingleton<TaskService>(service);
  return service;
}

EventService getAndRegisterEventService() {
  _removeRegistrationIfExists<EventService>();
  final service = MockEventService();

  //Mock Stream for currentOrgStream
  final StreamController<Event> streamController = StreamController();
  final Stream<Event> stream = streamController.stream.asBroadcastStream();
  when(service.eventStream).thenAnswer((invocation) => stream);
  when(service.getEvents()).thenAnswer(
    (invocation) async => streamController.add(
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
        admins: [
          User(
            id: "xzy1",
            firstName: "Test",
            lastName: "User",
          )
        ],
        isPublic: true,
        organization: OrgInfo(id: 'XYZ'),
      ),
    ),
  );
  const data = {
    'registrantsByEvent': [
      {
        '_id': 'xzy1',
        'firstName': 'Test',
        'lastName': 'User',
      }
    ],
  };
  when(service.fetchRegistrantsByEvent('1')).thenAnswer(
    (realInvocation) async => QueryResult(
      source: QueryResultSource.network,
      data: data,
      options: QueryOptions(
        document: gql(
          EventQueries().registrantsByEvent('1'),
        ),
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
  when(postMock.creator).thenReturn(
    User(
      firstName: "TestName",
    ),
  );
  when(postMock.description).thenReturn(description);
  when(postMock.comments).thenReturn([]);
  when(postMock.getPostCreatedDuration()).thenReturn(duration);
  return postMock;
}

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
    firstName: 'r',
    lastName: 'p',
    image: 'www.image.com',
  );

  final mapType = {user1.id!: true};

  when(cachedViewModel.getCurrentOrgUsersList())
      .thenAnswer((realInvocation) async {
    return [user1];
  });

  //when(cachedViewModel.selectedAdmins).thenReturn([user2]);
  when(cachedViewModel.selectedMembers).thenReturn([user1]);
  when(cachedViewModel.orgMembersList).thenReturn([user1]);

  when(cachedViewModel.memberCheckedMap).thenReturn(mapType);

  when(cachedViewModel.removeUserFromList(userId: "fakeUser1"))
      .thenAnswer((realInvocation) async {
    when(cachedViewModel.selectedMembers).thenReturn([]);
  });

  // when(cachedViewModel.removeUserFromList(userId: "fakeUser2"))
  //     .thenAnswer((realInvocation) async {
  //   when(cachedViewModel.selectedAdmins).thenReturn([]);
  // });

  locator.registerSingleton<CreateEventViewModel>(cachedViewModel);
  return cachedViewModel;
}

DirectChatViewModel getAndRegisterDirectChatViewModel() {
  _removeRegistrationIfExists<DirectChatViewModel>();
  final cachedViewModel = MockDirectChatViewModel();
  final formKey = GlobalKey<AnimatedListState>();
  final ChatUser chatUser1 =
      ChatUser(firstName: "XYZ", id: "XYZ", image: "XYZ");
  final ChatUser chatUser2 =
      ChatUser(firstName: "ABC", id: "ABC", image: "ABC");
  final ChatMessage chatMessage1 =
      ChatMessage("XYZ", chatUser1, "XYZ", chatUser2);
  final ChatMessage chatMessage2 =
      ChatMessage("XYZ", chatUser1, "Something", chatUser2);
  final Map<String, List<ChatMessage>> messages = {
    "XYZ": [chatMessage1]
  };
  final ChatListTileDataModel chatListTileDataModel1 =
      ChatListTileDataModel([chatUser1, chatUser2], "XYZ");

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
  when(cachedViewModel.chatName("XYZ")).thenAnswer((realInvocation) {});

  locator.registerSingleton<DirectChatViewModel>(cachedViewModel);
  return cachedViewModel;
}

void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterAppLanguage();
  getAndRegisterGraphQLClient();
  getAndRegisterGraphqlConfig();
  getAndRegisterUserConfig();
  getAndRegisterPostService();
  getAndRegisterEventService();
  getAndRegisterTaskService();
  getAndRegisterMultiMediaPickerService();
  getAndRegisterConnectivityService();
  getAndRegisterDatabaseMutationFunctions();
  getAndRegisterOrganizationService();
  getAndRegisterCommentService();
  getAndRegisterChatService();
  getAndRegisterImageCropper();
  getAndRegisterImagePicker();
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
  locator.unregister<ImageCropper>();
  locator.unregister<ImagePicker>();
}

void registerViewModels() {
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator
      .registerFactory<CreateEventViewModel>(() => MockCreateEventViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => SizeConfig());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => EventInfoViewModel());
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => SelectOrganizationViewModel());
  locator.registerFactory(() => CreateTaskViewModel());
  locator.registerFactory(() => ExploreTasksViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => SelectContactViewModel());
}

void unregisterViewModels() {
  locator.unregister<MainScreenViewModel>();
  locator.unregister<OrganizationFeedViewModel>();
  locator.unregister<ExploreEventsViewModel>();
  locator.unregister<CreateEventViewModel>();
  locator.unregister<AddPostViewModel>();
  locator.unregister<ProfilePageViewModel>();
  locator.unregister<LikeButtonViewModel>();
  locator.unregister<SizeConfig>();
  locator.unregister<DirectChatViewModel>();
  locator.unregister<WaitingViewModel>();
  locator.unregister<EventInfoViewModel>();
  locator.unregister<ProgressDialogViewModel>();
  locator.unregister<SelectOrganizationViewModel>();
  locator.unregister<CreateTaskViewModel>();
  locator.unregister<ExploreTasksViewModel>();
  locator.unregister<CustomDrawerViewModel>();
  locator.unregister<SelectContactViewModel>();
}
