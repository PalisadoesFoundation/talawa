// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/theme_switch.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
// import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';
import '../model_tests/app_tour_test.dart';

Widget createAppTourDialog({bool demoMode = true}) => BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: BaseView<MainScreenViewModel>(
            onModelReady: (model2) => model2.initialise(
              context,
              fromSignUp: false,
              mainScreenIndex: 0,
              demoMode: demoMode,
              testMode: true,
            ),
            builder: (context, model2, child) {
              model2.context = context;
              model2.appTour = MockAppTour(model: model2);
              model2.pluginPrototypeData.putIfAbsent(
                "Plugin1",
                () => {
                  "pluginName": "Plugin1",
                  "pluginInstallStatus": true,
                  'icon': Icons.abc,
                  'class': const ChangeThemeTile(),
                },
              );
              model2.fetchAndAddPlugins(context);
              return Scaffold(
                drawer: CustomDrawer(homeModel: model2),
                key: MainScreenViewModel.scaffoldKey,
                body: model2.appTourDialog(context),
              );
            },
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

class MockCallBack extends Mock {
  void call();
}

class MockBuildContext extends Mock implements BuildContext {}

MainScreenViewModel getModel() {
  final model = MainScreenViewModel();
  model.context = MockBuildContext();
  return model;
}

void verifyInteraction(dynamic x, {required String mockName}) {
  // Ensures that navigation service was called
  try {
    verifyZeroInteractions(x);
    //If 0 interactions passes that means mock was not called hence test fails
    throw Exception("Expected interaction but found 0 with $mockName");
  } on TestFailure {
    //If test fails then 1 or more interactions with navigation service hence test passes
    expect(true, true);
  }
}

void main() async {
  final Directory dir = Directory('test/fixtures/core');

  Hive.init(dir.path);
  //   ..registerAdapter(UserAdapter())
  //   ..registerAdapter(OrgInfoAdapter());

  // final userBox = await Hive.openBox<User>('currentUser');
  // final urlBox = await Hive.openBox('url');
  // final orgBox = await Hive.openBox<OrgInfo>('currentOrg');
  final pluginBox = await Hive.openBox('pluginBox');

  final List<Map<String, dynamic>> samplePluginData = [
    {
      "pluginName": "Plugin1",
      "pluginInstallStatus": true,
    },
    // Add more sample plugin data as needed
  ];

  // Store the sample data in the 'plugins' key of 'pluginBox'
  pluginBox.put('plugins', samplePluginData);

  // No need to change
  setUpAll(() {
    locator.registerFactory(() => CustomDrawerViewModel());
    locator.registerFactory(() => MainScreenViewModel());
    locator.registerFactory(() => AppTheme());
    locator.registerSingleton(SizeConfig());
    locator.registerFactory(() => Queries());
    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    locator.unregister<SizeConfig>();
    File('test/fixtures/core/currentorg.hive').delete();
    File('test/fixtures/core/currentorg.lock').delete();
    File('test/fixtures/core/currentuser.hive').delete();
    File('test/fixtures/core/currentuser.lock').delete();
    File('test/fixtures/core/pluginbox.hive').delete();
    File('test/fixtures/core/pluginbox.lock').delete();
  });

  group("MainScreen ViewModel Tests - ", () {
    test("When initialized current index should be 0", () {
      final mainTestModel = getModel();
      expect(mainTestModel.currentPageIndex, 0);
    });
  });

  // May need to change
  group("onTabTapped -", () {
    test("When an index is passed that, current index should equal that index",
        () {
      final mainTestModel = getModel();
      mainTestModel.onTabTapped(4);
      expect(mainTestModel.currentPageIndex, 4);
    });

    test("When called function should notify listeners of tab change", () {
      final mockcallback = MockCallBack();
      final mainTestModel = getModel();
      mainTestModel.addListener(mockcallback);

      mainTestModel.onTabTapped(0);
      verify(mockcallback()).called(1);
    });
  });

  group("initialize", () {
    final context = MockBuildContext();
    SizeConfig().test();
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    void runIntialize({
      required bool fSignUp,
      int mainIndex = 1,
      required MainScreenViewModel model,
      BuildContext? pcontext,
    }) {
      model.initialise(
        pcontext ?? context,
        fromSignUp: fSignUp,
        mainScreenIndex: mainIndex,
      );
    }

    test(
        "MainScreenViewModel showAppTour and currentIndex should equal values passed to fromSignUp and mainScreenIndex",
        () {
      const bool fSignup = true;
      const int mainIndex = 1;
      final mainTestModel = getModel();
      runIntialize(
        fSignUp: fSignup,
        mainIndex: mainIndex,
        model: mainTestModel,
      );

      expect(mainTestModel.showAppTour, fSignup);
      expect(mainTestModel.currentPageIndex, mainIndex);
    });

    test('Test for showHome method', () {
      final model = getModel();

      model.showHome(
        TargetFocus(
          identify: "keyDrawerLeaveCurrentOrg",
          keyTarget: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
        ),
      );
    });

    test(
        "When fromSignUp is false tourComplete should equal true, tourSkipped and showApptour false",
        () {
      final mainTestModel = getModel();
      runIntialize(fSignUp: false, model: mainTestModel);
      expect(mainTestModel.tourComplete, true);
      expect(mainTestModel.tourSkipped, false);
      expect(mainTestModel.showAppTour, false);
    });

    test("When fromSignUp is false, App Tour dialog should not be displayed",
        () async {
      final mocknav = getAndRegisterNavigationService();
      final mainTestModel = getModel();

      mainTestModel.initialise(
        MockBuildContext(),
        fromSignUp: false,
        mainScreenIndex: 0,
      );

      // Ensures that navigation service was not called
      verifyZeroInteractions(mocknav);
    });

    testWidgets('Test for apptour dialog skip action.', (tester) async {
      await tester.pumpWidget(createAppTourDialog());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(CustomAlertDialog), findsOneWidget);

      // await tester.pumpAndSettle();

      final skipBtn = find.textContaining('Skip');

      expect(skipBtn, findsOneWidget);

      await tester.tap(skipBtn);
      await tester.pumpAndSettle(
        const Duration(seconds: 1),
      );
    });

    testWidgets('Test for apptour dialog success action.', (tester) async {
      await tester.pumpWidget(createAppTourDialog());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final mockUserConfig = getAndRegisterUserConfig();
      when(mockUserConfig.loggedIn).thenReturn(true);

      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();

      expect(find.byType(CustomAlertDialog), findsOneWidget);

      final startBtn = find.textContaining('Start').last;

      expect(startBtn, findsOneWidget);

      await tester.tap(startBtn);

      await tester.pumpAndSettle(const Duration(seconds: 2));
    });

    testWidgets('Test for fetchAndAddPlugins when not in demoMode',
        (tester) async {
      final app = createAppTourDialog(demoMode: false);

      await tester.pumpWidget(app);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Test for tourhomeTargets.', (tester) async {
      final model = getAndRegisterUserConfig();
      const val1 = true;
      when(model.loggedIn).thenAnswer((_) => val1);

      // locator.registerFactory(() => CustomDrawerViewModel());

      late final MainScreenViewModel mainScreenModel;
      final app = MaterialApp(
        builder: (context, child) => BaseView<MainScreenViewModel>(
          builder: (context, model2, child) {
            model2.context = context;
            model2.testMode = true;
            mainScreenModel = model2;
            model2.appTour = MockAppTour(model: model2);
            model2.currentPageIndex = 0;
            return Scaffold(
              key: MainScreenViewModel.scaffoldKey,
              drawer: CustomDrawer(homeModel: mainScreenModel),
              body: TextButton(
                onPressed: () {
                  model2.showHome(
                    TargetFocus(
                      identify: "keySHMenuIcon",
                      keyTarget: model2.keySHMenuIcon,
                    ),
                  );
                  model2.tourHomeTargets();
                },
                child: const Text('tour home'),
              ),
            );
          },
        ),
      );

      await tester.pumpWidget(app);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.textContaining('tour home'), findsOneWidget);

      await tester.tap(find.textContaining('tour home'));

      // print(mainScreenModel.targets[1].description);

      // mainScreenModel.targets[5].next!();

      // verify(navigationService.pop());
      // locator.unregister<UserConfig>();
    });

    // testWidgets('Test for tourhomeTargets.', (tester) async {
    //   final model = getAndRegisterUserConfig();
    //   bool val = false;
    //   when(model.loggedIn).thenAnswer((_) => val);

    //   // locator.registerFactory(() => CustomDrawerViewModel());

    //   late final MainScreenViewModel mainScreenModel;
    //   final app =BaseView<MainScreenViewModel>(
    //         builder: (context, model2, child) {
    //           model2.context = context;
    //           model2.testMode = true;
    //           mainScreenModel = model2;
    //           model2.currentPageIndex = 0;
    //           return MaterialApp(
    //             builder:(context, child) => Scaffold(
    //             body: Scaffold(
    //               key: MainScreenViewModel.scaffoldKey,
    //               drawer: CustomDrawer(homeModel: mainScreenModel),
    //               body: TextButton(onPressed: () {
    //             model2.tourHomeTargets();
    //           }, child: const Text('tour home')),
    //             ),
    //           )
    //           );
    //         },

    //   );

    // await tester.pumpWidget(app);

    // await tester.pumpAndSettle(const Duration(seconds: 1));

    // expect(find.textContaining('tour home'), findsOneWidget);

    // await tester.tap(find.textContaining('tour home'));

    // mainScreenModel.targets[4].next!();

    // verify(navigationService.pop());
    // });

    // testWidgets('Test for tourEventTargets.', (tester) async {
    //   final model = getAndRegisterUserConfig();
    //   when(model.loggedIn).thenAnswer((_) => true);

    //   final app = BaseView<MainScreenViewModel>(
    //     builder: (context, model2, child) {
    //       model2.context = context;
    //       model2.testMode = true;
    //       model2.appTour = MockAppTour(model: model2);
    //       model2.currentPageIndex = 1;
    //       return MaterialApp(
    //         builder: (context, child) => Scaffold(
    //           body: TextButton(
    //             onPressed: () {
    //               model2.tourEventTargets();
    //             },
    //             child: const Text('tour event targets'),
    //           ),
    //         ),
    //       );
    //     },
    //   );

    //   await tester.pumpWidget(app);

    //   await tester.pumpAndSettle(const Duration(seconds: 1));

    //   expect(find.textContaining('tour event targets'), findsOneWidget);

    //   await tester.tap(find.textContaining('tour event targets'));
    // });

    testWidgets('Test for tourChats.', (tester) async {
      final model = getAndRegisterUserConfig();
      when(model.loggedIn).thenAnswer((_) => true);

      final app = BaseView<MainScreenViewModel>(
        builder: (context, model2, child) {
          model2.context = context;
          model2.testMode = true;
          model2.appTour = MockAppTour(model: model2);
          model2.currentPageIndex = 1;
          return MaterialApp(
            builder: (context, child) => Scaffold(
              body: TextButton(
                onPressed: () {
                  model2.tourChat();
                },
                child: const Text('tour chat targets'),
              ),
            ),
          );
        },
      );

      await tester.pumpWidget(app);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.textContaining('tour chat targets'), findsOneWidget);

      await tester.tap(find.textContaining('tour chat targets'));
    });

    testWidgets('Test for addPost.', (tester) async {
      final model = getAndRegisterUserConfig();
      when(model.loggedIn).thenAnswer((_) => true);

      final app = MaterialApp(
        builder: (context, child) => BaseView<MainScreenViewModel>(
          builder: (context, model2, child) {
            model2.context = context;
            model2.testMode = true;
            model2.appTour = MockAppTour(model: model2);
            model2.currentPageIndex = 1;
            return Scaffold(
              body: TextButton(
                onPressed: () {
                  model2.tourAddPost();
                },
                child: const Text('tour add post'),
              ),
            );
          },
        ),
      );

      await tester.pumpWidget(app);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.textContaining('tour add post'), findsOneWidget);

      await tester.tap(find.textContaining('tour add post'));
    });

    // testWidgets('Test for profile tour.', (tester) async {
    //   final model = getAndRegisterUserConfig();
    //   when(model.loggedIn).thenAnswer((_) => true);

    //   final app = BaseView<MainScreenViewModel>(
    //     builder: (context, model2, child) {
    //       model2.context = context;
    //       model2.testMode = true;
    //       model2.appTour = MockAppTour(model: model2);
    //       model2.currentPageIndex = 1;
    //       return MaterialApp(
    //         builder: (context, child) => Scaffold(
    //           body: TextButton(
    //             onPressed: () {
    //               model2.tourProfile();
    //             },
    //             child: const Text('tour profile'),
    //           ),
    //         ),
    //       );
    //     },
    //   );

    //   await tester.pumpWidget(app);

    //   await tester.pumpAndSettle(const Duration(seconds: 1));

    //   expect(find.textContaining('tour profile'), findsOneWidget);

    //   await tester.tap(find.textContaining('tour profile'));

    //   // print(mockedModel.targets[5].);
    // });

    // testWidgets('Test for focustarget widget.', (tester) async {
    //   late MainScreenViewModel mockModel = MainScreenViewModel();

    // model.focusTarget( model.keyBNChat, 'not', 'ok').contents[]

    // Widget app = BaseView<AppTheme>(
    //   onModelReady: (model) => model.initialize(),
    //   builder: (context, model, child) {
    //   return MaterialApp(
    //     locale: const Locale('en'),
    //     localizationsDelegates: [
    //       const AppLocalizationsDelegate(isTest: true),
    //       GlobalMaterialLocalizations.delegate,
    //       GlobalWidgetsLocalizations.delegate,
    //     ],
    //     theme: Provider.of<AppTheme>(context).isdarkTheme
    //         ? TalawaTheme.darkTheme
    //         : TalawaTheme.lightTheme,
    //     home: BaseView<MainScreenViewModel>(
    //       onModelReady: (model2) => model2.initialise(context, fromSignUp: false, mainScreenIndex: 0, testMode: true, demoMode: true),
    //       builder: (context, model2, child) {
    //         model2.context = context;
    //         mockModel = model2;
    //         return Scaffold(
    //           body: TextButton(
    //             child: const Text('press me'),
    //             onPressed: () {
    //               model2.tourProfile();
    //               model2.showTutorial(onClickTarget: (targetFocus) {
    //                 return TargetFocus();
    //               }, onFinish: () {
    //                 return TargetFocus();
    //               });
    //             },
    //           ),
    //         );
    //       },
    //     ),
    //     navigatorKey: navigationService.navigatorKey,
    //     onGenerateRoute: router.generateRoute,
    //   );
    // });

    // await tester.pumpWidget(app);
    // await tester.pumpAndSettle();

    // expect(find.text('press me'), findsOneWidget);

    // await tester.tap(find.text('press me'));
    // await tester.pumpAndSettle();

    // print(mockModel.targets);

    // });

    // testWidgets('Test for fetchAndAddPlugins.', (tester) async {

    //   await tester.pumpWidget(createAppTourDialog(demoMode: false,));
    //   await tester.pumpAndSettle(const Duration(seconds: 1));

    // });

    // test("When fromSignUp is true, App Tour dialog should be displayed",
    //     () async {
    //   final mocknav = getAndRegisterNavigationService();
    //   final mainTestModel = getModel();

    //   //Waits for any delay in navigation being called
    //   mainTestModel.initialise(
    //     mainTestModel.context,
    //     fromSignUp: true,
    //     mainScreenIndex: 0,
    //   );

    //   await Future.delayed(const Duration(seconds: 2));

    //   final captured = verify(
    //     (navigationService as MockNavigationService).pushDialog(captureAny),
    //   ).captured;
    //   captured[0].success();
    //   captured[0].secondaryButtonTap();

    //   //Ensures that naviagation service was called
    //   verifyInteraction(mocknav, mockName: "NavigationService");
    // });
    // });

    // group("showTutorial", () {
    //   final mainTestModel = getModel();
    //   test("When called tutorial coach should be assigned a value", () {
    //     mainTestModel.showTutorial(
    //       onClickTarget: (TargetFocus x) {},
    //       onFinish: () {},
    //     );
    //     expect(mainTestModel.tutorialCoachMark, isNotNull);

    //     // mainTestModel.tutorialCoachMark.skip();
    //   });
    // });

    // group("tourHomeTargets", () {
    //   final mainTestModel = getModel();
    //   final TargetFocus testTarget =
    //       TargetFocus(identify: "TestTarget", keyTarget: mainTestModel.keyBNChat);
    //   test("target list should be cleared before adding new targets", () {
    //     //Adding a testtarget before method is called
    //     mainTestModel.targets.add(testTarget);
    //     // mainTestModel.context = MockBuildContext();
    //     mainTestModel.tourHomeTargets();
    //     // targets list should not contain testtarget
    //     expect(mainTestModel.targets.contains(testTarget), false);
    //   });
    // });

    // group("tourEventTargets", () {
    //   final mainTestModel = getModel();
    //   test("target list should be cleared before adding new targets", () {
    //     final TargetFocus testTarget = TargetFocus(
    //       identify: "TestTarget",
    //       keyTarget: mainTestModel.keyBNChat,
    //     );
    //     //Adding a target before method is called
    //     mainTestModel.targets.add(testTarget);

    //     mainTestModel.tourEventTargets();
    //     // targets list should not contain target
    //     expect(mainTestModel.targets.contains(testTarget), false);
    //   });
    // });

    // group("tourAddPost", () {
    //   final mainTestModel = getModel();
    //   test("target list should be cleared before adding new targets", () {
    //     final TargetFocus testTarget = TargetFocus(
    //       identify: "TestTarget",
    //       keyTarget: mainTestModel.keyBNChat,
    //     );
    //     //Adding a target before method is called
    //     mainTestModel.targets.add(testTarget);

    //     mainTestModel.tourAddPost();
    //     // targets list should not contain target
    //     expect(mainTestModel.targets.contains(testTarget), false);
    //   });
    // });
    // group("tourChat", () {
    //   final mainTestModel = getModel();
    //   test("target list should be cleared before adding new targets", () {
    //     final TargetFocus testTarget = TargetFocus(
    //       identify: "TestTarget",
    //       keyTarget: mainTestModel.keyBNChat,
    //     );
    //     //Adding a target before method is called
    //     mainTestModel.targets.add(testTarget);

    //     mainTestModel.tourChat();
    //     // targets list should not contain target
    //     expect(mainTestModel.targets.contains(testTarget), false);
    //   });
    // });

    // group("tourProfile", () {
    //   final mainTestModel = getModel();
    //   test("target list should be cleared before adding new targets", () {
    //     final TargetFocus testTarget = TargetFocus(
    //       identify: "TestTarget",
    //       keyTarget: mainTestModel.keyBNChat,
    //     );
    //     //Adding a target before method is called
    //     mainTestModel.targets.add(testTarget);

    //     mainTestModel.tourProfile();
    //     // targets list should not contain target
    //     expect(mainTestModel.targets.contains(testTarget), false);
    //   });
  });
}
