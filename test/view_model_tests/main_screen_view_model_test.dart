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

class MockTutorialCoach extends Mock implements TutorialCoachMark {}

MainScreenViewModel getModel() {
  final model = MainScreenViewModel();
  return model;
}

void main() {
  void verifyInteraction(dynamic x, {required String mockName}) {
    // Ensures that navigation service was called
    try {
      verifyZeroInteractions(x);
      //If 0 interactions passes that means navigation service with app tour dialog was not called hence test fails
      throw Exception("Expected interaction but found 0 with $mockName");
    } on TestFailure {
      //If test fails then 1 or more interactions with navigation service hence test passes
      expect(true, true);
    }
  }

  group("MainScreen ViewModel Tests - ", () {
    setUp(() {
      locator.registerFactory(() => SizeConfig());
      locator<SizeConfig>().test();
    });

    tearDown(() {
      locator.unregister<SizeConfig>();
    });

    MainScreenViewModel model = getModel();
    model.context = MockBuildContext();
    final TargetFocus testTarget =
        TargetFocus(identify: "TestTarget", keyTarget: model.keyBNChat);
    test("When initialized current index should be 0", () {
      expect(model.currentIndex, 0);
    });
    group("onTabTapped -", () {
      test(
          "When an index is passed that, current index should equal that index",
          () {
        model.onTabTapped(4);
        expect(model.currentIndex, 4);
      });

      test("When called function should notify listeners of tab change", () {
        final mockcallback = MockCallBack();

        model.addListener(mockcallback);

        model.onTabTapped(0);
        verify(mockcallback()).called(1);
      });
    });

    group("initialize", () {
      final context = MockBuildContext();
      setUp(() => registerServices());
      tearDown(() => unregisterServices());

      void runIntialize({required bool fSignUp, int mainIndex = 1}) {
        model = getModel();
        model.initialise(
          context,
          fromSignUp: fSignUp,
          mainScreenIndex: mainIndex,
        );
      }

      test(
          "MainScreenViewModel showAppTour and currentIndex should equal values passed to fromSignUp and mainScreenIndex",
          () {
        const bool fSignup = true;
        const int mainIndex = 1;

        runIntialize(fSignUp: fSignup, mainIndex: mainIndex);

        expect(model.showAppTour, fSignup);
        expect(model.currentIndex, mainIndex);
      });

      test(
          "When fromSignUp is false tourComplete should equal true and tourSkipped false",
          () {
        runIntialize(fSignUp: false);
        expect(model.tourComplete, true);
        expect(model.tourSkipped, false);
      });

      test("When fromSignUp is false, App Tour dialog should not be displayed",
          () async {
        final mocknav = getAndRegisterNavigationService();
        runIntialize(fSignUp: false);
        //Waits for any delay in navigation being called
        await Future.delayed(const Duration(seconds: 2));

        // Ensures that navigation service was not called
        verifyZeroInteractions(mocknav);
      });

      test("When fromSignUp is true, App Tour dialog should be displayed",
          () async {
        final mocknav = getAndRegisterNavigationService();
        runIntialize(fSignUp: true);
        //Waits for any delay in navigation being called
        await Future.delayed(const Duration(seconds: 2));
        //Ensures that naviagation service was called
        verifyInteraction(mocknav, mockName: "NavigationService");
      });
    });

    group("showTutorial", () {
      test("When called tutorial coach should be assigned a value", () {
        model.showTutorial(onClickTarget: (TargetFocus x) {}, onFinish: () {});
        expect(model.tutorialCoachMark, isNotNull);
      });
    });

    group("tourHomeTargets", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a testtarget before method is called
        model.targets.add(testTarget);
        // model.context = MockBuildContext();
        model.tourHomeTargets();
        // targets list should not contain testtarget
        expect(model.targets.contains(testTarget), false);
      });
    });

    group("tourEventTargets", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        model.targets.add(testTarget);

        model.tourEventTargets();
        // targets list should not contain target
        expect(model.targets.contains(testTarget), false);
      });
    });

    group("tourAddPost", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        model.targets.add(testTarget);

        model.tourAddPost();
        // targets list should not contain target
        expect(model.targets.contains(testTarget), false);
      });
    });
    group("tourChat", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        model.targets.add(testTarget);

        model.tourChat();
        // targets list should not contain target
        expect(model.targets.contains(testTarget), false);
      });
    });

    group("tourProfile", () {
      test("target list should be cleared before adding new targets", () {
        //Adding a target before method is called
        model.targets.add(testTarget);

        model.tourProfile();
        // targets list should not contain target
        expect(model.targets.contains(testTarget), false);
      });
    });
  });
}
