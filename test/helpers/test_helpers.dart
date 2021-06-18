import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<GraphqlConfig>(returnNullOnMissingStub: true),
  MockSpec<PostService>(returnNullOnMissingStub: true),
  MockSpec<EventService>(returnNullOnMissingStub: true),
  MockSpec<UserConfig>(returnNullOnMissingStub: true),
])
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  when(service.navigatorKey).thenReturn(GlobalKey<NavigatorState>());
  locator.registerSingleton<NavigationService>(service);
  return service;
}

GraphqlConfig getAndRegisterGraphqlConfig() {
  _removeRegistrationIfExists<GraphqlConfig>();
  final service = MockGraphqlConfig();
  locator.registerSingleton<GraphqlConfig>(service);
  return service;
}

UserConfig getAndRegisterUserConfig() {
  _removeRegistrationIfExists<UserConfig>();
  final service = MockUserConfig();

  //Mock Data for current organizaiton.
  when(service.currentOrg).thenReturn(OrgInfo(
    id: "XYZ",
    name: "Organization Name",
  ));

  //Mock Stream for currentOrgStream
  final StreamController<OrgInfo> _streamController = StreamController();
  final Stream<OrgInfo> _stream = _streamController.stream.asBroadcastStream();
  when(service.currentOrfInfoStream).thenAnswer((invocation) => _stream);

  //Mkock current user
  when(service.currentUser).thenReturn(User(
      id: "xzy1",
      firstName: "Test",
      lastName: "User",
      email: "testuser@gmail.com"));

  locator.registerSingleton<UserConfig>(service);
  return service;
}

PostService getAndRegisterPostService() {
  _removeRegistrationIfExists<PostService>();
  final service = MockPostService();

  //Mock Stream for currentOrgStream
  final StreamController<Post> _streamController = StreamController();
  final Stream<Post> _stream = _streamController.stream.asBroadcastStream();
  when(service.postStream).thenAnswer((invocation) => _stream);

  locator.registerSingleton<PostService>(service);
  return service;
}

EventService getAndRegisterEventService() {
  _removeRegistrationIfExists<EventService>();
  final service = MockEventService();

  //Mock Stream for currentOrgStream
  final StreamController<Event> _streamController = StreamController();
  final Stream<Event> _stream = _streamController.stream.asBroadcastStream();
  when(service.eventStream).thenAnswer((invocation) => _stream);

  locator.registerSingleton<EventService>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterGraphqlConfig();
  getAndRegisterUserConfig();
  getAndRegisterPostService();
  getAndRegisterEventService();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<GraphqlConfig>();
  locator.unregister<UserConfig>();
  locator.unregister<PostService>();
  locator.unregister<EventService>();
}

void registerViewModels() {
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => SizeConfig());
}

void unregisterViewModels() {
  locator.unregister<MainScreenViewModel>();
  locator.unregister<OrganizationFeedViewModel>();
  locator.unregister<ExploreEventsViewModel>();
  locator.unregister<ProfilePageViewModel>();
  locator.unregister<LikeButtonViewModel>();
  locator.unregister<SizeConfig>();
}
