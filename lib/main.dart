import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as fs;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/quick_actions.dart';
import 'package:talawa/firebase_options.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/plugins/fetch_plugin_list.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// Define a top-level named handler which background/terminated messages will call.
///
/// To verify things are working, check out the native platform logs.
/// **params**:
/// * `message`: incoming messsage.
///
/// **returns**:
/// * `Future<void>`: promise that will be fulfilled message background activities are successful.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  final Directory dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await setUpFirebaseKeys();
  await setUpFirebase();
}

/// Initializes the firebase in the app according to the userplatform (android/iOS).
///
/// **params**:
///   None
///
/// **returns**:
/// * `Future<void>`: promise that will be fulfilled Firebase is setted up in app.
Future<void> setUpFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidFirebaseOptions,
      iosFirebaseOptions,
    ),
  );
}

/// HashMap of Firebase options for android.
late Map<String, dynamic> androidFirebaseOptions;

/// HashMap of Firebase options for android.
late Map<String, dynamic> iosFirebaseOptions;

/// Create a [AndroidNotificationChannel] for heads up notifications.
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

/// First function to initialize the application, invoked automatically.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Future<void>`: resolves if the application was successfully initialized.
Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Create an Android Notification Channel.
    // We use this channel in the `AndroidManifest.xml` file to override the
    // default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  final Directory dir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');

  await Hive.openBox('pluginBox');
  await Hive.openBox('url');

  final urlBox = await Hive.openBox('url');

  try {
    if (urlBox.get('url') != null) {
      await setUpFirebaseKeys();

      await setUpFirebase();
      await setUpFirebaseMessaging();
    }
  } catch (e) {
    print("Firebase not working");
  }

  setupLocator();
  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}

/// Initializes the firebase keys in the app according to the userplatform (android/iOS).
///
/// **params**:
///   None
///
/// **returns**:
/// * `Future<void>`: promise that will be fulfilled Firebase keys are setted up.
Future<void> setUpFirebaseKeys() async {
  final androidFirebaseOptionsBox =
      await Hive.openBox('androidFirebaseOptions');
  final androidFirebaseOptionsMap = androidFirebaseOptionsBox
      .get('androidFirebaseOptions') as Map<dynamic, dynamic>?;

  final iosFirebaseOptionsBox = await Hive.openBox('iosFirebaseOptions');
  final iosFirebaseOptionsMap =
      iosFirebaseOptionsBox.get('iosFirebaseOptions') as Map<dynamic, dynamic>?;
  if (androidFirebaseOptionsMap != null) {
    androidFirebaseOptions = androidFirebaseOptionsMap.map((key, value) {
      return MapEntry(key.toString(), value);
    });
  }
  if (iosFirebaseOptionsMap != null) {
    iosFirebaseOptions = iosFirebaseOptionsMap.map((key, value) {
      return MapEntry(key.toString(), value);
    });
  }
}

/// Main widget that sets up the quick actions, internationalization, routing , notifications.
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

/// The _MyAppState class extends the State.
///
/// All the coding related to state updation is inside this class.
class _MyAppState extends State<MyApp> {
  /// Initializing the Quickactions to enable them on long press of app icon in device.
  final quickActions = const QuickActions();

  /// Initializing the mainScreen window to 1 to show the events by default after app in opened.
  late int mainScreenQuickActionindex = 0;
  @override
  void initState() {
    // initState() is a method that is called once when the Stateful Widget
    // is inserted in the widget tree. We generally override this method if
    // we need to do some sort of initialization work like
    // registering a listener because, unlike build(), this method is called once.
    super.initState();

    initQuickActions();

    final urlBox = Hive.box('url');
    if (urlBox.get('url') != null) {
      FetchPluginList();
    }

    fs.SystemChrome.setPreferredOrientations(
      [
        fs.DeviceOrientation.portraitUp,
        fs.DeviceOrientation.portraitDown,
      ],
    );
  }

  /// It allows to manage and interact with the application’s home screen quick actions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

// ignore: avoid_void_async
  void initQuickActions() async {
    final bool userLoggedIn = await userConfig.userLoggedIn();
    if (userLoggedIn &&
        userConfig.currentUser.joinedOrganizations!.isNotEmpty) {
      quickActions.initialize((type) {
        if (type == ShortCutMenu.eventAction.type) {
          mainScreenQuickActionindex = 1;
        } else if (type == ShortCutMenu.feedAction.type) {
          mainScreenQuickActionindex = 0;
        } else if (type == ShortCutMenu.chatAction.type) {
          mainScreenQuickActionindex = 3;
        }
      });

      /// Registering quick action list in the app.zx
      quickActions.setShortcutItems(ShortCutMenu.quickActionsList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return BaseView<AppTheme>(
          onModelReady: (model) => model.initialize(),
          builder: (context, model, child) {
            return MaterialApp(
              locale: langModel.appLocal,
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('es', 'ES'),
                const Locale('fr', 'FR'),
                const Locale('hi', 'IN'),
                const Locale('zh', 'CN'),
                const Locale('de', 'DE'),
                const Locale('ja', 'JP'),
                const Locale('pt', 'PT'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              title: 'Talawa',
              theme: Provider.of<AppTheme>(context).isdarkTheme
                  ? TalawaTheme.darkTheme
                  : TalawaTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationService.navigatorKey,
              onGenerateRoute: router.generateRoute,
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) {
                if (locale == null) {
                  debugPrint("*language locale is null!!!");
                  return supportedLocales.first;
                }
                for (final Locale supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode ||
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              initialRoute: '/',
              onGenerateInitialRoutes: (String initialRouteName) {
                return [
                  router.generateRoute(
                    RouteSettings(
                      name: '/',
                      arguments: mainScreenQuickActionindex,
                    ),
                  ),
                ];
              },
            );
          },
        );
      },
    );
  }
}

/// PageView is a scrollable list that works page by page.
///
/// DemoPageView is demo PageView of Talawa Mobile App.
class DemoPageView extends StatelessWidget {
  const DemoPageView({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FetchPluginList();
    return BaseView<DemoViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.strictTranslate('Demo Page')),
        ),
        body: Container(
          child: Text(model.title),
        ),
      ),
    );
  }
}

/// ViewModel uses property-based data binding to establish a connection.
///
/// between the ViewModel and the View, and drives the View changes
/// through the ViewModel. DemoViewModel is the ViewModel for DemoPageView.
class DemoViewModel extends BaseModel {
  /// Demo title to be used.
  final String _title = "Title from the viewMode GSoC branch";

  /// Getter function of the title.
  ///
  /// params:
  /// None
  /// returns:
  /// * `String`: title  of the model
  String get title => _title;
}

/// Set up firebase instance, enbables messaging,listens to icoming messages.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Future<void>`: promise that will be fulfilled Firebase is setted up.
Future<void> setUpFirebaseMessaging() async {
  /// Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Update the iOS foreground notification presentation options to allow heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? message) {});

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
}
