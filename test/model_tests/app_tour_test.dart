import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../temp_test.dart';

class MockTutorialCoachMark extends Mock implements TutorialCoachMark {}

/// A testable version of AppTour that allows mocking the TutorialCoachMark creation
class TestableAppTour extends AppTour {
  TestableAppTour({required super.model});

  TutorialCoachMark? mockTutorialCoachMark;

  /// Override to return a mock instead of creating the real TutorialCoachMark
  @override
  TutorialCoachMark createTutorialCoachMark({
    required Function(TargetFocus) onClickTarget,
    required dynamic Function() onFinish,
    required List<FocusTarget> targets,
  }) {
    if (mockTutorialCoachMark != null) {
      return mockTutorialCoachMark!;
    }
    // Call the real implementation to test the actual code
    return super.createTutorialCoachMark(
      onClickTarget: onClickTarget,
      onFinish: onFinish,
      targets: targets,
    );
  }
}

class MockAppTour extends Mock implements AppTour {
  MockAppTour({
    required this.model,
  });

  @override
  TutorialCoachMark get tutorialCoachMark => MockTutorialCoachMark();

  @override
  void showTutorial({
    required Function(TargetFocus p1) onClickTarget,
    required Function() onFinish,
    required List<FocusTarget> targets,
  }) {
    onFinish();
    onClickTarget(
      TargetFocus(
        identify: MainScreenViewModel.keyDrawerCurOrg,
        keyTarget: MainScreenViewModel.keyBNChat,
      ),
    );
  }

  @override
  MainScreenViewModel model;
}

/// Creates a MaterialApp widget with the given home widget and common localizations.
///
/// **params**:
/// * `home`: The home widget of the MaterialApp.
///
/// **returns**:
/// * `MaterialApp`: The MaterialApp widget.
///

