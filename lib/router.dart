import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/app_settings/app_settings_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/after_auth_screens/events/create_custom_recurring_event.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/edit_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_page.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/join_organisation_after_auth.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/views/pre_auth_screens/login.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';
import 'package:talawa/views/pre_auth_screens/waiting_screen.dart';

/// The MaterialApp provides us with a property called generateRoute where.
///
///
/// we can pass in a Function that returns a Route<dynamic> and takes in RouteSettings
/// Thus for this purpose, we create a function named generateRoute
///
/// **params**:
/// * `settings`: RouteSetting have been passed
///
/// **returns**:
/// * `Route<dynamic>`: Return a Route
Route<dynamic> generateRoute(RouteSettings settings) {
  // The settings contains the route information of the requested route.
  // It provides two key things to us: the name, and the arguments.
  // We use the name to determine which view to return.
  switch (settings.name) {
    // Returns the SplashScreen
    case Routes.splashScreen:
      final int mainScreenIndex = settings.arguments! as int;
      return MaterialPageRoute(
        builder: (context) => SplashScreen(
          key: const Key('SplashScreen'),
          mainScreenIndex: mainScreenIndex,
        ),
      );

    // Returns the SelectLanguage Widget
    case Routes.languageSelectionRoute:
      return MaterialPageRoute(
        builder: (context) => const SelectLanguage(key: Key('SelectLanguage')),
      );

    // Returns the SetUrl Widget
    case Routes.setUrlScreen:
      final String uri = settings.arguments!.toString();
      return MaterialPageRoute(
        builder: (context) => SetUrl(
          key: const Key('SetUrl'),
          uri: uri,
        ),
      );

    // Returns the Login Widget
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const Login(key: Key('Login')),
      );

    // Returns the SelectOrganization Widget
    case Routes.selectOrgScreen:
      final String id = settings.arguments!.toString();
      return CupertinoPageRoute(
        builder: (context) => SelectOrganization(
          key: const Key('Signup'),
          selectedOrgId: id,
        ),
      );

    // Returns the SignUpDetails Widget
    case Routes.signupDetailScreen:
      final OrgInfo org = settings.arguments! as OrgInfo;
      return CupertinoPageRoute(
        builder: (context) => SignUpDetails(
          key: const Key('Signup'),
          selectedOrg: org,
        ),
      );

    // Returns the WaitingPge Widget
    case Routes.waitingScreen:
      return CupertinoPageRoute(
        builder: (context) => const WaitingPage(key: Key('Waiting')),
      );

    // Returns the Recover Widget
    case Routes.recoverScreen:
      return MaterialPageRoute(
        builder: (context) => const Recover(key: Key('Recover')),
      );

    // Returns the ChangePass Widget
    case Routes.updateScreen:
      return MaterialPageRoute(
        builder: (context) => const ChangePass(key: Key('Update')),
      );

    // Returns the OrganizationFeed Widget
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const OrganizationFeed(key: Key('HomeScreen')),
      );

    // Returns the DemoOrganizationFeed Widget
    case Routes.demoHomeScreen:
      return MaterialPageRoute(
        builder: (context) =>
            const DemoOrganizationFeed(key: Key('DemoHomeScreen')),
      );

    // Returns the MainScreen Widget
    case Routes.mainScreen:
      final MainScreenArgs mainScreenArgs =
          settings.arguments! as MainScreenArgs;
      //  final bool fromSignUp = settings.arguments! as bool;
      return MaterialPageRoute(
        builder: (context) => MainScreen(
          key: const Key('MainScreen'),
          mainScreenArgs: mainScreenArgs,
        ),
      );

    // Returns the IndividualPostView Widget
    case Routes.individualPost:
      final Post post = settings.arguments! as Post;
      return MaterialPageRoute(
        builder: (context) => IndividualPostView(
          key: const Key('IndividualPost'),
          post: post,
        ),
      );

    // Returns the PinnedPostPgae Widget
    case Routes.pinnedPostPage:
      final List<Post> pinnedPosts = settings.arguments! as List<Post>;
      return MaterialPageRoute(
        builder: (context) => PinnedPostPage(pinnedPosts: pinnedPosts),
      );

    // Returns the ExploreEvents Widget
    case Routes.exploreEventsScreen:
      return MaterialPageRoute(
        builder: (context) => const ExploreEvents(key: Key('ExploreEvents')),
      );

    // Returns the DemoExploreEvents Widget
    case Routes.demoExploreEventsScreen:
      return MaterialPageRoute(
        builder: (context) =>
            const DemoExploreEvents(key: Key('DemoExploreEvents')),
      );

    // Returns the EventInfoPage Widget
    case Routes.eventInfoPage:
      final Map<String, dynamic> args =
          settings.arguments! as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => EventInfoPage(
          key: const Key('EventInfo'),
          args: args,
        ),
      );

    // Returns the CreateEventPage Widget
    case Routes.createEventPage:
      return MaterialPageRoute(
        builder: (context) => const CreateEventPage(key: Key('CreateEvent')),
      );

    // Returns the CreateEventPage Widget
    case Routes.customRecurrencePage:
      final model = settings.arguments! as CreateEventViewModel;
      return MaterialPageRoute(
        builder: (context) => CustomRecurrencePage(
          key: const Key('CreateEvent'),
          model: model,
        ),
      );

    // Returns the ProfilePage Widget
    case Routes.profilePage:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(key: Key('Profile')),
      );

    // Return the DemoProfilePage Widget
    case Routes.demoProfilePage:
      return MaterialPageRoute(
        builder: (context) => const DemoProfilePage(key: Key('DemoProfile')),
      );

    // Returns the EditProfilePage Widget
    case Routes.editProfilePage:
      return MaterialPageRoute(
        builder: (context) => const EditProfilePage(key: Key('EditProfile')),
      );

    // Returns the JoinOrganizationAfterAuth Widget
    case Routes.joinOrg:
      final String id = settings.arguments!.toString();
      return MaterialPageRoute(
        builder: (context) => JoinOrganisationAfterAuth(
          key: const Key('JoinOrganisationAfterAuth'),
          orgId: id,
        ),
      );

    case Routes.requestAccess:
      final OrgInfo org = settings.arguments! as OrgInfo;
      return CupertinoPageRoute(
        builder: (context) => SendAccessRequest(
          key: const Key('Signup'),
          org: org,
        ),
      );
    // Returns the EditEventPage Widget
    case Routes.editEventPage:
      final Event event = settings.arguments! as Event;
      return MaterialPageRoute(
        builder: (context) => EditEventPage(
          key: const Key('EditEvent'),
          event: event,
        ),
      );
    case Routes.pinnedPostScreen:
      // final Map<String, dynamic> post = settings.arguments! as Map<String, dynamic> ;
      final Map<String, String> post =
          settings.arguments! as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) => PinnedPostScreen(post: post),
      );
    // Returns the AppSettingsPage Widget
    case Routes.appSettings:
      return MaterialPageRoute(
        builder: (context) => const AppSettingsPage(key: Key('AppSettings')),
      );

    // Returns the ChatMessageScreen Widget
    case Routes.chatMessageScreen:
      final List<dynamic> arguments = settings.arguments! as List<dynamic>;
      final String chatId = arguments[0] as String;
      final DirectChatViewModel model = arguments[1] as DirectChatViewModel;
      return MaterialPageRoute(
        builder: (context) => ChatMessageScreen(
          key: const Key('ChatMessageScreen'),
          chatId: chatId,
          model: model,
        ),
      );

    case Routes.calendar:
      return MaterialPageRoute(
        builder: (context) => EventCalendar(
          settings.arguments! as List<Event>,
          key: const Key('Calendar'),
        ),
      );

    case Routes.selectContact:
      return MaterialPageRoute(
        builder: (context) => const SelectContact(key: Key('selectContact')),
      );

    case Routes.addPostScreen:
      return MaterialPageRoute(
        builder: (context) => const AddPost(
          key: Key('AddPostPage'),
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const DemoPageView(
          key: Key("DemoPage"),
        ),
      );
  }
}
