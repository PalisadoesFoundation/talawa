// ignore_for_file: talawa_api_doc

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart';
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
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_page.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/join_organisation_after_auth.dart';
import 'package:talawa/views/after_auth_screens/org_info_screen.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/views/pre_auth_screens/waiting_screen.dart';

import 'helpers/test_helpers.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    setupLocator();
    getAndRegisterConnectivity();
  });

  group('Tests for router', () {
    testWidgets('Test SplashScreen route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.splashScreen, arguments: 0),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SplashScreen>());
      }
    });

    testWidgets('Test SelectLanguage route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.languageSelectionRoute),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SelectLanguage>());
      }
    });

    testWidgets('Test SelectOrganization route', (WidgetTester tester) async {
      const orgId = 'exampleOrgId'; // Provide an example organization ID
      final route = generateRoute(
        const RouteSettings(name: Routes.selectOrgScreen, arguments: orgId),
      );
      expect(route, isA<CupertinoPageRoute>());
      if (route is CupertinoPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SelectOrganization>());
        final selectOrganizationWidget = widget as SelectOrganization;
        expect(selectOrganizationWidget.selectedOrgId, orgId);
      }
    });

    testWidgets('Test WaitingPage route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.waitingScreen, arguments: 0),
      );
      expect(route, isA<CupertinoPageRoute>());
      if (route is CupertinoPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<WaitingPage>());
      }
    });

    testWidgets('Test ChangePass route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.updateScreen, arguments: 0),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<ChangePass>());
      }
    });

    testWidgets('Test OrganizationFeed route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.homeScreen, arguments: 0),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<OrganizationFeed>());
      }
    });

    testWidgets('Test MainScreen route', (WidgetTester tester) async {
      final mainScreenArgs = MainScreenArgs(mainScreenIndex: 1);

      final route = generateRoute(
        RouteSettings(name: Routes.mainScreen, arguments: mainScreenArgs),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<MainScreen>());
      }
    });

    testWidgets('Test IndividualPostView route', (WidgetTester tester) async {
      final post = Post(sId: "testId", creator: User());

      final route = generateRoute(
        RouteSettings(name: Routes.individualPost, arguments: post),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<IndividualPostView>());
      }
    });

    testWidgets('Test PinnedPostPage route', (WidgetTester tester) async {
      final List<Post> pinnedPosts = [Post(sId: "testId", creator: User())];

      final route = generateRoute(
        RouteSettings(name: Routes.pinnedPostPage, arguments: pinnedPosts),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<PinnedPostPage>());
      }
    });

    testWidgets('Test ExploreEvents route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.exploreEventsScreen));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<ExploreEvents>());
      }
    });

    testWidgets('Test CreateEventPage route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.createEventPage));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<CreateEventPage>());
      }
    });

    testWidgets('Test createCustomRecurringEvent route',
        (WidgetTester tester) async {
      final route = generateRoute(
        RouteSettings(
          name: Routes.customRecurrencePage,
          arguments: CreateEventViewModel(),
        ),
      );
      expect(
        route,
        isA<MaterialPageRoute>(),
      );
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<CustomRecurrencePage>());
      }
    });

    testWidgets('Test ProfilePage route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.profilePage));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<ProfilePage>());
      }
    });

    testWidgets('Test EditProfilePage route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.editProfilePage));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<EditProfilePage>());
      }
    });

    testWidgets('Test JoinOrganisationAfterAuth route',
        (WidgetTester tester) async {
      const orgId = 'orgId';
      final route = generateRoute(
        const RouteSettings(name: Routes.joinOrg, arguments: orgId),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<JoinOrganisationAfterAuth>());
      }
    });

    testWidgets('Test for requestAccess route', (WidgetTester tester) async {
      final OrgInfo orgInfo = OrgInfo();
      final route = generateRoute(
        RouteSettings(name: Routes.requestAccess, arguments: orgInfo),
      );
      expect(route, isA<CupertinoPageRoute>());
      if (route is CupertinoPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SendAccessRequest>());
      }
    });

    testWidgets('Test for editEventPage route', (WidgetTester tester) async {
      final Event event = Event();
      final route = generateRoute(
        RouteSettings(name: Routes.editEventPage, arguments: event),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<EditEventPage>());
      }
    });

    testWidgets('Test AppSettingsPage route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.appSettings, arguments: 0),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<AppSettingsPage>());
      }
    });

    testWidgets('Test for chatMessageScreen route',
        (WidgetTester tester) async {
      final List<dynamic> arguments = [
        'ChatId',
        DirectChatViewModel(),
      ];
      final route = generateRoute(
        RouteSettings(name: Routes.chatMessageScreen, arguments: arguments),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<ChatMessageScreen>());
      }
    });

    testWidgets('Test for calendar route', (WidgetTester tester) async {
      final List<Event> events = [
        Event(),
      ];
      final route = generateRoute(
        RouteSettings(name: Routes.calendar, arguments: events),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<EventCalendar>());
      }
    });

    testWidgets('Test for selectContact route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.selectContact));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SelectContact>());
      }
    });

    testWidgets('Test for addPostpage route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.addPostScreen));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<AddPost>());
      }
    });

    testWidgets('Test for setUrl route', (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.setUrlScreen, arguments: ''),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<SetUrl>());
      }
    });

    testWidgets('Test for demoProfilePage route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.demoProfilePage));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<DemoProfilePage>());
      }
    });

    testWidgets('Test for demoExploreEventsScreen route',
        (WidgetTester tester) async {
      final route = generateRoute(
        const RouteSettings(name: Routes.demoExploreEventsScreen),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<DemoExploreEvents>());
      }
    });

    testWidgets('Test for demoHomeScreen route', (WidgetTester tester) async {
      final route =
          generateRoute(const RouteSettings(name: Routes.demoHomeScreen));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<DemoOrganizationFeed>());
      }
    });

    testWidgets('Test for default DemoPage route', (WidgetTester tester) async {
      final route = generateRoute(const RouteSettings(name: 'default'));
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<DemoPageView>());
      }
    });

    testWidgets('Test for default orgInfoScreen route',
        (WidgetTester tester) async {
      final route = generateRoute(
        RouteSettings(name: Routes.orgInfoScreen, arguments: OrgInfo()),
      );
      expect(route, isA<MaterialPageRoute>());
      if (route is MaterialPageRoute) {
        final builder = route.builder;
        final widget = builder(MockBuildContext());
        expect(widget, isA<OrganisationInfoScreen>());
      }
    });
  });
}
