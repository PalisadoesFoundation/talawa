// Mocks generated by Mockito 5.0.14 from annotations
// in talawa/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:io' as _i14;
import 'dart:ui' as _i9;

import 'package:connectivity_plus/connectivity_plus.dart' as _i20;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart'
    as _i21;
import 'package:flutter/material.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:mockito/mockito.dart' as _i2;
import 'package:talawa/enums/enums.dart' as _i19;
import 'package:talawa/models/events/event_model.dart' as _i16;
import 'package:talawa/models/organization/org_info.dart' as _i5;
import 'package:talawa/models/post/post_model.dart' as _i12;
import 'package:talawa/models/user/user_info.dart' as _i6;
import 'package:talawa/services/database_mutation_functions.dart' as _i8;
import 'package:talawa/services/event_service.dart' as _i15;
import 'package:talawa/services/graphql_config.dart' as _i10;
import 'package:talawa/services/navigation_service.dart' as _i7;
import 'package:talawa/services/post_service.dart' as _i11;
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart'
    as _i13;
import 'package:talawa/services/user_config.dart' as _i17;
import 'package:talawa/view_model/lang_view_model.dart' as _i18;
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart'
    as _i22;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeGlobalKey_0<T extends _i1.State<_i1.StatefulWidget>> extends _i2.Fake
    implements _i1.GlobalKey<T> {}

class _FakeHttpLink_1 extends _i2.Fake implements _i3.HttpLink {}

class _FakeGraphQLClient_2 extends _i2.Fake implements _i3.GraphQLClient {}

class _FakeStreamController_3<T> extends _i2.Fake
    implements _i4.StreamController<T> {}

class _FakeOrgInfo_4 extends _i2.Fake implements _i5.OrgInfo {}

class _FakeUser_5 extends _i2.Fake implements _i6.User {}

class _FakeNavigationService_6 extends _i2.Fake
    implements _i7.NavigationService {}

class _FakeDataBaseMutationFunctions_7 extends _i2.Fake
    implements _i8.DataBaseMutationFunctions {}

class _FakeLocale_8 extends _i2.Fake implements _i9.Locale {}

class _FakeTextEditingController_9 extends _i2.Fake
    implements _i1.TextEditingController {}

