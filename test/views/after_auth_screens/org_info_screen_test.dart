// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:network_image_mock/network_image_mock.dart';
// import 'package:talawa/models/organization/org_info.dart';
// import 'package:talawa/services/graphql_config.dart';
// import 'package:talawa/services/navigation_service.dart';
// import 'package:talawa/services/size_config.dart';
// import 'package:talawa/utils/app_localization.dart';
// import 'package:talawa/views/after_auth_screens/org_info_screen.dart';

// import '../../helpers/test_helpers.dart';
// import '../../helpers/test_locator.dart';

// final OrgInfo mockOrgInfo = OrgInfo.fromJson(
//   {
//     'id': '123',
//     'image': 'image_url',
//     'name': 'Org_Name',
//     'description': 'aabbcc',
//     'userRegistrationRequired': false,
//     'creator': {
//       'user': {
//         'id': '123',
//         'name': 'Parag Gupta',
//       },
//       'authenticationToken': 'abc',
//       'refreshToken': 'abc',
//     },
//     'members': [
//       {
//         'user': {
//           'id': '123',
//           'name': 'Parag Gupta',
//         },
//         'authenticationToken': 'abc',
//         'refreshToken': 'abc',
//       },
//     ],
//     'admins': [
//       {
//         'user': {
//           'id': '123',
//           'name': 'Parag 1',
//         },
//       },
//       {
//         'user': {
//           'id': '123',
//           'name': 'Parag 2',
//         },
//       },
//       {
//         'user': {
//           'id': '123',
//           'name': 'Parag 3',
//         },
//       }
//     ],
//     'address': {
//       "city": "Delhi",
//       "countryCode": "IN",
//       "dependentLocality": "Some Dependent Locality",
//       "line1": "123 Random Street",
//       "line2": "Apartment 456",
//       "postalCode": "110001",
//       "sortingCode": "ABC-123",
//       "state": "Delhi",
//     },
//   },
// );

// final OrgInfo mockOrgInfo2 = OrgInfo.fromJson(
//   {
//     'id': '1234',
//     'image': null,
//     'name': 'Org_Name',
//     'description': 'aabbcc',
//     'userRegistrationRequired': true,
//     'creator': {
//       'user': {
//         'id': '123',
//         'name': 'Parag Gupta',
//       },
//       'authenticationToken': 'abc',
//       'refreshToken': 'abc',
//     },
//     'members': [
//       {
//         'user': {
//           'name': 'Paul 1',
//         },
//       },
//       {
//         'user': {
//           'name': 'jon 1',
//         },
//       },
//       {
//         'user': {
//           'name': 'Sean 1',
//         },
//       },
//       {
//         'user': {
//           'name': 'Jay 1',
//         },
//       },
//       {
//         'user': {
//           'name': 'Chris 1',
//         },
//       },
//     ],
//     'admins': [
//       {
//         'user': {
//           'name': 'Parag Gupta',
//         },
//       },
//     ],
//     'address': {
//       "city": "Delhi",
//       "countryCode": "IN",
//       "dependentLocality": "Some Dependent Locality",
//       "line1": "123 Random Street",
//       "line2": "Apartment 456",
//       "postalCode": "110001",
//       "sortingCode": "ABC-123",
//       "state": "Delhi",
//     },
//   },
// );

