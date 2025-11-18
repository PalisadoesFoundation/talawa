// Tests for AppTour and FocusTarget widgets
// Making sure the tutorial flows work correctly and handle user interactions properly

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart' as app_locator;
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../fakes/fake_tutorial_classes.dart';
import '../mocks/mock_tutorial_coach_mark.dart';

void main() {
  // Need this for widget tests to work
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    // Clear any existing services and set up fresh ones for each test
    await app_locator.locator.reset();
    app_locator.locator.registerSingleton<NavigationService>(
      FakeNavigationService(),
    );
    app_locator.locator.registerSingleton<SizeConfig>(SizeConfig());
  });

  tearDown(() async {
    // Clean up after each test
    await app_locator.locator.reset();
  });

  group('AppTour.showTutorial()', () {
    testWidgets(
      'should set up tutorial correctly and handle skip/tap actions',
      (tester) async {
        // Set up our test dependencies
        final navigation = app_locator.locator<NavigationService>() as FakeNavigationService;
        late FakeMainScreenViewModel viewModel;
        late BuildContext capturedContext;

        // Build a test widget with proper context
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [
              AppLocalizationsDelegate(isTest: true),
            ],
            supportedLocales: const [
              Locale('en'),
            ],
            home: Builder(
              builder: (context) {
                // Initialize size config and capture context for later use
                SizeConfig().init(context);
                capturedContext = context;
                viewModel = FakeMainScreenViewModel()..context = context;
                return Scaffold(
                  key: viewModel.scaffoldKey,
                  drawer: const Drawer(
                    child: Center(child: Text('drawer')),
                  ),
                  body: const SizedBox.shrink(),
                );
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Create app tour and some test targets
        final appTour = AppTour(model: viewModel);
        final FocusTarget primaryTarget = FocusTarget(
          key: GlobalKey(),
          keyName: 'org-name',
          description: 'Current Organization Name',
          appTour: appTour,
        );

        // Using a mock for one target to test mixed scenarios
        final mockTargetFocus = MockTargetFocus();
        final FocusTarget mockedTarget = FocusTarget(
          key: GlobalKey(),
          keyName: 'mock-target', 
          description: 'Mock target description',
          appTour: appTour,
        )..focusWidget = mockTargetFocus;

        // Track callbacks
        TargetFocus? overlayTarget;
        bool finishCalled = false;

        // Start the tutorial
        appTour.showTutorial(
          onClickTarget: (target) => overlayTarget = target,
          onFinish: () {
            finishCalled = true;
          },
          targets: [primaryTarget, mockedTarget],
        );

        // Let the tutorial initialize
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 50));

        // Verify tutorial setup
        expect(appTour.tutorialCoachMark.targets.length, 2);
        expect(appTour.tutorialCoachMark.targets.first.identify, 'org-name');
        expect(appTour.tutorialCoachMark.targets.last, same(mockTargetFocus));
        expect(appTour.tutorialCoachMark.textSkip, 'SKIP');
        expect(appTour.tutorialCoachMark.opacityShadow, 1.0);
        expect(
          appTour.tutorialCoachMark.colorShadow,
          Theme.of(capturedContext).colorScheme.secondaryContainer,
        );
        expect(appTour.tutorialCoachMark.isShowing, isTrue);

        // Test overlay tap
        final TargetFocus tappedFocus = primaryTarget.focusWidget;
        appTour.tutorialCoachMark.onClickOverlay!(tappedFocus);
        expect(overlayTarget, same(tappedFocus));

        // Test skip flow
        viewModel.scaffoldKey.currentState!.openDrawer();
        await tester.pump();

        final bool skipResult = appTour.tutorialCoachMark.onSkip!.call();
        expect(skipResult, isTrue);
        expect(viewModel.tourSkipped, isTrue);
        expect(viewModel.lastTappedIndex, 0);
        expect(viewModel.tabTapCount, 1);
        expect(navigation.popCalled, isTrue);

        // Test finish callback
        appTour.tutorialCoachMark.onFinish!.call();
        expect(finishCalled, isTrue);

        // Test cleanup
        appTour.tutorialCoachMark.finish();
        await tester.pumpAndSettle(const Duration(milliseconds: 600));
        appTour.tutorialCoachMark.removeOverlayEntry();
        await tester.pumpAndSettle();
        expect(appTour.tutorialCoachMark.isShowing, isFalse);
      },
    );
  });

  group('FocusTarget', () {
    testWidgets(
      'should build content correctly and handle next actions',
      (tester) async {
        late FakeMainScreenViewModel viewModel;
        late BuildContext capturedContext;

        // Set up test environment
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [
              AppLocalizationsDelegate(isTest: true),
            ],
            supportedLocales: const [
              Locale('en'),
            ],
            home: Builder(
              builder: (context) {
                SizeConfig().init(context);
                capturedContext = context;
                viewModel = FakeMainScreenViewModel()..context = context;
                return Scaffold(
                  key: viewModel.scaffoldKey,
                  body: const SizedBox.shrink(),
                );
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Use mock tutorial for this test
        final mockTutorial = MockTutorialCoachMark();
        final appTour = AppTour(model: viewModel)
          ..tutorialCoachMark = mockTutorial;

        bool nextCallbackTriggered = false;
        
        // Create a focus target with various properties
        final FocusTarget focusTarget = FocusTarget(
          key: GlobalKey(),
          keyName: 'detail',
          description: 'Detail Description',
          align: ContentAlign.top,
          crossAlign: CrossAxisAlignment.center,
          skipAlignment: Alignment.bottomLeft,
          nextCrossAlign: CrossAxisAlignment.center,
          isCircle: true,
          isEnd: true,
          next: () {
            nextCallbackTriggered = true;
          },
          appTour: appTour,
        );

        // Test content building
        final List<TargetContent> contents = focusTarget.focusWidget.contents!;
        final FakeTutorialCoachMarkController fakeController = FakeTutorialCoachMarkController();
        final mockController = MockTutorialCoachMarkController();

        // Check description content
        final TargetContent descriptionContent = contents[0];
        final Container descriptionWidget = descriptionContent.builder!(capturedContext, fakeController) as Container;
        final Column descriptionColumn = descriptionWidget.child! as Column;
        final Text descriptionText = descriptionColumn.children.first as Text;
        expect(descriptionText.data, 'Detail Description');
        expect(descriptionColumn.crossAxisAlignment, CrossAxisAlignment.center);

        // Make sure it works with mock controller too
        expect(
          () => descriptionContent.builder!(capturedContext, mockController),
          returnsNormally,
        );

        // Test next button content
        final TargetContent nextContent = contents[1];
        expect(
          nextContent.customPosition!.bottom,
          SizeConfig.screenHeight! * 0.025,
        );

        // Set up mock and test next button
        when(mockTutorial.next()).thenReturn(null);
        final GestureDetector nextButton = nextContent.builder!(capturedContext, fakeController) as GestureDetector;
        final Column nextColumn = nextButton.child as Column;
        final Text nextText = nextColumn.children.first as Text;
        expect(nextText.data, 'COMPLETE');
        expect(nextColumn.crossAxisAlignment, CrossAxisAlignment.center);
        expect(nextButton.onTap, isNotNull);

        // Test next button tap
        nextButton.onTap!();
        expect(nextCallbackTriggered, isTrue);
        verify(mockTutorial.next()).called(1);
        expect(fakeController.nextCount, 0);

        // Verify focus target properties
        expect(focusTarget.focusWidget.shape, ShapeLightFocus.Circle);
        expect(focusTarget.focusWidget.alignSkip, Alignment.bottomLeft);
        expect(focusTarget.focusWidget.identify, 'detail');
        expect(focusTarget.focusWidget.enableOverlayTab, true);
      },
    );
    
    // TODO: Add more tests for different alignments and edge cases
    // testWidgets('should handle bottom alignment correctly', ...
    // testWidgets('should work with different cross alignments', ...
  });
}