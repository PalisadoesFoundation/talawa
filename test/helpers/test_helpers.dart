import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
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
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';

import '../service_tests/image_service_test.dart';
import '../service_tests/third_party_service_test.dart/connectivity_service_test.dart';
import '../service_tests/user_config_test.dart';
import '../views/main_screen_test.dart';
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
    MockSpec<Validator>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<MobileScannerController>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<CommentService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AppTheme>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<CreateEventViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DirectChatViewModel>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImageCropper>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ImagePicker>(onMissingStub: OnMissingStub.returnDefault),
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
  members: members,
  admins: admins,
  creatorInfo: User(
    firstName: "ravidi",
    lastName: "shaikh",
  ),
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
  when(service.navigatorKey).thenReturn(GlobalKey<NavigatorState>());
  when(service.removeAllAndPush(any, any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.pushScreen(any, arguments: anyNamed('arguments')))
      .thenAnswer((_) async {});
  when(service.popAndPushScreen(any, arguments: '-1')).thenAnswer((_) async {});
  when(service.pushDialog(any)).thenAnswer((_) async {});
  locator.registerSingleton<NavigationService>(service);
  return service;
}

/// `getAndRegisterOrganizationService` returns a mock instance of the `OrganizationService` class.
///
/// **params**:
///   None
///
/// **returns**:
/// * `OrganizationService`: A mock instance of the `OrganizationService` class.
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
          ),
        ],
        '1',
      ),
    ),
  );
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
    // final AuthLink authLink =
    //     AuthLink(getToken: () async => 'Bearer ${GraphqlConfig.token}');
    // final Link finalAuthLink = authLink.concat(service.httpLink);
    // return GraphQLClient(
    //   cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    //   link: finalAuthLink,
    // );
    return locator<GraphQLClient>();
  });

  when(service.getToken()).thenAnswer((_) async => "sample_token");

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

  when(service.query(any)).thenAnswer(
    (realInvocation) async {
      if (locator.isRegistered<GraphQLClient>()) {
        return Future.value(
          QueryResult<Map<String, dynamic>>(
            source: QueryResultSource.network,
            data: {
              "getPlugins": null,
            },
            options: QueryOptions(
              document: gql(queries.getPluginsList()),
            ),
          ),
        );
      } else {
        return Future.value(
          QueryResult<Map<String, dynamic>>(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(queries.getPluginsList()),
            ),
          ),
        );
      }
    },
  );

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
  when(service.fetchOrgById('fake_id')).thenAnswer((_) async {
    return fakeOrgInfo;
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
      firstName: 'john',
      lastName: 'snow',
    ),
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
          userRegistrationRequired: false,
          creatorInfo: User(firstName: 'test', lastName: '1'),
        ),
        OrgInfo(
          id: '4',
          name: 'test org 4',
          userRegistrationRequired: true,
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
          userRegistrationRequired: true,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        ),
        OrgInfo(
          id: '2',
          name: 'test org',
          userRegistrationRequired: true,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        ),
      ],
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
  locator.registerSingleton<ConnectivityService>(service);
  // when(service.)
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
    firstName: 'r',
    lastName: 'p',
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
      .thenAnswer((realInvocation) async {
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
  final ChatMessage chatMessage1 =
      ChatMessage("XYZ", chatUser1, "XYZ", chatUser2);
  final ChatMessage chatMessage2 =
      ChatMessage("XYZ", chatUser1, "Something", chatUser2);
  final Map<String, List<ChatMessage>> messages = {
    "XYZ": [chatMessage1],
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
}

/// `unregisterServices` unregisters all the services required for the test.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<GraphqlConfig>();
  locator.unregister<UserConfig>();
  locator.unregister<PostService>();
  locator.unregister<EventService>();
  locator.unregister<MultiMediaPickerService>();
  locator.unregister<Connectivity>();
  locator.unregister<ConnectivityService>();
  locator.unregister<DataBaseMutationFunctions>();
  locator.unregister<OrganizationService>();
  locator.unregister<CommentService>();
  locator.unregister<ImageCropper>();
  locator.unregister<ImagePicker>();
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
  locator.registerFactory(() => LikeButtonViewModel());
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
  locator.unregister<LikeButtonViewModel>();
  locator.unregister<SizeConfig>();
  locator.unregister<DirectChatViewModel>();
  locator.unregister<WaitingViewModel>();
  locator.unregister<EventInfoViewModel>();
  locator.unregister<ProgressDialogViewModel>();
  locator.unregister<SelectOrganizationViewModel>();
  locator.unregister<CustomDrawerViewModel>();
  locator.unregister<SelectContactViewModel>();
}