void main() {
  setUpAll(() {
    setupLocator();
    sizeConfig.test();
  });

  group('Tests for FocusTarget', () {
    testWidgets('Test for first TargetContent builder in FocusTarget model.',
        (tester) async {
      AppTour? mockAppTour;
      FocusTarget? mockFocusTarget;
      BuildContext? capturedContext;
      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                capturedContext = context;
                mockAppTour = AppTour(model: model2);
                mockFocusTarget = FocusTarget(
                  key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  keyName: 'keyDrawerLeaveCurrentOrg',
                  description: 'description',
                  next: () {},
                  appTour: mockAppTour!,
                );
                // SizeConfig().init(context);
                model2.context = context;
                return Scaffold(
                  drawer: const Drawer(),
                  key: MainScreenViewModel.scaffoldKey,
                  body: TextButton(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                    child: const Text('tutorial'),
                    onPressed: () {
                      MainScreenViewModel.scaffoldKey.currentState!
                          .openDrawer();
                      mockAppTour!.showTutorial(
                        onClickTarget: (x) {},
                        onFinish: () {},
                        targets: <FocusTarget>[
                          mockFocusTarget!,
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
            // onGenerateRoute: router.generateRoute,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);

      expect(tutorialBtn, findsOneWidget);

      // Don't call onPressed to avoid creating TutorialCoachMark timers
      // Just test the builder directly
      expect(
        mockFocusTarget!.focusWidget.contents![0].builder!(
          capturedContext!,
          CustomTutorialController(),
        ) as Container,
        isA<Container>(),
      );
    });

    testWidgets('Test for showTutorial method.', (tester) async {
      AppTour? mockAppTour;
      FocusTarget? mockFocusTarget;
      BuildContext? capturedContext;
      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                capturedContext = context;
                mockAppTour = AppTour(model: model2);
                mockFocusTarget = FocusTarget(
                  key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  keyName: 'keyDrawerLeaveCurrentOrg',
                  description: 'description',
                  next: () {},
                  appTour: mockAppTour!,
                );
                // SizeConfig().init(context);
                model2.context = context;
                return Scaffold(
                  drawer: const Drawer(),
                  key: MainScreenViewModel.scaffoldKey,
                  body: TextButton(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                    child: const Text('tutorial'),
                    onPressed: () {
                      MainScreenViewModel.scaffoldKey.currentState!
                          .openDrawer();
                      mockAppTour!.showTutorial(
                        onClickTarget: (x) {},
                        onFinish: () {},
                        targets: <FocusTarget>[
                          mockFocusTarget!,
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
            // onGenerateRoute: router.generateRoute,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);

      expect(tutorialBtn, findsOneWidget);

      // Create a mock TutorialCoachMark to test callbacks without showing it
      final mockTutorialCoachMark = MockTutorialCoachMark();
      mockAppTour!.tutorialCoachMark = mockTutorialCoachMark;

      // Test onSkip callback - just ensure it's callable
      expect(() => mockAppTour!.tutorialCoachMark.onSkip, returnsNormally);

      // Test onClickOverlay callback - just ensure it's callable
      expect(
          () => mockAppTour!.tutorialCoachMark.onClickOverlay, returnsNormally);

      // Test the second builder's GestureDetector
      (mockFocusTarget!.focusWidget.contents![1].builder!(
        capturedContext!,
        CustomTutorialController(),
      ) as GestureDetector)
          .onTap!();
    });

    testWidgets('Test cases for FocusTarget: circle shape and isEnd COMPLETE',
        (tester) async {
      AppTour? mockAppTour;
      FocusTarget? mockFocusTarget;
      BuildContext? capturedContext;

      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                capturedContext = context;
                mockAppTour = AppTour(model: model2);
                mockFocusTarget = FocusTarget(
                  key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  keyName: 'keyDrawerLeaveCurrentOrg',
                  description: 'description',
                  next: null, // explicitly null to test safe handling
                  appTour: mockAppTour!,
                  isCircle: true,
                  isEnd: true,
                );
                model2.context = context;
                return Scaffold(
                  drawer: const Drawer(),
                  key: MainScreenViewModel.scaffoldKey,
                  body: TextButton(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                    child: const Text('tutorial'),
                    onPressed: () {
                      MainScreenViewModel.scaffoldKey.currentState!
                          .openDrawer();
                      mockAppTour!.showTutorial(
                        onClickTarget: (x) {},
                        onFinish: () {},
                        targets: <FocusTarget>[mockFocusTarget!],
                      );
                    },
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);
      expect(tutorialBtn, findsOneWidget);

      // Don't call onPressed to avoid creating TutorialCoachMark timers
      // But we need to initialize tutorialCoachMark for the onTap handler
      mockAppTour!.tutorialCoachMark = MockTutorialCoachMark();

      // first builder returns a Container
      final first = mockFocusTarget!.focusWidget.contents![0].builder!(
          capturedContext!, CustomTutorialController());
      expect(first, isA<Container>());

      // second builder should return a GestureDetector whose child Text is 'COMPLETE'
      final second = mockFocusTarget!.focusWidget.contents![1].builder!(
          capturedContext!, CustomTutorialController());
      expect(second, isA<GestureDetector>());
      final detector = second as GestureDetector;
      // Ensure tapping doesn't throw even when next is null
      detector.onTap!();
    });

    testWidgets(
        'Test case for next callback invoked and tutorialCoachMark.next called',
        (tester) async {
      // We'll spy on the tutorialCoachMark.next call by injecting a mock
      final mockTutorial = MockTutorialCoachMark();

      AppTour? mockAppTour;
      FocusTarget? mockFocusTarget;
      BuildContext? capturedContext;

      var invoked = false;

      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                capturedContext = context;
                mockAppTour = AppTour(model: model2);
                // replace underlying tutorialCoachMark with our mock
                mockAppTour!.tutorialCoachMark = mockTutorial;

                mockFocusTarget = FocusTarget(
                  key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  keyName: 'keyDrawerLeaveCurrentOrg',
                  description: 'description',
                  next: () {
                    invoked = true;
                  },
                  appTour: mockAppTour!,
                );

                model2.context = context;
                return Scaffold(
                  drawer: const Drawer(),
                  key: MainScreenViewModel.scaffoldKey,
                  body: TextButton(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                    child: const Text('tutorial'),
                    onPressed: () {
                      MainScreenViewModel.scaffoldKey.currentState!
                          .openDrawer();
                      mockAppTour!.showTutorial(
                        onClickTarget: (x) {},
                        onFinish: () {},
                        targets: <FocusTarget>[mockFocusTarget!],
                      );
                    },
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);
      expect(tutorialBtn, findsOneWidget);

      // Directly invoke the second builder and trigger onTap; avoid calling showTutorial
      final second = mockFocusTarget!.focusWidget.contents![1].builder!(
          capturedContext!, CustomTutorialController()) as GestureDetector;
      second.onTap!();

      // Verify the next callback executed and tutorialCoachMark.next called
      expect(invoked, isTrue);
      verify(mockTutorial.next()).called(1);
    });

    testWidgets(
        'Test createTutorialCoachMark method covers all uncovered lines',
        (tester) async {
      TestableAppTour? testableAppTour;
      FocusTarget? focusTarget;
      MainScreenViewModel? viewModel;

      var onClickTargetCalled = false;
      var onFinishCalled = false;

      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                viewModel = model2;
                model2.context = context;
                return Scaffold(
                  key: MainScreenViewModel.scaffoldKey,
                  drawer: const Drawer(),
                  body: Container(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();

      // Create TestableAppTour
      testableAppTour = TestableAppTour(model: viewModel!);
      focusTarget = FocusTarget(
        key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
        keyName: 'keyDrawerLeaveCurrentOrg',
        description: 'Test description',
        next: () {},
        appTour: testableAppTour,
      );

      // Test the createTutorialCoachMark method directly (this covers lines 35-77)
      final tutorialCoachMark = testableAppTour.createTutorialCoachMark(
        onClickTarget: (target) {
          onClickTargetCalled = true;
        },
        onFinish: () {
          onFinishCalled = true;
        },
        targets: <FocusTarget>[focusTarget],
      );

      // Verify the TutorialCoachMark was created with correct configuration
      expect(tutorialCoachMark, isNotNull);
      expect(tutorialCoachMark.targets.length, equals(1));
      expect(tutorialCoachMark.textSkip, equals("SKIP"));
      expect(tutorialCoachMark.paddingFocus, equals(10));
      expect(tutorialCoachMark.opacityShadow, equals(1.0));

      // Test onFinish callback (line 55)
      tutorialCoachMark.onFinish!();
      expect(onFinishCalled, isTrue);

      // Test onClickTarget callback (line 56)
      tutorialCoachMark.onClickTarget!(TargetFocus(
        identify: 'test',
        keyTarget: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
      ));
      expect(onClickTargetCalled, isTrue);

      // Test onSkip callback (lines 57-65)
      expect(viewModel!.tourSkipped, isFalse);
      final skipResult = tutorialCoachMark.onSkip!();
      expect(skipResult, isTrue);
      expect(viewModel!.tourSkipped, isTrue);

      // Test onClickOverlay callback (lines 66-68)
      // Reset the flag to test onClickOverlay
      onClickTargetCalled = false;
      tutorialCoachMark.onClickOverlay!(TargetFocus(
        identify: 'overlay-test',
        keyTarget: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
      ));
      // The onClickOverlay should call onClickTarget again
      expect(onClickTargetCalled, isTrue);
    });

    testWidgets(
        'Test showTutorial method calls createTutorialCoachMark and show',
        (tester) async {
      TestableAppTour? testableAppTour;
      FocusTarget? focusTarget;
      MainScreenViewModel? viewModel;

      final mockTutorialCoachMark = MockTutorialCoachMark();

      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                viewModel = model2;
                model2.context = context;
                return Scaffold(
                  key: MainScreenViewModel.scaffoldKey,
                  drawer: const Drawer(),
                  body: Container(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();

      // Create TestableAppTour with mock
      testableAppTour = TestableAppTour(model: viewModel!);
      testableAppTour.mockTutorialCoachMark = mockTutorialCoachMark;

      focusTarget = FocusTarget(
        key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
        keyName: 'keyDrawerLeaveCurrentOrg',
        description: 'Test description',
        next: () {},
        appTour: testableAppTour,
      );

      // Test showTutorial method (covers lines 30, 35, 40)
      testableAppTour.showTutorial(
        onClickTarget: (target) {},
        onFinish: () {},
        targets: <FocusTarget>[focusTarget],
      );

      // Verify tutorialCoachMark was assigned (line 35)
      expect(testableAppTour.tutorialCoachMark, equals(mockTutorialCoachMark));

      // Verify show() was called (line 40)
      verify(mockTutorialCoachMark.show(context: viewModel!.context)).called(1);
    });

    testWidgets('Test onSkip callback with drawer open scenario',
        (tester) async {
      TestableAppTour? testableAppTour;
      FocusTarget? focusTarget;
      MainScreenViewModel? viewModel;

      final app = BaseView<AppLanguage>(
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
                demoMode: true,
                testMode: true,
              ),
              builder: (context, model2, child) {
                viewModel = model2;
                model2.context = context;
                return Scaffold(
                  key: MainScreenViewModel.scaffoldKey,
                  drawer: const Drawer(),
                  body: Container(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump();

      // Create TestableAppTour
      testableAppTour = TestableAppTour(model: viewModel!);
      focusTarget = FocusTarget(
        key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
        keyName: 'keyDrawerLeaveCurrentOrg',
        description: 'Test description',
        next: () {},
        appTour: testableAppTour,
      );

      // First open the drawer
      MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
      await tester.pump();

      // Create TutorialCoachMark to test onSkip with drawer open
      final tutorialCoachMark = testableAppTour.createTutorialCoachMark(
        onClickTarget: (target) {},
        onFinish: () {},
        targets: <FocusTarget>[focusTarget],
      );

      // Test onSkip callback with drawer open (covers line 74)
      final skipResult = tutorialCoachMark.onSkip!();
      expect(skipResult, isTrue);
      expect(viewModel!.tourSkipped, isTrue);
    });
  });
}
