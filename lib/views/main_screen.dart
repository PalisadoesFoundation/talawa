import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/plugins/fetch_plugin_list.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/theme_switch.dart';

late List<StatelessWidget> navBarClasses;
late List<BottomNavigationBarItem> navBarItems;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.mainScreenArgs}) : super(key: key);
  final MainScreenArgs mainScreenArgs;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, bool> addedToNav = {
    "Chats": true,
    "Posts": true,
    "Events": true,
  };

  List<List<Object>> renderBottomNavBarPlugins(
      List<BottomNavigationBarItem> navBarItems,
      List<StatelessWidget> navBarClasses,
      Map navNameClasses,
      Map<String, Widget> navNameIcons,
      BuildContext context) {
    //get list from hive
    final Box box;
    // ignore: prefer_typing_uninitialized_variables
    var pluginList;
    const bool res = false;
    box = Hive.box('pluginBox');
    pluginList = box.get('plugins');

    /// CAUTION : `pluginList` is currently filled with dummy data in order to make sure that
    /// all features of talawa should be visible from the navbar.
    /// following dummy data should be only used for developement purpose.
    /// Adding dummy data enables to use Events,Posts,Chats features event if plugin documents for them is not created by the admin.
    /// FOR PRODUCTION : please make this array empty to enable or test real plugin data from the server
    pluginList ??= [
      // if null then it will be replace with the following data
      {
        "_id": "62cfcd6e33bbe266f59644dd",
        "pluginInstallStatus": true,
        "pluginName": "Events",
        "pluginCreatedBy": " Mr. Siddhesh Bhupendra  Kukade",
        "pluginDesc":
            "Presenting the Events Plugin by Siddhesh Bhupendra Kuakde that implements the plugin features as a component here members can create and manage events and on top of it everything is controlled by the Organization Admins . Install and use right away.",
        "installedOrgs": ["<YOUR_ORG_ID_FOR_DEVELOPMENT>"]
      },
      {
        "_id": "62cfcd6233bbe266f59644db",
        "pluginInstallStatus": true,
        "pluginName": "Posts",
        "pluginCreatedBy": "Mr.Johnathan Doe ",
        "pluginDesc":
            "Presenting the Donation plugin for the talawa app that enables members of the organization to  do One time or Reccurinng donations to an  organization",
        "installedOrgs": ["<YOUR_ORG_ID_FOR_DEVELOPMENT>"]
      },
      {
        "_id": "62cfcf71824dc26e1fbeed46",
        "pluginInstallStatus": true,
        "pluginName": "Donation",
        "pluginCreatedBy": "Kimia",
        "pluginDesc":
            "See all available organizations in entire world using this plugins",
        "installedOrgs": ["<YOUR_ORG_ID_FOR_DEVELOPMENT>"]
      },
      {
        "_id": "62cfcf71824dc26e1fbeed46",
        "pluginInstallStatus": true,
        "pluginName": "Chats",
        "pluginCreatedBy": "Kimia",
        "pluginDesc":
            "See all available organizations in entire world using this plugins",
        "installedOrgs": ["<YOUR_ORG_ID_FOR_DEVELOPMENT>"]
      }
    ];

    /// Here we are dynamically adding BottomNavigationBarItems in navbar
    /// by mapping over the data received from the server.
    pluginList.forEach((plugin) {
      if (navNameClasses.containsKey(plugin["pluginName"] as String) &&
          plugin["pluginInstallStatus"] as bool &&
          !addedToNav.containsKey(plugin["pluginName"])) {
        navBarItems.add(
          BottomNavigationBarItem(
            icon: navNameIcons[plugin["pluginName"]] ?? const Icon(Icons.home),
            label: AppLocalizations.of(context)!
                .strictTranslate(plugin["pluginName"] as String),
          ),
        );
        navBarClasses.add(
          navNameClasses[plugin["pluginName"]]["class"] as StatelessWidget,
        );
        // addedToNav[plugin["pluginName"] as String] = true;
        addedToNav.putIfAbsent(
          plugin["pluginName"] as String,
          () => true,
        );
      }
    });

    /// updating the state to re-render the navbar widget.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// This line causes the app to continiously check for plugins if they are updated
      /// and it will automatically re-render the navbar with enables or disabled features
      FetchPluginList(); // dont delete
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
        label: AppLocalizations.of(context)!.strictTranslate('Home'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.event_note),
        label: AppLocalizations.of(context)!.strictTranslate('Events'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_box),
        label: AppLocalizations.of(context)!.strictTranslate('Add'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.chat_outlined),
        label: AppLocalizations.of(context)!.strictTranslate('Chat'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: AppLocalizations.of(context)!.strictTranslate('Profile'),
      )
    ];

    return BaseView<MainScreenViewModel>(
      onModelReady: (model) {
        model.initialise(
          context,
          fromSignUp: widget.mainScreenArgs.fromSignUp,
          mainScreenIndex: widget.mainScreenArgs.mainScreenIndex,
        );
      },
      builder: (context, model, child) {
        /// `navNameIcon` Object maps Icons to proper features according to their names used in navbar.
        /// CAUTION : Name of the feature in talwa app must match with the name that is provided by the admin.
        final Map<String, Widget> navNameIcon = {
          "Events": const Icon(Icons.event_note),
          "Posts": const Icon(Icons.add_box),
          "Profile": const Icon(Icons.account_circle),
          "Chats": const Icon(Icons.chat_outlined),
          "Donation": const Icon(Icons.attach_money_outlined),
        };

        /// `navNameClasses` Object maps the feature names with thier proper Icons and Widgets (named as `class`) used in navbar
        /// CAUTION : Name of the feature in talwa app must match with the name that is provided by the admin.
        final Map<dynamic, dynamic> navNameClasses = {
          "Events": {
            // "icon": Icons.event_note,
            "class": ExploreEvents(
              key: const Key('ExploreEvents'),
              homeModel: model,
            )
          },
          "Posts": {
            "class": AddPost(
              key: const Key('AddPost'),
              drawerKey: MainScreenViewModel.scaffoldKey,
            )
          },
          "Chats": {
            "class": const ChatPage(
              key: Key('Chats'),
            ),
          },
          "Donation": {
            "class": const ChangeThemeTile(),
          }
        };

        /// `navBarClasses` is the array that contains the Widgets to be rendered on the navbar
        /// Features that should be implemented as plugins like Home, Profile,etc. should be kept here
        /// When talawa app receives the plugins data is will dynamically render more components from the construtor.
        navBarClasses = [
          OrganizationFeed(
            key: const Key("HomeView"),
            homeModel: model,
          ),
          ExploreEvents(
            key: const Key('ExploreEvents'),
            homeModel: model,
          ),
          AddPost(
            key: const Key('AddPost'),
            drawerKey: MainScreenViewModel.scaffoldKey,
          ),
          const ChatPage(
            key: Key('Chats'),
          ),
          ProfilePage(
            key: model.keySPEditProfile,
            homeModel: model,
          ),
        ];
        // ignore_for_file:  unused_local_variable
        final res = renderBottomNavBarPlugins(
          navBarItems,
          navBarClasses,
          navNameClasses,
          navNameIcon,
          context,
        );

        return Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          drawer: CustomDrawer(
            homeModel: model,
            key: const Key("Custom Drawer"),
          ),
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
                    getBNBItem(model.keyBNHome),
                    getBNBItem(model.keyBNEvents),
                    getBNBItem(model.keyBNPost),
                    getBNBItem(model.keyBNChat),
                    getBNBItem(model.keyBNProfile),
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

  Widget getBNBItem(GlobalKey<State<StatefulWidget>> key) {
    return Expanded(
      child: Center(
        child: SizedBox(
          key: key,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