// Widget createOrgInfoScreen1() {
//   return MaterialApp(
//     navigatorObservers: [],
//     locale: const Locale('en'),
//     supportedLocales: [
//       const Locale('en', 'US'),
//       const Locale('es', 'ES'),
//       const Locale('fr', 'FR'),
//       const Locale('hi', 'IN'),
//       const Locale('zh', 'CN'),
//       const Locale('de', 'DE'),
//       const Locale('ja', 'JP'),
//       const Locale('pt', 'PT'),
//     ],
//     localizationsDelegates: [
//       const AppLocalizationsDelegate(isTest: true),
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     home: OrganisationInfoScreen(
//       orgInfo: mockOrgInfo,
//     ),
//     navigatorKey: locator<NavigationService>().navigatorKey,
//   );
// }

// Widget createOrgInfoScreen2() {
//   return MaterialApp(
//     navigatorObservers: [],
//     locale: const Locale('en'),
//     supportedLocales: [
//       const Locale('en', 'US'),
//       const Locale('es', 'ES'),
//       const Locale('fr', 'FR'),
//       const Locale('hi', 'IN'),
//       const Locale('zh', 'CN'),
//       const Locale('de', 'DE'),
//       const Locale('ja', 'JP'),
//       const Locale('pt', 'PT'),
//     ],
//     localizationsDelegates: [
//       const AppLocalizationsDelegate(isTest: true),
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     home: OrganisationInfoScreen(
//       orgInfo: mockOrgInfo2,
//     ),
//     navigatorKey: locator<NavigationService>().navigatorKey,
//   );
// }

// void main() {
//   setUpAll(() {
//     testSetupLocator();
//     SizeConfig().test();
//     GraphqlConfig().test();
//     registerServices();
//   });
//   group('OrganisationInfoScreen Tests', () {
//     testWidgets('Leave button shows when organization is joined',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         userConfig.currentUser.joinedOrganizations?.add(mockOrgInfo);

//         await tester.pumpWidget(createOrgInfoScreen1());
//         await tester.pumpAndSettle();

//         expect(find.text('Leave'), findsOneWidget);
//         await tester.tap(find.text('Leave'));
//         await tester.pumpAndSettle();

//         expect(find.byIcon(Icons.arrow_back), findsOneWidget);
//         await tester.tap(find.byIcon(Icons.arrow_back));
//         await tester.pumpAndSettle();
//       });
//     });
//     testWidgets('Displays the correct organization info',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen1());
//         await tester.pumpAndSettle();

//         expect(find.text('Org_Name'), findsOneWidget);
//         expect(find.text('aabbcc'), findsOneWidget);
//         expect(find.text('Delhi, IN'), findsOneWidget);
//         expect(find.text('Public'), findsOneWidget);
//         expect(find.byIcon(Icons.lock_open), findsOneWidget);
//       });
//     });
//     testWidgets('for private organisation', (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen2());
//         await tester.pumpAndSettle();

//         expect(find.text('Org_Name'), findsOneWidget);
//         expect(find.text('aabbcc'), findsOneWidget);
//         expect(find.text('Delhi, IN'), findsOneWidget);
//         expect(find.text('Private'), findsOneWidget);
//         expect(find.byIcon(Icons.lock), findsOneWidget);
//       });
//     });

//     testWidgets('Join button shows when organization is not joined',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen2());
//         await tester.pumpAndSettle();

//         expect(find.text('Join'), findsOneWidget);
//         await tester.tap(find.byType(FloatingActionButton));
//         await tester.pumpAndSettle();
//       });
//     });

//     testWidgets('Displays the default image when orgInfo.image is null',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen2());
//         await tester.pumpAndSettle();

//         expect(find.byType(Image), findsOneWidget);
//         expect(find.byKey(const Key('image_container')), findsOneWidget);
//       });
//     });
//     testWidgets('DropDown list for admins more than 2',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen1());
//         await tester.pumpAndSettle();

//         expect(find.text('Admins'), findsOneWidget);
//         expect(find.text('Parag 1'), findsOneWidget);

//         expect(find.text('See all'), findsOneWidget);
//         await tester.tap(find.text('See all'));
//         await tester.pumpAndSettle();

//         expect(find.text('Parag 3'), findsOneWidget);

//         expect(find.byKey(const Key('modalSheetbackBtn')), findsOneWidget);
//         await tester.tap(find.byKey(const Key('modalSheetbackBtn')));
//         await tester.pumpAndSettle();
//       });
//     });
//     testWidgets('DropDown list for members more than 4',
//         (WidgetTester tester) async {
//       mockNetworkImagesFor(() async {
//         await tester.pumpWidget(createOrgInfoScreen2());
//         await tester.pumpAndSettle();

//         expect(find.text('Members'), findsOneWidget);
//         expect(find.text('Paul 1'), findsOneWidget);

//         expect(find.text('See all'), findsOneWidget);
//         await tester.tap(find.text('See all'));
//         await tester.pumpAndSettle();

//         expect(find.text('Chris 1'), findsOneWidget);
//       });
//     });
//   });
// }
