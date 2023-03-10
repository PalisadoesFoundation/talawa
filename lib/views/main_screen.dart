// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.mainScreenArgs}) : super(key: key);
  final MainScreenArgs mainScreenArgs;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
      onModelReady: (model) {
        model.initialise(
          context,
          fromSignUp: widget.mainScreenArgs.fromSignUp,
          mainScreenIndex: widget.mainScreenArgs.mainScreenIndex,
        );
      },
      builder: (context, model, child) {
        // Checks for updates in plugins from the server.
        // Will continously hit the server and fetch plugin information.
        model.fetchAndAddPlugins(context);

        return Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          drawer: CustomDrawer(
            homeModel: model,
            key: const Key("Custom Drawer"),
          ),
          body: IndexedStack(
            index: model.currentPageIndex,
            children: model.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: model.currentPageIndex,
            onTap: model.onTabTapped,
            selectedItemColor: const Color(0xff34AD64),
            items: model.navBarItems,
          ),
        );
      },
    );
  }
}
