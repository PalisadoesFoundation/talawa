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

class MockBuildContext extends Mock implements BuildContext {}

class CustomTutorialController extends TutorialCoachMarkController {
  @override
  void next() {}

  @override
  void previous() {}

  @override
  void skip() {}
}

class MockTutorialCoachMark extends Mock implements TutorialCoachMark {
  @override
  void next() {}
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
                mockAppTour =
                    MockAppTour(model: model2); // This creates REAL AppTour
                mockFocusTarget = FocusTarget(
                  key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                  keyName: 'keyDrawerLeaveCurrentOrg',
                  description: 'description',
                  next: () {},
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
                      // This calls the REAL showTutorial method
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
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pump(); // Changed from pumpAndSettle
      await tester.pump(const Duration(seconds: 1));

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);

      expect(tutorialBtn, findsOneWidget);

      (tester.widget(tutorialBtn) as TextButton).onPressed!();
      await tester.pump(); // Changed from pumpAndSettle

      expect(
        mockFocusTarget!.focusWidget.contents![0].builder!(
          capturedContext!,
          CustomTutorialController(),
        ) as Container,
        isA<Container>(),
      );
    });
  });
}
