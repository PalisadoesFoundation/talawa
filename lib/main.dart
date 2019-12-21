import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quito/views/pages/_pages.dart';
import 'package:flutter_quito/utils/translations.dart';
import 'package:flutter_quito/utils/uidata.dart';
import 'package:flutter_quito/views/pages/add_responsibility_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter_quito/utils/globals.dart';

void main() => runApp(MyApp());
// SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {};
  static bool isLoggedIn = false;
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: UIData.quitoThemeColor,
          fontFamily: UIData.quickFont,
          primarySwatch: UIData.quitoThemeColor),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.addActivityPage: (BuildContext context) => AddActivityPage(),
        UIData.addResponsibilityPage: (BuildContext context) => AddResponsibilityPage(),
        UIData.activityDetails: (BuildContext context) => ActivityDetails(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.responsibilityPage: (BuildContext context) =>
            ResponsibilityPage(),
        UIData.contactPage: (BuildContext context) => ContactPage()
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  void initState() {
    super.initState();
    manager = SocketIOManager();
    initSocket("default");
  }

  initSocket(String identifier) async {
    setState(() => _isProbablyConnected[identifier] = true);
    SocketIO socket = await manager.createInstance(SocketOptions(
      //Socket IO server URI
        baseRoute,
        //Enable or disable platform channel logging
        enableLogging: false,
        transports: [Transports.WEB_SOCKET/*, Transports.POLLING*/] //Enable required transport
    ));
    socket.onConnect((data) {
      print("connected...");
      print(data);
    });
    // socket.connect();
    sockets[identifier] = socket;
  }

  bool isProbablyConnected(String identifier){
    return _isProbablyConnected[identifier]??false;
  }

  disconnect(String identifier) async {
    await manager.clearInstance(sockets[identifier]);
    setState(() => _isProbablyConnected[identifier] = false);
  }
  
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
