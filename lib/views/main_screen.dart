import 'package:flutter/material.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            drawer: const CustomDrawer(),
            body: model.childrenPage[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: model.currentIndex,
              onTap: model.onTabTapped,
              selectedItemColor: const Color(0xff34AD64),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.event_note),
                  label: 'Events',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  label: 'Post',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Chat',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile',
                )
              ],
            ),
          );
        });
  }
}