class _FakeFocusNode_10 extends _i2.Fake implements _i1.FocusNode {
  @override
  String toString({_i1.DiagnosticLevel? minLevel = _i1.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i2.Mock implements _i7.NavigationService {
  @override
  _i1.GlobalKey<_i1.NavigatorState> get navigatorKey =>
      (super.noSuchMethod(Invocation.getter(#navigatorKey),
              returnValue: _FakeGlobalKey_0<_i1.NavigatorState>())
          as _i1.GlobalKey<_i1.NavigatorState>);
  @override
  set navigatorKey(_i1.GlobalKey<_i1.NavigatorState>? _navigatorKey) =>
      super.noSuchMethod(Invocation.setter(#navigatorKey, _navigatorKey),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic> pushScreen(String? routeName, {dynamic arguments}) =>
      (super.noSuchMethod(
          Invocation.method(#pushScreen, [routeName], {#arguments: arguments}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> popAndPushScreen(String? routeName,
          {dynamic arguments}) =>
      (super.noSuchMethod(
          Invocation.method(
              #popAndPushScreen, [routeName], {#arguments: arguments}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> pushReplacementScreen(String? routeName,
          {dynamic arguments}) =>
      (super.noSuchMethod(
          Invocation.method(
              #pushReplacementScreen, [routeName], {#arguments: arguments}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  void fromInviteLink(List<String>? routeNames, List<dynamic>? arguments) =>
      super.noSuchMethod(
          Invocation.method(#fromInviteLink, [routeNames, arguments]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic> removeAllAndPush(String? routeName, String? tillRoute,
          {dynamic arguments}) =>
      (super.noSuchMethod(
          Invocation.method(#removeAllAndPush, [routeName, tillRoute],
              {#arguments: arguments}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  void pushDialog(_i1.Widget? dialog) =>
      super.noSuchMethod(Invocation.method(#pushDialog, [dialog]),
          returnValueForMissingStub: null);
  @override
  void showSnackBar(String? message,
          {Duration? duration = const Duration(seconds: 2)}) =>
      super.noSuchMethod(
          Invocation.method(#showSnackBar, [message], {#duration: duration}),
          returnValueForMissingStub: null);
  @override
  void pop() => super.noSuchMethod(Invocation.method(#pop, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GraphqlConfig].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphqlConfig extends _i2.Mock implements _i10.GraphqlConfig {
  @override
  _i3.HttpLink get httpLink => (super.noSuchMethod(Invocation.getter(#httpLink),
      returnValue: _FakeHttpLink_1()) as _i3.HttpLink);
  @override
  set httpLink(_i3.HttpLink? _httpLink) =>
      super.noSuchMethod(Invocation.setter(#httpLink, _httpLink),
          returnValueForMissingStub: null);
  @override
  set displayImgRoute(String? _displayImgRoute) =>
      super.noSuchMethod(Invocation.setter(#displayImgRoute, _displayImgRoute),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic> getToken() =>
      (super.noSuchMethod(Invocation.method(#getToken, []),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i3.GraphQLClient clientToQuery() =>
      (super.noSuchMethod(Invocation.method(#clientToQuery, []),
          returnValue: _FakeGraphQLClient_2()) as _i3.GraphQLClient);
  @override
  _i3.GraphQLClient authClient() =>
      (super.noSuchMethod(Invocation.method(#authClient, []),
          returnValue: _FakeGraphQLClient_2()) as _i3.GraphQLClient);
  @override
  String toString() => super.toString();
}

/// A class which mocks [PostService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostService extends _i2.Mock implements _i11.PostService {
  @override
  _i4.Stream<List<_i12.Post>> get postStream =>
      (super.noSuchMethod(Invocation.getter(#postStream),
              returnValue: Stream<List<_i12.Post>>.empty())
          as _i4.Stream<List<_i12.Post>>);
  @override
  _i4.Stream<_i12.Post> get updatedPostStream =>
      (super.noSuchMethod(Invocation.getter(#updatedPostStream),
          returnValue: Stream<_i12.Post>.empty()) as _i4.Stream<_i12.Post>);
  @override
  void setOrgStreamSubscription() =>
      super.noSuchMethod(Invocation.method(#setOrgStreamSubscription, []),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> getPosts() =>
      (super.noSuchMethod(Invocation.method(#getPosts, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> addLike(String? postID) =>
      (super.noSuchMethod(Invocation.method(#addLike, [postID]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> removeLike(String? postID) =>
      (super.noSuchMethod(Invocation.method(#removeLike, [postID]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void addCommentLocally(String? postID) =>
      super.noSuchMethod(Invocation.method(#addCommentLocally, [postID]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MultiMediaPickerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMultiMediaPickerService extends _i2.Mock
    implements _i13.MultiMediaPickerService {
  @override
  _i4.Stream<dynamic> get fileStream =>
      (super.noSuchMethod(Invocation.getter(#fileStream),
          returnValue: Stream<dynamic>.empty()) as _i4.Stream<dynamic>);
  @override
  _i4.Future<_i14.File?> getPhotoFromGallery({bool? camera = false}) =>
      (super.noSuchMethod(
          Invocation.method(#getPhotoFromGallery, [], {#camera: camera}),
          returnValue: Future<_i14.File?>.value()) as _i4.Future<_i14.File?>);
  @override
  _i4.Future<_i14.File?> cropImage({_i14.File? imageFile}) => (super
      .noSuchMethod(Invocation.method(#cropImage, [], {#imageFile: imageFile}),
          returnValue: Future<_i14.File?>.value()) as _i4.Future<_i14.File?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [EventService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventService extends _i2.Mock implements _i15.EventService {
  @override
  _i4.Stream<_i16.Event> get eventStream =>
      (super.noSuchMethod(Invocation.getter(#eventStream),
          returnValue: Stream<_i16.Event>.empty()) as _i4.Stream<_i16.Event>);
  @override
  void setOrgStreamSubscription() =>
      super.noSuchMethod(Invocation.method(#setOrgStreamSubscription, []),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> getEvents() =>
      (super.noSuchMethod(Invocation.method(#getEvents, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> registerForAnEvent(String? eventId) =>
      (super.noSuchMethod(Invocation.method(#registerForAnEvent, [eventId]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> deleteEvent(String? eventId) =>
      (super.noSuchMethod(Invocation.method(#deleteEvent, [eventId]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<void> editEvent(
          {String? eventId, Map<String, dynamic>? variables}) =>
      (super.noSuchMethod(
          Invocation.method(
              #editEvent, [], {#eventId: eventId, #variables: variables}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UserConfig].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserConfig extends _i2.Mock implements _i17.UserConfig {
  @override
  _i4.Stream<_i5.OrgInfo> get currentOrfInfoStream =>
      (super.noSuchMethod(Invocation.getter(#currentOrfInfoStream),
          returnValue: Stream<_i5.OrgInfo>.empty()) as _i4.Stream<_i5.OrgInfo>);
  @override
  _i4.StreamController<_i5.OrgInfo> get currentOrgInfoController =>
      (super.noSuchMethod(Invocation.getter(#currentOrgInfoController),
              returnValue: _FakeStreamController_3<_i5.OrgInfo>())
          as _i4.StreamController<_i5.OrgInfo>);
  @override
  _i5.OrgInfo get currentOrg =>
      (super.noSuchMethod(Invocation.getter(#currentOrg),
          returnValue: _FakeOrgInfo_4()) as _i5.OrgInfo);
  @override
  String get currentOrgName =>
      (super.noSuchMethod(Invocation.getter(#currentOrgName), returnValue: '')
          as String);
  @override
  set currentOrg(_i5.OrgInfo? org) =>
      super.noSuchMethod(Invocation.setter(#currentOrg, org),
          returnValueForMissingStub: null);
  @override
  _i6.User get currentUser =>
      (super.noSuchMethod(Invocation.getter(#currentUser),
          returnValue: _FakeUser_5()) as _i6.User);
  @override
  set currentUser(_i6.User? user) =>
      super.noSuchMethod(Invocation.setter(#currentUser, user),
          returnValueForMissingStub: null);
  @override
  void initialiseStream() =>
      super.noSuchMethod(Invocation.method(#initialiseStream, []),
          returnValueForMissingStub: null);
  @override
  _i4.Future<bool> userLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#userLoggedIn, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<dynamic> updateUserJoinedOrg(List<_i5.OrgInfo>? orgDetails) =>
      (super.noSuchMethod(Invocation.method(#updateUserJoinedOrg, [orgDetails]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> updateUserCreatedOrg(List<_i5.OrgInfo>? orgDetails) =>
      (super.noSuchMethod(
          Invocation.method(#updateUserCreatedOrg, [orgDetails]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> updateUserMemberRequestOrg(
          List<_i5.OrgInfo>? orgDetails) =>
      (super.noSuchMethod(
          Invocation.method(#updateUserMemberRequestOrg, [orgDetails]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> updateUserAdminOrg(List<_i5.OrgInfo>? orgDetails) =>
      (super.noSuchMethod(Invocation.method(#updateUserAdminOrg, [orgDetails]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> updateAccessToken(
          {String? accessToken, String? refreshToken}) =>
      (super.noSuchMethod(
          Invocation.method(#updateAccessToken, [],
              {#accessToken: accessToken, #refreshToken: refreshToken}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<bool> updateUser(_i6.User? updatedUserDetails) =>
      (super.noSuchMethod(Invocation.method(#updateUser, [updatedUserDetails]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  dynamic saveCurrentOrgInHive(_i5.OrgInfo? saveOrgAsCurrent) =>
      super.noSuchMethod(
          Invocation.method(#saveCurrentOrgInHive, [saveOrgAsCurrent]));
  @override
  String toString() => super.toString();
}

/// A class which mocks [AppLanguage].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppLanguage extends _i2.Mock implements _i18.AppLanguage {
  @override
  bool get isTest =>
      (super.noSuchMethod(Invocation.getter(#isTest), returnValue: false)
          as bool);
  @override
  _i7.NavigationService get navigationService =>
      (super.noSuchMethod(Invocation.getter(#navigationService),
          returnValue: _FakeNavigationService_6()) as _i7.NavigationService);
  @override
  _i8.DataBaseMutationFunctions get databaseFunctions =>
      (super.noSuchMethod(Invocation.getter(#databaseFunctions),
              returnValue: _FakeDataBaseMutationFunctions_7())
          as _i8.DataBaseMutationFunctions);
  @override
  _i9.Locale get appLocal => (super.noSuchMethod(Invocation.getter(#appLocal),
      returnValue: _FakeLocale_8()) as _i9.Locale);
  @override
  _i19.ViewState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i19.ViewState.idle) as _i19.ViewState);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i4.Future<void> initialize() =>
      (super.noSuchMethod(Invocation.method(#initialize, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> fetchLocale() =>
      (super.noSuchMethod(Invocation.method(#fetchLocale, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> changeLanguage(_i9.Locale? type) =>
      (super.noSuchMethod(Invocation.method(#changeLanguage, [type]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> dbLanguageUpdate() =>
      (super.noSuchMethod(Invocation.method(#dbLanguageUpdate, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> appLanguageQuery() =>
      (super.noSuchMethod(Invocation.method(#appLanguageQuery, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> userLanguageQuery(String? userId) =>
      (super.noSuchMethod(Invocation.method(#userLanguageQuery, [userId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void setState(_i19.ViewState? viewState) =>
      super.noSuchMethod(Invocation.method(#setState, [viewState]),
          returnValueForMissingStub: null);
  @override
  void addListener(_i9.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i9.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i2.Mock implements _i20.Connectivity {
  @override
  _i4.Stream<_i21.ConnectivityResult> get onConnectivityChanged =>
      (super.noSuchMethod(Invocation.getter(#onConnectivityChanged),
              returnValue: Stream<_i21.ConnectivityResult>.empty())
          as _i4.Stream<_i21.ConnectivityResult>);
  @override
  _i4.Future<_i21.ConnectivityResult> checkConnectivity() =>
      (super.noSuchMethod(Invocation.method(#checkConnectivity, []),
              returnValue: Future<_i21.ConnectivityResult>.value(
                  _i21.ConnectivityResult.wifi))
          as _i4.Future<_i21.ConnectivityResult>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SignupDetailsViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupDetailsViewModel extends _i2.Mock
    implements _i22.SignupDetailsViewModel {
  @override
  _i1.GlobalKey<_i1.FormState> get formKey =>
      (super.noSuchMethod(Invocation.getter(#formKey),
              returnValue: _FakeGlobalKey_0<_i1.FormState>())
          as _i1.GlobalKey<_i1.FormState>);
  @override
  List<Map<String, dynamic>> get greeting =>
      (super.noSuchMethod(Invocation.getter(#greeting),
          returnValue: <Map<String, dynamic>>[]) as List<Map<String, dynamic>>);
  @override
  set greeting(List<Map<String, dynamic>>? _greeting) =>
      super.noSuchMethod(Invocation.setter(#greeting, _greeting),
          returnValueForMissingStub: null);
  @override
  _i5.OrgInfo get selectedOrganization =>
      (super.noSuchMethod(Invocation.getter(#selectedOrganization),
          returnValue: _FakeOrgInfo_4()) as _i5.OrgInfo);
  @override
  set selectedOrganization(_i5.OrgInfo? _selectedOrganization) =>
      super.noSuchMethod(
          Invocation.setter(#selectedOrganization, _selectedOrganization),
          returnValueForMissingStub: null);
  @override
  _i1.TextEditingController get confirmPassword =>
      (super.noSuchMethod(Invocation.getter(#confirmPassword),
              returnValue: _FakeTextEditingController_9())
          as _i1.TextEditingController);
  @override
  set confirmPassword(_i1.TextEditingController? _confirmPassword) =>
      super.noSuchMethod(Invocation.setter(#confirmPassword, _confirmPassword),
          returnValueForMissingStub: null);
  @override
  _i1.TextEditingController get firstName =>
      (super.noSuchMethod(Invocation.getter(#firstName),
              returnValue: _FakeTextEditingController_9())
          as _i1.TextEditingController);
  @override
  set firstName(_i1.TextEditingController? _firstName) =>
      super.noSuchMethod(Invocation.setter(#firstName, _firstName),
          returnValueForMissingStub: null);
  @override
  _i1.TextEditingController get lastName =>
      (super.noSuchMethod(Invocation.getter(#lastName),
              returnValue: _FakeTextEditingController_9())
          as _i1.TextEditingController);
  @override
  set lastName(_i1.TextEditingController? _lastName) =>
      super.noSuchMethod(Invocation.setter(#lastName, _lastName),
          returnValueForMissingStub: null);
  @override
  _i1.TextEditingController get password =>
      (super.noSuchMethod(Invocation.getter(#password),
              returnValue: _FakeTextEditingController_9())
          as _i1.TextEditingController);
  @override
  set password(_i1.TextEditingController? _password) =>
      super.noSuchMethod(Invocation.setter(#password, _password),
          returnValueForMissingStub: null);
  @override
  _i1.TextEditingController get email =>
      (super.noSuchMethod(Invocation.getter(#email),
              returnValue: _FakeTextEditingController_9())
          as _i1.TextEditingController);
  @override
  set email(_i1.TextEditingController? _email) =>
      super.noSuchMethod(Invocation.setter(#email, _email),
          returnValueForMissingStub: null);
  @override
  _i1.AutovalidateMode get validate =>
      (super.noSuchMethod(Invocation.getter(#validate),
          returnValue: _i1.AutovalidateMode.disabled) as _i1.AutovalidateMode);
  @override
  set validate(_i1.AutovalidateMode? _validate) =>
      super.noSuchMethod(Invocation.setter(#validate, _validate),
          returnValueForMissingStub: null);
  @override
  _i1.FocusNode get confirmFocus =>
      (super.noSuchMethod(Invocation.getter(#confirmFocus),
          returnValue: _FakeFocusNode_10()) as _i1.FocusNode);
  @override
  set confirmFocus(_i1.FocusNode? _confirmFocus) =>
      super.noSuchMethod(Invocation.setter(#confirmFocus, _confirmFocus),
          returnValueForMissingStub: null);
  @override
  bool get hidePassword =>
      (super.noSuchMethod(Invocation.getter(#hidePassword), returnValue: false)
          as bool);
  @override
  set hidePassword(bool? _hidePassword) =>
      super.noSuchMethod(Invocation.setter(#hidePassword, _hidePassword),
          returnValueForMissingStub: null);
  @override
  _i19.ViewState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i19.ViewState.idle) as _i19.ViewState);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  dynamic initialise(_i5.OrgInfo? org) =>
      super.noSuchMethod(Invocation.method(#initialise, [org]));
  @override
  void setState(_i19.ViewState? viewState) =>
      super.noSuchMethod(Invocation.method(#setState, [viewState]),
          returnValueForMissingStub: null);
  @override
  void addListener(_i9.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i9.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Post].
///
/// See the documentation for Mockito's code generation for more information.
class MockPost extends _i2.Mock implements _i12.Post {
  @override
  String get sId =>
      (super.noSuchMethod(Invocation.getter(#sId), returnValue: '') as String);
  @override
  set sId(String? _sId) => super.noSuchMethod(Invocation.setter(#sId, _sId),
      returnValueForMissingStub: null);
  @override
  set description(String? _description) =>
      super.noSuchMethod(Invocation.setter(#description, _description),
          returnValueForMissingStub: null);
  @override
  set createdAt(DateTime? _createdAt) =>
      super.noSuchMethod(Invocation.setter(#createdAt, _createdAt),
          returnValueForMissingStub: null);
  @override
  set imageUrl(String? _imageUrl) =>
      super.noSuchMethod(Invocation.setter(#imageUrl, _imageUrl),
          returnValueForMissingStub: null);
  @override
  set videoUrl(String? _videoUrl) =>
      super.noSuchMethod(Invocation.setter(#videoUrl, _videoUrl),
          returnValueForMissingStub: null);
  @override
  set creator(_i6.User? _creator) =>
      super.noSuchMethod(Invocation.setter(#creator, _creator),
          returnValueForMissingStub: null);
  @override
  set organization(_i5.OrgInfo? _organization) =>
      super.noSuchMethod(Invocation.setter(#organization, _organization),
          returnValueForMissingStub: null);
  @override
  set likedBy(List<_i12.LikedBy>? _likedBy) =>
      super.noSuchMethod(Invocation.setter(#likedBy, _likedBy),
          returnValueForMissingStub: null);
  @override
  set comments(List<_i12.Comments>? _comments) =>
      super.noSuchMethod(Invocation.setter(#comments, _comments),
          returnValueForMissingStub: null);
  @override
  String getPostCreatedDuration() =>
      (super.noSuchMethod(Invocation.method(#getPostCreatedDuration, []),
          returnValue: '') as String);
  @override
  String toString() => super.toString();
}
