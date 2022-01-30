import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockCallBack extends Mock {
  call();
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
  group("MainScreen ViewModel Tests - ", () {
    setUp(() {
      locator.registerFactory(() => SizeConfig());
      locator<SizeConfig>().test();
    });

    tearDown(() {
      locator.unregister<SizeConfig>();
    });

    final MainScreenViewModel mainTestModel = getModel();

    final TargetFocus testTarget =
        TargetFocus(identify: "TestTarget", keyTarget: mainTestModel.keyBNChat);

    test("When initialized current index should be 0", () {
      expect(mainTestModel.currentIndex, 0);
    });
    group("onTabTapped -", () {
      test(
          "When an index is passed that, current index should equal that index",
          () {
        mainTestModel.onTabTapped(4);
        expect(mainTestModel.currentIndex, 4);
      });

      test("When called function should notify listeners of tab change", () {
        final mockcallback = MockCallBack();

        mainTestModel.addListener(mockcallback);

        mainTestModel.onTabTapped(0);
        verify(mockcallback()).called(1);
      });
    });

    group("initialize", () {
      final context = MockBuildContext();
      setUp(() => registerServices());
      tearDown(() => unregisterServices());

      void runIntialize(
          {required bool fSignUp,
          int mainIndex = 1,
          required MainScreenViewModel model,
          BuildContext? pcontext}) {
        mainTestModel.initialise(
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

        runIntialize(
            fSignUp: fSignup, mainIndex: mainIndex, model: mainTestModel);

        expect(mainTestModel.showAppTour, fSignup);
        expect(mainTestModel.currentIndex, mainIndex);
      });

      test(
          "When fromSignUp is false tourComplete should equal true, tourSkipped and showApptour false",
          () {
        runIntialize(fSignUp: false, model: mainTestModel);
        expect(mainTestModel.tourComplete, true);
        expect(mainTestModel.tourSkipped, false);
        expect(mainTestModel.showAppTour, false);
      });

      test("When fromSignUp is false, App Tour dialog should not be displayed",
          () async {
        final mocknav = getAndRegisterNavigationService();

        // runIntialize(fSignUp: true, model: localmodel);
        mainTestModel.initialise(MockBuildContext(),
            fromSignUp: false, mainScreenIndex: 0);
        print("AppTour ${mainTestModel.showAppTour}");

        // Ensures that navigation service was not called
        verifyZeroInteractions(mocknav);
      });

      test("When fromSignUp is true, App Tour dialog should be displayed",
          () async {
        final mocknav = getAndRegisterNavigationService();
        // final localmodel = getModel();
        // runIntialize(fSignUp: true, model: localmodel);

        //Waits for any delay in navigation being called
        mainTestModel.initialise(MockBuildContext(),
            fromSignUp: true, mainScreenIndex: 0);

        await Future.delayed(const Duration(seconds: 2));
        verifyInteraction(mocknav, mockName: "NavigationService");
      }
          //Ensures that naviagation service was called
          );
    });

    group("showTutorial", () {
      test("When called tutorial coach should be assigned a value", () {
        mainTestModel.showTutorial(
            onClickTarget: (TargetFocus x) {}, onFinish: () {});
        expect(mainTestModel.tutorialCoachMark, isNotNull);
      });
    });

    group("tourHomeTargets", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a testtarget before method is called
        mainTestModel.targets.add(testTarget);
        // mainTestModel.context = MockBuildContext();
        mainTestModel.tourHomeTargets();
        // targets list should not contain testtarget
        expect(mainTestModel.targets.contains(testTarget), false);
      });
    });

    group("tourEventTargets", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        mainTestModel.targets.add(testTarget);

        mainTestModel.tourEventTargets();
        // targets list should not contain target
        expect(mainTestModel.targets.contains(testTarget), false);
      });
    });

    group("tourAddPost", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        mainTestModel.targets.add(testTarget);

        mainTestModel.tourAddPost();
        // targets list should not contain target
        expect(mainTestModel.targets.contains(testTarget), false);
      });
    });
    group("tourChat", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        mainTestModel.targets.add(testTarget);

        mainTestModel.tourChat();
        // targets list should not contain target
        expect(mainTestModel.targets.contains(testTarget), false);
      });
    });

    group("tourProfile", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        mainTestModel.targets.add(testTarget);

        mainTestModel.tourProfile();
        // targets list should not contain target
        expect(mainTestModel.targets.contains(testTarget), false);
      });
    });
  });
}
