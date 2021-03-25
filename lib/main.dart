//Flutter Packages are imported here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Pages are imported here
import 'package:provider/provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/login_signup/login_page.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'controllers/auth_controller.dart';
import 'controllers/org_controller.dart';
import 'views/pages/organization/create_organization.dart';
import 'views/pages/organization/switch_org_page.dart';

Preferences preferences = Preferences();
String userID;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ensuring weather the app is being initialized or not
  userID = await preferences.getUserId(); //getting user id
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])  //setting the orientation according to the screen it is running on
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
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
        FocusScopeNode currentFocus = FocusScope.of(context);
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
            primarySwatch: UIData.primaryColor),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        onGenerateRoute: (RouteSettings settings) {
          print('build route for ${settings.name}'); //here we are building the routes for the app
          var routes = <String, WidgetBuilder>{
            UIData.homeRoute: (BuildContext context) => HomePage(),
            UIData.loginPageRoute: (BuildContext context) => UrlPage(),
            UIData.createOrgPage: (BuildContext context) =>
                CreateOrganization(),
            UIData.joinOrganizationPage: (BuildContext context) =>
                JoinOrganization(),
            UIData.switchOrgPage: (BuildContext context) =>
                SwitchOrganization(),
            UIData.profilePage: (BuildContext context) => ProfilePage(),
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
        home: userID == null ? UrlPage() : HomePage(), //checking weather the user is logged in or not
      ),
    );
  }
}
