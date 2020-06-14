import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/note_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/services/connectivity_service.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/add_responsibility_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/utils/GQLClient.dart';

import 'controllers/responsibility_controller.dart';
import 'enums/connectivity_status.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();


void main() {
  // DependencyInjection().initialise(Injector.getInjector());
  // injector = Injector.getInjector();
  // await AppInitializer().initialise(injector);
  // final SocketService socketService = injector.get<SocketService>();
  // socketService.createSocketConnection();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
      ChangeNotifierProvider<ActivityController>(
          create: (_) => ActivityController()),
      ChangeNotifierProvider<ResponsibilityController>(
          create: (_) => ResponsibilityController()),
      ChangeNotifierProvider<UserController>(create: (_) => UserController()),
      ChangeNotifierProvider<NoteController>(create: (_) => NoteController()),
      StreamProvider<ConnectivityStatus>(
          create: (_) =>
              ConnectivityService().connectionStatusController.stream)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //route definition

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfiguration.client,
      child: MaterialApp(
        title: UIData.appName,
        theme: ThemeData(
            primaryColor: UIData.quitoThemeColor,
            fontFamily: UIData.quickFont,
            primarySwatch: UIData.quitoThemeColor),
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        onGenerateRoute: (RouteSettings settings) {
          print('build route for ${settings.name}');
          var routes = <String, WidgetBuilder>{
            UIData.homeRoute: (BuildContext context) => HomePage(),
            UIData.addActivityPage: (BuildContext context) => AddActivityPage(),
            UIData.addResponsibilityPage: (BuildContext context) =>
                AddResponsibilityPage(settings.arguments),
            UIData.activityDetails: (BuildContext context) =>
                ActivityDetails(settings.arguments),
            UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
            UIData.responsibilityPage: (BuildContext context) => NotFoundPage(),
            UIData.contactPage: (BuildContext context) =>
                ContactPage(settings.arguments)
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
        home: FutureBuilder(
            future: Provider.of<AuthController>(context).getUser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data ? HomePage() : LoginPage();
              } else {
                return Container(color: Colors.white);
              }
            }),
        onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
            builder: (context) => new NotFoundPage(
                  appTitle: UIData.coming_soon,
                  icon: FontAwesomeIcons.solidSmile,
                  title: UIData.coming_soon,
                  message: "Under Development",
                  iconColor: Colors.green,
                )),
      ),
    );
  }
}
