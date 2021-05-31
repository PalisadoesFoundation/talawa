import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/viewModel/demo_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/router.dart' as router;
import 'constants/custom_theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TalawaTheme.lightTheme,
      darkTheme: TalawaTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      // initialRoute: '/',
      home: const OrganizationFeed(
        key: Key('HomeView'),
      ),
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
          title: const Text('Demo Page'),
        ),
        body: Container(
          child: Text(model.title),
        ),
      ),
    );
  }
}
