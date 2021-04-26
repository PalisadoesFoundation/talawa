//Flutter Packages are imported here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Pages are imported here
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/post_provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/loghelper.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import 'package:talawa/views/pages/organization/create_organization.dart';
import 'package:talawa/views/pages/organization/switch_org_page.dart';
import 'controllers/auth_controller.dart';
import 'controllers/org_controller.dart';

Preferences preferences = Preferences();
String userID;
LogHelper logHelper = LogHelper();
Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //ensuring weather the app is being initialized or not
  setupLocator();
  userID = await preferences.getUserId(); //getting user id
  await logHelper.init(); // To intialise FlutterLog
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) //setting the orientation according to the screen it is running on
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: UIData.appName,
        theme: ThemeData(
            primaryColor: UIData.primaryColor,
            fontFamily: UIData.quickFont,
            primarySwatch: UIData.primaryColor as MaterialColor),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        onGenerateRoute: (RouteSettings settings) {
          print(
              'build route for ${settings.name}'); //here we are building the routes for the app
          final routes = <String, WidgetBuilder>{
            UIData.homeRoute: (BuildContext context) => const HomePage(),
            UIData.loginPageRoute: (BuildContext context) => UrlPage(),
            UIData.createOrgPage: (BuildContext context) =>
                const CreateOrganization(),
            UIData.joinOrganizationPage: (BuildContext context) =>
                const JoinOrganization(),
            UIData.switchOrgPage: (BuildContext context) =>
                SwitchOrganization(),
            UIData.profilePage: (BuildContext context) => const ProfilePage(),
          };
          final WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
        home: userID == null
            ? UrlPage()
            : const HomePage(), //checking weather the user is logged in or not
      ),
    );
  }
}
