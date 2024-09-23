// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
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

class MockLocalMainScreenViewModel extends MainScreenViewModel {
  int stackLength = 0;
  @override
  void tourEventTargets() {
    stackLength++;
    // TODO: implement tourEventTargets
    super.tourEventTargets();
  }

  @override
  void tourProfile() {
    stackLength++;
    // TODO: implement tourProfile
    super.tourProfile();
  }
}

typedef FunctionType = void Function(MainScreenViewModel model2);

Widget createMainScreenViewModelScreen(FunctionType onTap) {
  final GlobalKey<ScaffoldState> key = MainScreenViewModel.scaffoldKey;
  return MaterialApp(
    builder: (context, child) => BaseView<MainScreenViewModel>(
      builder: (context, model2, child) {
        model2.context = context;
        model2.testMode = true;
        model2.appTour = MockAppTour(model: model2);
        model2.currentPageIndex = 0;
        return Scaffold(
          key: key,
          drawer: const Text('drawer123'),
          body: TextButton(
            onPressed: () {
              onTap(model2);
            },
            child: const Text('tour home'),
          ),
        );
      },
    ),
  );
}

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
  final pluginBox = Hive.box('pluginBox');

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

    group('Tests for tour', () {
      late UserConfig model;
      late List<FocusTarget> expectedTargets;
      late Map<String, GlobalKey> keysMap;
      final GlobalKey<ScaffoldState> key = MainScreenViewModel.scaffoldKey;
      setUp(() {
        keysMap = {};
        expectedTargets = [];
        model = getAndRegisterUserConfig();
      });
      testWidgets('Test for tourhomeTargets when userconfig.loggedin is true.',
          (tester) async {
        const val1 = true;
        when(model.loggedIn).thenAnswer((_) => val1);
        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourComplete = true;
            model2.tourHomeTargets();
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            // ignore: avoid_dynamic_calls
            model2.targets[1].next!();
            // ignore: avoid_dynamic_calls
            model2.targets[5].next!();
            keysMap = {
              'keySHOrgName': model2.keySHOrgName,
              'keySHMenuIcon': model2.keySHMenuIcon,
              'keyDrawerCurOrg': MainScreenViewModel.keyDrawerCurOrg,
              'keyDrawerSwitchableOrg':
                  MainScreenViewModel.keyDrawerSwitchableOrg,
              'keyDrawerJoinOrg': MainScreenViewModel.keyDrawerJoinOrg,
              'keyDrawerLeaveCurrentOrg':
                  MainScreenViewModel.keyDrawerLeaveCurrentOrg,
              'keyBNHome': model2.keyBNHome,
              'keySHPinnedPost': model2.keySHPinnedPost,
              'keySHPost': model2.keySHPost,
            };
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(find.text('drawer123'), findsOneWidget);

        expect(expectedTargets.length, 9);

        final List<String> keyNames = keysMap.keys.toList();

        for (int i = 0; i < expectedTargets.length; i++) {
          expect(expectedTargets[i].keyName, keyNames[i]);
          expect(expectedTargets[i].key, keysMap[keyNames[i]]);
          if (i != 1 && i != 4 && i != 5) {
            expect(expectedTargets[i].next, null);
          } else {
            expect(expectedTargets[i].next, isNotNull);
          }
        }
      });
      testWidgets('Whether AppTour is initialized or not', (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);
        late AppTour appTour;

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            appTour = model2.appTour;
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(appTour, isNotNull);
      });

      testWidgets('Test for tourhomeTargets when userconfig.loggedin is false.',
          (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourComplete = true;
            model2.tourHomeTargets(model);
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            // ignore: avoid_dynamic_calls
            model2.targets[4].next!();
            keysMap = {
              'keySHOrgName': model2.keySHOrgName,
              'keySHMenuIcon': model2.keySHMenuIcon,
              'keyDrawerCurOrg': MainScreenViewModel.keyDrawerCurOrg,
              'keyDrawerSwitchableOrg':
                  MainScreenViewModel.keyDrawerSwitchableOrg,
              'keyDrawerJoinOrg': MainScreenViewModel.keyDrawerJoinOrg,
              'keyBNHome': model2.keyBNHome,
              'keySHPinnedPost': model2.keySHPinnedPost,
              'keySHPost': model2.keySHPost,
            };
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(expectedTargets.length, 8);

        final List<String> keyNames = keysMap.keys.toList();

        for (int i = 0; i < expectedTargets.length; i++) {
          expect(expectedTargets[i].keyName, keyNames[i]);
          expect(expectedTargets[i].key, keysMap[keyNames[i]]);
          if (i != 1 && i != 4) {
            expect(expectedTargets[i].next, null);
          } else {
            expect(expectedTargets[i].next, isNotNull);
          }
        }
      });
      testWidgets(
          'Test for tourhomeTargets whether correct function is called when tour is not exited.',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MaterialApp(
              home: Scaffold(
                key: key,
                body: Container(),
              ),
            ),
          ),
        );
        final BuildContext context = tester.element(find.byType(Container));
        final MainScreenViewModel modelForKeys = MainScreenViewModel();
        final MockLocalMainScreenViewModel model =
            MockLocalMainScreenViewModel();
        model.context = context;
        model.testMode = true;
        model.appTour = MockAppTour(model: model);
        model.currentPageIndex = 0;
        model.showHome(
          TargetFocus(
            identify: "keySHMenuIcon",
            keyTarget: modelForKeys.keySHMenuIcon,
          ),
        );
        model.tourHomeTargets();
        expect(model.stackLength, 2);
      });

      testWidgets('Test for tourEventTargets.', (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourComplete = true;
            model2.tourEventTargets();
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            keysMap = {
              'keyBNEvents': model2.keyBNEvents,
              'keySECategoryMenu': model2.keySECategoryMenu,
              'keySEDateFilter': model2.keySEDateFilter,
              'keySECard': model2.keySECard,
              'keySEAdd': model2.keySEAdd,
            };
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(expectedTargets.length, 5);

        final List<String> keyNames = keysMap.keys.toList();

        for (int i = 0; i < expectedTargets.length; i++) {
          expect(expectedTargets[i].keyName, keyNames[i]);
          expect(expectedTargets[i].key, keysMap[keyNames[i]]);
          expect(expectedTargets[i].next, null);
        }
      });

      testWidgets('Test for tourChats.', (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourComplete = true;
            model2.tourChat();
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            // ignore: avoid_dynamic_calls
            keysMap = {'keyBNChat': model2.keyBNChat};
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(expectedTargets.length, 1);

        final List<String> keyNames = keysMap.keys.toList();

        expect(expectedTargets[0].keyName, keyNames[0]);
        expect(expectedTargets[0].key, keysMap[keyNames[0]]);
        expect(expectedTargets[0].next, null);
      });
      testWidgets(
          'Test for tourChat whether correct function is called when tour is not exited.',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MaterialApp(
              home: Scaffold(
                key: key,
                body: Container(),
              ),
            ),
          ),
        );
        final BuildContext context = tester.element(find.byType(Container));
        final MainScreenViewModel modelForKeys = MainScreenViewModel();
        final MockLocalMainScreenViewModel model =
            MockLocalMainScreenViewModel();
        model.context = context;
        model.testMode = true;
        model.appTour = MockAppTour(model: model);
        model.currentPageIndex = 0;
        model.showHome(
          TargetFocus(
            identify: "keySHMenuIcon",
            keyTarget: modelForKeys.keySHMenuIcon,
          ),
        );
        model.tourChat();
        expect(model.stackLength, 1);
      });

      testWidgets('Test for addPost.', (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourComplete = true;
            model2.tourAddPost();
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            // ignore: avoid_dynamic_calls
            keysMap = {'keyBNPost': model2.keyBNPost};
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(expectedTargets.length, 1);

        final List<String> keyNames = keysMap.keys.toList();

        expect(expectedTargets[0].keyName, keyNames[0]);
        expect(expectedTargets[0].key, keysMap[keyNames[0]]);
        expect(expectedTargets[0].next, null);
      });
      testWidgets(
          'Test for tourAddPost whether correct function is called when tour is not exited.',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MaterialApp(
              home: Scaffold(
                key: key,
                body: Container(),
              ),
            ),
          ),
        );
        final BuildContext context = tester.element(find.byType(Container));
        final MainScreenViewModel modelForKeys = MainScreenViewModel();
        final MockLocalMainScreenViewModel model =
            MockLocalMainScreenViewModel();
        model.context = context;
        model.testMode = true;
        model.appTour = MockAppTour(model: model);
        model.currentPageIndex = 0;
        model.showHome(
          TargetFocus(
            identify: "keySHMenuIcon",
            keyTarget: modelForKeys.keySHMenuIcon,
          ),
        );
        model.tourAddPost();
        expect(model.stackLength, 1);
      });

      testWidgets('Test for profile tour.', (tester) async {
        const val1 = false;
        when(model.loggedIn).thenAnswer((_) => val1);
        late MainScreenViewModel mainScreenViewModel;

        await tester.pumpWidget(
          createMainScreenViewModelScreen((model2) {
            model2.showHome(
              TargetFocus(
                identify: "keySHMenuIcon",
                keyTarget: model2.keySHMenuIcon,
              ),
            );
            model2.tourProfile();
            for (int i = 0; i < model2.targets.length; i++) {
              expectedTargets.add(model2.targets[i]);
            }
            keysMap = {
              'keyBNProfile': model2.keyBNProfile,
              'keySPAppSetting': model2.keySPAppSetting,
              'keySPHelp': model2.keySPHelp,
              'keySPDonateUs': model2.keySPDonateUs,
              'keySPPalisadoes': model2.keySPPalisadoes,
            };
            mainScreenViewModel = model2;
          }),
        );

        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.textContaining('tour home'), findsOneWidget);

        await tester.tap(find.textContaining('tour home'));

        await tester.pump();

        expect(expectedTargets.length, 5);

        final List<String> keyNames = keysMap.keys.toList();

        for (int i = 0; i < expectedTargets.length; i++) {
          expect(expectedTargets[i].keyName, keyNames[i]);
          expect(expectedTargets[i].key, keysMap[keyNames[i]]);
          expect(expectedTargets[i].next, null);
        }
        expect(mainScreenViewModel.currentPageIndex, 0);
        expect(mainScreenViewModel.tourComplete, true);
      });
    });
  });
}
