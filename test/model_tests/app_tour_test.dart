import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_locator.dart';
import '../router_test.dart';

class CustomTutorialController extends TutorialCoachMarkController {
  @override
  void next() {}

  @override
  void previous() {}

  @override
  void skip() {}
}

void main() {
  testSetupLocator();
  sizeConfig.test();
  // registerServices();

  group('Tests for FocusTarget', () {
    test('Test for TargetContent 1', () async {
      final mockFocusTarget = FocusTarget(
        key: MainScreenViewModel.keyDrawerCurOrg,
        keyName: 'keyName',
        description: 'description',
        appTour: AppTour(
          model: MainScreenViewModel(),
        ),
      );

      mockFocusTarget.focusWidget.contents![0].builder!(
        MockBuildContext(),
        CustomTutorialController(),
      );
    });

    test('Test for TargetContent 2', () async {
      final mockFocusTarget = FocusTarget(
        key: MainScreenViewModel.keyDrawerCurOrg,
        keyName: 'keyName',
        description: 'description',
        appTour: AppTour(model: MainScreenViewModel()),
      );

      mockFocusTarget.focusWidget.contents![1].builder!(
        MockBuildContext(),
        CustomTutorialController(),
      ) as GestureDetector;
    });

    // testWidgets('Test for showTutorial method.', (tester) async {
    //   final mockFocusTarget = FocusTarget(
    //       key: MainScreenViewModel.keyDrawerCurOrg,
    //       keyName: 'keyName',
    //       description: 'description',
    //       next: () {},
    //       appTour: AppTour(model: MainScreenViewModel()));

    //   final app = BaseView<AppLanguage>(
    //   onModelReady: (model) => model.initialize(),
    //   builder: (context, langModel, child) {
    //     return MaterialApp(
    //       locale: const Locale('en'),
    //       localizationsDelegates: [
    //         const AppLocalizationsDelegate(isTest: true),
    //         GlobalMaterialLocalizations.delegate,
    //         GlobalWidgetsLocalizations.delegate,
    //       ],
    //       home: BaseView<MainScreenViewModel>(
    //         onModelReady: (model2) => model2.initialise(
    //           context,
    //           fromSignUp: false,
    //           mainScreenIndex: 0,
    //           demoMode: true,
    //           testMode: true,
    //         ),
    //         builder: (context, model2, child) {
    //           // SizeConfig().init(context);
    //           model2.context = context;
    //           mockFocusTarget.appTour.model = model2;
    //           model2.fetchAndAddPlugins(context);
    //           return Scaffold(
    //             body: TextButton(
    //               key: const Key('tutBtn'),
    //               child: const Text('tutorial'),
    //               onPressed: () {
    //                 mockFocusTarget.appTour.showTutorial(onClickTarget: (x) {

    //   }, onFinish: () {

    //   });
    //               },
    //             ),
    //           );
    //         },
    //       ),
    //       navigatorKey: navigationService.navigatorKey,
    //       // onGenerateRoute: router.generateRoute,
    //     );
    //   },
    // );

    // await tester.pumpWidget(app);
    // await tester.pumpAndSettle(const Duration(seconds: 1));

    // final tutorialBtn = find.byKey(const Key('tutBtn'));

    // expect(tutorialBtn, findsOneWidget);

    // (tester.widget(tutorialBtn) as TextButton).onPressed!();
    // });
  });
}
