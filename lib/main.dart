import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
import 'package:talawa/router.dart' as router;
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
  Map<String, dynamic> androidFirebaseOptions,
  Map<String, dynamic> iosFirebaseOptions,
) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await setUpFirebase(
    androidFirebaseOptions,
    iosFirebaseOptions,
  );
}

Future<void> setUpFirebase(
  Map<String, dynamic> androidFirebaseOptions,
  Map<String, dynamic> iosFirebaseOptions,
) async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(
    androidFirebaseOptions,
    iosFirebaseOptions,
  ));
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

/// This is the main function
Future<void> main() async {
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

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
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
  final urlBox = await Hive.openBox('url');

  if (urlBox.get('url') != null) {
    final androidFirebaseOptionsBox =
        await Hive.openBox('androidFirebaseOptions');
    final androidFirebaseOptions = androidFirebaseOptionsBox
        .get('androidFirebaseOptions') as Map<dynamic, dynamic>;
    final androidFirebaseOptionsMap = androidFirebaseOptions.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    final iosFirebaseOptionsBox = await Hive.openBox('iosFirebaseOptions');
    final iosFirebaseOptions = iosFirebaseOptionsBox.get('iosFirebaseOptions')
        as Map<dynamic, dynamic>;
    final iosFirebaseOptionsMap = iosFirebaseOptions.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    await setUpFirebase(androidFirebaseOptionsMap, iosFirebaseOptionsMap);
    await setUpFirebaseMessaging(
        androidFirebaseOptionsMap, iosFirebaseOptionsMap);
  }
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final quickActions = const QuickActions();
  late int mainScreenQuickActionindex = 0;
  @override
  void initState() {
    // TODO: implement initState
    initQuickActions();
    super.initState();
  }

  initQuickActions() async {
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

class DemoPageView extends StatelessWidget {
  const DemoPageView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class DemoViewModel extends BaseModel {
  final String _title = "Title from the viewMode GSoC branch";
  String get title => _title;
}

Future<void> setUpFirebaseMessaging(
  Map<String, dynamic> androidFirebaseOptions,
  Map<String, dynamic> iosFirebaseOptions,
) async {
  /// Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(
      (_) async => _firebaseMessagingBackgroundHandler(
            _,
            androidFirebaseOptions,
            iosFirebaseOptions,
          ));

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
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
