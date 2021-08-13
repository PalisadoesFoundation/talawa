import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, this.fromSignUp = false}) : super(key: key);
  final bool fromSignUp;
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
        onModelReady: (model) =>
            model.initialise(context, fromSignUp: fromSignUp),
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            drawer: CustomDrawer(homeModel: model),
            body: IndexedStack(
              index: model.currentIndex,
              children: [
                OrganizationFeed(key: const Key("HomeView"), homeModel: model),
                ExploreEvents(
                    key: const Key('ExploreEvents'), homeModel: model),
                AddPost(
                    key: const Key('AddPost'), drawerKey: model.scaffoldKey),
                const ChatPage(),
                ProfilePage(key: model.keySPEditProfile, homeModel: model),
              ],
            ),
            bottomNavigationBar: Stack(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: SizedBox(
                          key: model.keyBNHome,
                          height: 40,
                          width: 40,
                        ),
                      )),
                      Expanded(
                          child: Center(
                        child: SizedBox(
                          key: model.keyBNEvents,
                          height: 40,
                          width: 40,
                        ),
                      )),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            key: model.keyBNPost,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            key: model.keyBNChat,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            key: model.keyBNProfile,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: model.currentIndex,
                  onTap: model.onTabTapped,
                  selectedItemColor: const Color(0xff34AD64),
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label:
                          AppLocalizations.of(context)!.strictTranslate('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.event_note),
                      label: AppLocalizations.of(context)!
                          .strictTranslate('Events'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.add_box),
                      label:
                          AppLocalizations.of(context)!.strictTranslate('Post'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.chat_bubble_outline),
                      label:
                          AppLocalizations.of(context)!.strictTranslate('Chat'),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.account_circle),
                      label: AppLocalizations.of(context)!
                          .strictTranslate('Profile'),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
