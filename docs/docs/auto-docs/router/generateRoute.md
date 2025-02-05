


# generateRoute function










[Route](https://api.flutter.dev/flutter/widgets/Route-class.html) generateRoute
([RouteSettings](https://api.flutter.dev/flutter/widgets/RouteSettings-class.html) settings)





<p>The MaterialApp provides us with a property called generateRoute where
we can pass in a Function that returns a Route<dynamic> and takes in RouteSettings</dynamic></p>
<p>Thus for this purpose, we create a function named generateRoute</p>



## Implementation

```dart
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

    // Returns the ProfilePage Widget
    case Routes.profilePage:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(key: Key('Profile')),
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

    // Returns the MapScreen Widget
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
    // Returns the DemoPageView Widget by default
    case Routes.selectContact:
      return MaterialPageRoute(
        builder: (context) => const SelectContact(key: Key('selectContact')),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const DemoPageView(
          key: Key("DemoPage"),
        ),
      );
  }
}
```







