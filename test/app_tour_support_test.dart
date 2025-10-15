import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';

import 'test_support.dart';

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
                    MockAppTour(model: model2); // This creates Mock AppTour
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
                    onPressed: () {},
                  ),
                );
              },
            ),
            navigatorKey: navigationService.navigatorKey,
          );
        },
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      final tutorialBtn =
          find.byKey(MainScreenViewModel.keyDrawerLeaveCurrentOrg);

      expect(tutorialBtn, findsOneWidget);

      // Test the FocusTarget builder with comprehensive assertions
      final builtWidget = mockFocusTarget!.focusWidget.contents![0].builder!(
        capturedContext!,
        CustomTutorialController(),
      );

      // Verify it returns a Container
      expect(builtWidget, isA<Container>());

      final container = builtWidget as Container;

      // Verify the Container has a child Column
      expect(container.child, isA<Column>());

      final column = container.child! as Column;

      // Verify Column properties
      expect(column.mainAxisSize, equals(MainAxisSize.max));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.start));
      expect(column.children.length, equals(1));

      // Verify the Column contains a Text widget
      expect(column.children[0], isA<Text>());

      final textWidget = column.children[0] as Text;

      // Verify the text content matches the description
      expect(textWidget.data, equals('description'));

      // Verify text styling
      expect(textWidget.style, isNotNull);
      expect(textWidget.style!.fontSize, equals(20));
      // Note: Color verification would require theme context, but we can verify structure
    });
  });
}
