import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/views/after_auth_screens/app_settings/app_settings_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/edit_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_page.dart';
import 'package:talawa/views/after_auth_screens/join_organisation_after_auth.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/after_auth_screens/tasks/create_task_page.dart';
import 'package:talawa/views/after_auth_screens/tasks/edit_task_page.dart';
import 'package:talawa/views/after_auth_screens/tasks/event_tasks_page.dart';
import 'package:talawa/views/after_auth_screens/tasks/user_tasks_page.dart';
import 'package:talawa/views/after_auth_screens/venue/map_screen.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/views/pre_auth_screens/login.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';
import 'package:talawa/views/pre_auth_screens/waiting_to_join_private_org.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      final int mainScreenIndex = settings.arguments! as int;
      return MaterialPageRoute(
        builder: (context) => SplashScreen(
          key: const Key('SplashScreen'),
          mainScreenIndex: mainScreenIndex,
        ),
      );
    case Routes.languageSelectionRoute:
      return MaterialPageRoute(
        builder: (context) => const SelectLanguage(key: Key('SelectLanguage')),
      );
    case Routes.setUrlScreen:
      final String uri = settings.arguments!.toString();
      return MaterialPageRoute(
        builder: (context) => SetUrl(
          key: const Key('SetUrl'),
          uri: uri,
        ),
      );
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const Login(key: Key('Login')),
      );
    case Routes.selectOrgScreen:
      final String id = settings.arguments!.toString();
      return CupertinoPageRoute(
        builder: (context) => SelectOrganization(
          key: const Key('Signup'),
          selectedOrgId: id,
        ),
      );
    case Routes.signupDetailScreen:
      final OrgInfo org = settings.arguments! as OrgInfo;
      return CupertinoPageRoute(
        builder: (context) => SignUpDetails(
          key: const Key('Signup'),
          selectedOrg: org,
        ),
      );
    case Routes.waitingScreen:
      return CupertinoPageRoute(
        builder: (context) => const WaitingPage(key: Key('Waiting')),
      );
    case Routes.recoverScreen:
      return MaterialPageRoute(
        builder: (context) => const Recover(key: Key('Recover')),
      );
    case Routes.updateScreen:
      return MaterialPageRoute(
        builder: (context) => const ChangePass(key: Key('Update')),
      );
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const OrganizationFeed(key: Key('HomeScreen')),
      );
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
    case Routes.individualPost:
      final Post post = settings.arguments! as Post;
      return MaterialPageRoute(
        builder: (context) => IndividualPostView(
          key: const Key('IndividualPost'),
          post: post,
        ),
      );
    case Routes.pinnedPostPage:
      final List<Post> pinnedPosts = settings.arguments! as List<Post>;
      return MaterialPageRoute(
        builder: (context) => PinnedPostPage(pinnedPosts: pinnedPosts),
      );
    case Routes.exploreEventsScreen:
      return MaterialPageRoute(
        builder: (context) => const ExploreEvents(key: Key('ExploreEvents')),
      );
    case Routes.eventInfoPage:
      final Map<String, dynamic> args =
          settings.arguments! as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => EventInfoPage(
          key: const Key('EventInfo'),
          args: args,
        ),
      );
    case Routes.createEventPage:
      return MaterialPageRoute(
        builder: (context) => const CreateEventPage(key: Key('CreateEvent')),
      );
    case Routes.profilePage:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(key: Key('Profile')),
      );
    case Routes.editProfilePage:
      return MaterialPageRoute(
        builder: (context) => const EditProfilePage(key: Key('EditProfile')),
      );
    case Routes.joinOrg:
      final String id = settings.arguments!.toString();
      return MaterialPageRoute(
        builder: (context) => JoinOrganisationAfterAuth(
          key: const Key('JoinOrganisationAfterAuth'),
          orgId: id,
        ),
      );
    case Routes.editEventPage:
      final Event event = settings.arguments! as Event;
      return MaterialPageRoute(
        builder: (context) => EditEventPage(
          key: const Key('EditEvent'),
          event: event,
        ),
      );
    case Routes.appSettings:
      return MaterialPageRoute(
        builder: (context) => const AppSettingsPage(key: Key('AppSettings')),
      );

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
    case Routes.mapScreen:
      final arguments = settings.arguments! as Map<String, dynamic>;
      final model = arguments['model'] as CreateEventViewModel?;
      final latitude = arguments['latitude'] as double;
      final longitude = arguments['longitude'] as double;
      return MaterialPageRoute(
        builder: (context) => MapScreen(
          model,
          latitude,
          longitude,
          key: const Key('MapScreen'),
        ),
      );
    case Routes.calendar:
      return MaterialPageRoute(
        builder: (context) => EventCalendar(
          settings.arguments! as List<Event>,
          key: const Key('Calendar'),
        ),
      );
    case Routes.eventTasks:
      final eventId = settings.arguments! as String;
      return MaterialPageRoute(
        builder: (context) => EventTasksPage(
          eventId: eventId,
          key: const Key('EventTasks'),
        ),
      );
    case Routes.userTasks:
      return MaterialPageRoute(
        builder: (context) => const UserTasksPage(
          key: Key('UserTasks'),
        ),
      );
    case Routes.addTask:
      final eventId = settings.arguments! as String;
      return MaterialPageRoute(
        builder: (context) => CreateTaskPage(
          key: const Key('AddTask'),
          eventId: eventId,
        ),
      );
    case Routes.editTask:
      final task = settings.arguments! as Task;
      return MaterialPageRoute(
        builder: (context) => EditTaskPage(
          key: const Key('EditTask'),
          task: task,
        ),
      );
    case Routes.selectContact:
      return MaterialPageRoute(
          builder: (context) => const SelectContact(key: Key('selectContact')));
    default:
      return MaterialPageRoute(
        builder: (context) => const DemoPageView(
          key: Key("DemoPage"),
        ),
      );
  }
}
