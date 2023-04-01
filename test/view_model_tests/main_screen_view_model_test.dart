// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
// import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

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

void main() {
  // No need to change
  setUp(() {
    locator.registerFactory(() => SizeConfig());
    locator<SizeConfig>().test();
  });

  tearDown(() {
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
  });

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
  // });
}
