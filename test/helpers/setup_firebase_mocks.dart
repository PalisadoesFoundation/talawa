// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

// ignore_for_file: return_of_invalid_type

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final kMockMessagingPlatform = MockFirebaseMessaging();

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}

void setupFirebaseMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const firebaseChannel = MethodChannel(
    'plugins.flutter.io/firebase_core',
  );

  firebaseChannel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    return null;
  });

  when(kMockMessagingPlatform.delegateFor(app: anyNamed('app')))
      .thenReturn(kMockMessagingPlatform);
  when(
    kMockMessagingPlatform.setInitialValues(
      isAutoInitEnabled: anyNamed('isAutoInitEnabled'),
    ),
  ).thenReturn(kMockMessagingPlatform);
}

class MockFirebaseMessaging extends Mock
    with MockPlatformInterfaceMixin
    implements FirebaseMessagingPlatform {
  MockFirebaseMessaging() {
    TestFirebaseMessagingPlatform();
  }

  @override
  bool get isAutoInitEnabled {
    return super.noSuchMethod(
      Invocation.getter(#isAutoInitEnabled),
      returnValue: true,
      returnValueForMissingStub: true,
    );
  }

  @override
  FirebaseMessagingPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(#delegateFor, [], {#app: app}),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    );
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        [],
        {#isAutoInitEnabled: isAutoInitEnabled},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    );
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return super.noSuchMethod(
      Invocation.method(#getInitialMessage, []),
      returnValue: neverEndingFuture<RemoteMessage>(),
      returnValueForMissingStub: neverEndingFuture<RemoteMessage>(),
    );
  }

  @override
  Future<void> deleteToken() {
    return super.noSuchMethod(
      Invocation.method(#deleteToken, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    );
  }

  @override
  Future<String?> getAPNSToken() {
    return super.noSuchMethod(
      Invocation.method(#getAPNSToken, []),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    );
  }

  @override
  Future<String> getToken({String? vapidKey}) {
    return super.noSuchMethod(
      Invocation.method(#getToken, [], {#vapidKey: vapidKey}),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    );
  }

  @override
  Future<void> setAutoInitEnabled(bool? enabled) {
    return super.noSuchMethod(
      Invocation.method(#setAutoInitEnabled, [enabled]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    );
  }

  @override
  Stream<String> get onTokenRefresh {
    return super.noSuchMethod(
      Invocation.getter(#onTokenRefresh),
      returnValue: const Stream<String>.empty(),
      returnValueForMissingStub: const Stream<String>.empty(),
    );
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#requestPermission, [], {
        #alert: alert,
        #announcement: announcement,
        #badge: badge,
        #carPlay: carPlay,
        #criticalAlert: criticalAlert,
        #provisional: provisional,
        #sound: sound
      }),
      returnValue: neverEndingFuture<NotificationSettings>(),
      returnValueForMissingStub: neverEndingFuture<NotificationSettings>(),
    );
  }

  @override
  Future<void> subscribeToTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#subscribeToTopic, [topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    );
  }

  @override
  Future<void> unsubscribeFromTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#unsubscribeFromTopic, [topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    );
  }
}

class TestFirebaseMessagingPlatform extends FirebaseMessagingPlatform {
  TestFirebaseMessagingPlatform() : super();
}
