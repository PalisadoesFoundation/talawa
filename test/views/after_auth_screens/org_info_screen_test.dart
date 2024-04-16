import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/after_auth_screens/org_info_screen.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

final OrgInfo mockOrgInfo = OrgInfo.fromJson(
  {
    '_id': '123',
    'image': 'image_url',
    'name': 'Org_Name',
    'description': 'aabbcc',
    'userRegistrationRequired': false,
    'creator': {
      'accessToken': 'abc',
      'refreshToken': 'abc',
      '_id': '123',
      'firstName': 'Parag',
      'lastName': 'Gupta',
    },
    'members': [
      {
        'accessToken': 'abc',
        'refreshToken': 'abc',
        '_id': '123',
        'firstName': 'Parag',
        'lastName': 'Gupta',
      },
    ],
    'admins': [
      {
        'firstName': 'Parag',
        'lastName': '1',
      },
      {
        'firstName': 'Parag',
        'lastName': '2',
      },
      {
        'firstName': 'Parag',
        'lastName': '3',
      }
    ],
    'address': {
      "city": "Delhi",
      "countryCode": "IN",
      "dependentLocality": "Some Dependent Locality",
      "line1": "123 Random Street",
      "line2": "Apartment 456",
      "postalCode": "110001",
      "sortingCode": "ABC-123",
      "state": "Delhi",
    },
  },
  memberRequest: false,
);

final OrgInfo mockOrgInfo2 = OrgInfo.fromJson(
  {
    '_id': '123',
    'image': '',
    'name': 'Org_Name',
    'description': 'aabbcc',
    'userRegistrationRequired': true,
    'creator': {
      'accessToken': 'abc',
      'refreshToken': 'abc',
      '_id': '123',
      'firstName': 'Parag',
      'lastName': 'Gupta',
    },
    'members': [
      {
        'firstName': 'Paul',
        'lastName': '1',
      },
      {
        'firstName': 'jon',
        'lastName': '1',
      },
      {
        'firstName': 'sean',
        'lastName': '1',
      },
      {
        'firstName': 'Jay',
        'lastName': '1',
      },
      {
        'firstName': 'Chris',
        'lastName': '1',
      },
    ],
    'admins': [
      {
        'firstName': 'Parag',
        'lastName': 'Gupta',
      },
    ],
    'address': {
      "city": "Delhi",
      "countryCode": "IN",
      "dependentLocality": "Some Dependent Locality",
      "line1": "123 Random Street",
      "line2": "Apartment 456",
      "postalCode": "110001",
      "sortingCode": "ABC-123",
      "state": "Delhi",
    },
  },
  memberRequest: false,
);

Widget createOrgInfoScreen1() {
  return MaterialApp(
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: OrganisationInfoScreen(
      orgInfo: mockOrgInfo,
    ),
    navigatorKey: locator<NavigationService>().navigatorKey,
  );
}

Widget createOrgInfoScreen2() {
  return MaterialApp(
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: OrganisationInfoScreen(
      orgInfo: mockOrgInfo2,
    ),
    navigatorKey: locator<NavigationService>().navigatorKey,
  );
}

void main() {
  testSetupLocator();
  SizeConfig().test();
  GraphqlConfig().test();
  setUp(() {
    registerServices();
  });
  group('OrganisationInfoScreen Tests', () {
    testWidgets('Displays the correct organization info',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createOrgInfoScreen1());
        await tester.pumpAndSettle();

        expect(find.text('Org_Name'), findsOneWidget);
        expect(find.text('aabbcc'), findsOneWidget);
        expect(find.text('Delhi, IN'), findsOneWidget);
        expect(find.text('Public'), findsOneWidget);
        expect(find.byIcon(Icons.lock_open), findsOneWidget);
      });
    });
    testWidgets('for private organisation', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createOrgInfoScreen2());
        await tester.pumpAndSettle();

        expect(find.text('Org_Name'), findsOneWidget);
        expect(find.text('aabbcc'), findsOneWidget);
        expect(find.text('Delhi, IN'), findsOneWidget);
        expect(find.text('Private'), findsOneWidget);
        expect(find.byIcon(Icons.lock), findsOneWidget);
      });
    });

    testWidgets('Join button shows when organization is not joined',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        final viewModel = SelectOrganizationViewModel();

        await tester.pumpWidget(createOrgInfoScreen1());
        await tester.pumpAndSettle();

        expect(find.text('Join'), findsOneWidget);
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        verify(viewModel.selectOrg(mockOrgInfo)).called(1);
      });
    });
    testWidgets('Leave button shows when organization is joined',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        userConfig.currentUser.joinedOrganizations!.add(mockOrgInfo);

        await tester.pumpWidget(createOrgInfoScreen1());
        await tester.pumpAndSettle();

        expect(find.text('Leave'), findsOneWidget);
      });
    });
    testWidgets('Displays the default image when orgInfo.image is null',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createOrgInfoScreen2());
        await tester.pumpAndSettle();

        expect(find.byType(Image), findsOneWidget);
        expect(find.byKey(const Key('image_container')), findsOneWidget);
      });
    });
    testWidgets('DropDown list for admins more than 2',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createOrgInfoScreen1());
        await tester.pumpAndSettle();

        expect(find.text('Admins'), findsOneWidget);
        expect(find.text('Parag 1'), findsOneWidget);

        expect(find.text('See all'), findsOneWidget);
        await tester.tap(find.text('See all'));
        await tester.pumpAndSettle();

        expect(find.text('Parag 3'), findsOneWidget);
      });
    });
    testWidgets('DropDown list for members more than 4',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createOrgInfoScreen2());
        await tester.pumpAndSettle();

        expect(find.text('Members'), findsOneWidget);
        expect(find.text('Paul 1'), findsOneWidget);

        expect(find.text('See all'), findsOneWidget);
        await tester.tap(find.text('See all'));
        await tester.pumpAndSettle();

        expect(find.text('Chris 1'), findsOneWidget);
      });
    });
  });
}
