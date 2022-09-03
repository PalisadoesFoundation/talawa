import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../locator.dart';
import '../services/user_config.dart';
import 'after_auth_screens/profile/profile_page.dart';

late List<StatelessWidget> navBarClasses;
late List<BottomNavigationBarItem> navBarItems;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.mainScreenArgs}) : super(key: key);
  //final bool fromSignUp;
  final MainScreenArgs mainScreenArgs;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<List<Object>> renderBottomNavBarPlugins(
      List<BottomNavigationBarItem> navBarItems,
      List<StatelessWidget> navBarClasses,
      Map navNameClasses,
      Map<String, Widget> navNameIcons,
      BuildContext context) {
    //get list from hive
    final UserConfig _userConfig = locator<UserConfig>();
    final Box box;
    var pluginList;
    bool res = false;
    box = Hive.box('pluginBox');
    pluginList = box.get('plugins');
    if (pluginList == null) {
      /// CAUTION : `pluginList` is currently filled with dummy data in order to make sure that
      /// all features of talawa should be visible from the navbar.
      /// following dummy data should be only used for developement purpose.
      /// Adding dummy data enables to use Events,Posts,Chats features event if plugin documents for them is not created by the admin.
      /// FOR PRODUCTION : please make this array empty to enable or test real plugin data from the server
      pluginList = [
        {
          "_id": "62cfcd6e33bbe266f59644dd",
          "pluginInstallStatus": true,
          "pluginName": "Events",
          "pluginCreatedBy": " Mr. Siddhesh Bhupendra  Kukade",
          "pluginDesc":
              "Presenting the Events Plugin by Siddhesh Bhupendra Kuakde that implements the plugin features as a component here members can create and manage events and on top of it everything is controlled by the Organization Admins . Install and use right away.",
          "installedOrgs": [
            "62ccfccd3eb7fd2a30f41601",
            "62ccfccd3eb7fd2a30f41601"
          ]
        },
        {
          "_id": "62cfcd6233bbe266f59644db",
          "pluginInstallStatus": true,
          "pluginName": "Posts",
          "pluginCreatedBy": "Mr.Johnathan Doe ",
          "pluginDesc":
              "Presenting the Donation plugin for the talawa app that enables members of the organization to  do One time or Reccurinng donations to an  organization",
          "installedOrgs": [
            "62ccfccd3eb7fd2a30f41601",
            "62ccfccd3eb7fd2a30f41601"
          ]
        },
        {
          "_id": "62cfcf71824dc26e1fbeed46",
          "pluginInstallStatus": true,
          "pluginName": "Donation",
          "pluginCreatedBy": "Kimia",
          "pluginDesc":
              "See all available organizations in entire world using this plugins",
          "installedOrgs": []
        },
        {
          "_id": "62cfcf71824dc26e1fbeed46",
          "pluginInstallStatus": true,
          "pluginName": "Chats",
          "pluginCreatedBy": "Kimia",
          "pluginDesc":
              "See all available organizations in entire world using this plugins",
          "installedOrgs": []
        }
      ];
    }

    /// Here we are dynamically adding BottomNavigationBarItems in navbar by mapping over the data received from the server.
    pluginList.forEach((plugin) => {
          if (navNameClasses.containsKey(plugin["pluginName"] as String) &&
              plugin["pluginInstallStatus"] as bool)
            {
              navBarItems.add(BottomNavigationBarItem(
                icon: navNameIcons[plugin["pluginName"]] ?? Icon(Icons.home),
                label: AppLocalizations.of(context)!
                    .strictTranslate(plugin["pluginName"] as String),
              )),
              navBarClasses.add(navNameClasses[plugin["pluginName"]]["class"]
                  as StatelessWidget),
            },
        });

    /// updating the state to re-render the navbar widget.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });

    return [navBarItems, navBarClasses];
  }

  @override
  Widget build(BuildContext context) {
    ///Features that are not meant to be implemented as plugins should be kept here.
    navBarItems = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: AppLocalizations.of(context)!.strictTranslate('HomeSid'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: AppLocalizations.of(context)!.strictTranslate('Profile'),
      )
    ];

    return BaseView<MainScreenViewModel>(
      onModelReady: (model) => model.initialise(
        context,
        fromSignUp: widget.mainScreenArgs.fromSignUp,
        mainScreenIndex: widget.mainScreenArgs.mainScreenIndex,
      ),
      builder: (context, model, child) {
        /// `NavNameIcon` Object maps Icons to proper features according to their names used in navbar.
        /// CAUTION : Name of the feature in talwa app must match with the name that is provided by the admin.
        Map<String, Widget> NavNameIcon = {
          "Events": Icon(Icons.event_note),
          "Posts": Icon(Icons.add_box),
          "Profile": Icon(Icons.account_circle),
        };

        /// `NavNameClasses` Object maps the feature names with thier proper Icons and Widgets (named as `class`) used in navbar
        /// CAUTION : Name of the feature in talwa app must match with the name that is provided by the admin.
        Map<dynamic, dynamic> NavNameClasses = {
          "Events": {
            "icon": Icons.event_note,
            "class": ExploreEvents(
              key: const Key('ExploreEvents'),
              homeModel: model,
            )
          },
          "Posts": {
            "icon": Icons.add_box,
            "class": AddPost(
              key: const Key('AddPost'),
              drawerKey: MainScreenViewModel.scaffoldKey,
            )
          },
          "Chats": {
            "icon": Icons.chat_bubble_outline,
            "class": ChatPage(
              key: Key('Chat'),
            ),
          }
        };

        /// `navBarClasses` is the array that contains the Widgets to be rendered on the navbar
        /// Features that should be implemented as plugins like Home, Profile,etc. should be kept here
        /// When talawa app receives the plugins data is will dynamically render more components from the construtor.
        navBarClasses = [
          OrganizationFeed(key: const Key("HomeView"), homeModel: model),
          ProfilePage(key: model.keySPEditProfile, homeModel: model),
        ];
        var res = renderBottomNavBarPlugins(
            navBarItems, navBarClasses, NavNameClasses, NavNameIcon, context);
        return Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          drawer:
              CustomDrawer(homeModel: model, key: const Key("Custom Drawer")),
          body: IndexedStack(
            index: model.currentIndex,
            children: navBarClasses,
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
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          key: model.keyBNEvents,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
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
                items: navBarItems,
              ),
            ],
          ),
        );
      },
    );
  }
}
