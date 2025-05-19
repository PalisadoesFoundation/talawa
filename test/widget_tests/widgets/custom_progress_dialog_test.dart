// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';

Widget createCustomProgressDialog() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: const Scaffold(
      body: SingleChildScrollView(
        child: CustomProgressDialog(
          key: Key('testing'),
        ),
      ),
    ),
  );
}

void main() {
  SizeConfig().test();

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() async {
    unregisterViewModels();
    unregisterServices();
  });
  group('Test for CustomProgressDialog', () {
    testWidgets(
      'Check if dialog has correct styling and layout',
      (tester) async {
        await tester.pumpWidget(createCustomProgressDialog());
        await tester.pump();

        // Find the main container
        final containerFinder = find.byType(Container).first;
        final Container container = tester.widget(containerFinder);

        // Verify container decoration
        final BoxDecoration decoration = container.decoration! as BoxDecoration;
        expect(decoration.borderRadius, BorderRadius.circular(15));

        // Verify margins
        expect(
          container.margin,
          EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.25,
            vertical: SizeConfig.screenHeight! * 0.35,
          ),
        );
      },
    );

    testWidgets(
        'Check if CupertinoActivityIndicator widget shows up when connection available',
        (tester) async {
      // Build the widget
      await tester.pumpWidget(createCustomProgressDialog());
      await tester.pump();
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    });

    testWidgets(
      'Check if activity indicator has correct size',
      (tester) async {
        await tester.pumpWidget(createCustomProgressDialog());
        await tester.pump();

        final indicatorFinder = find.byType(CupertinoActivityIndicator);
        final CupertinoActivityIndicator indicator =
            tester.widget(indicatorFinder);

        expect(indicator.radius, SizeConfig.screenWidth! * 0.065);
      },
    );

    testWidgets(
      'Check if no internet message shows when connection not available',
      (tester) async {
        // Set connectivity to false
        AppConnectivity.isOnline = false;

        await tester.pumpWidget(createCustomProgressDialog());
        await tester.pumpAndSettle();

        // Verify no internet image and text are displayed
        expect(find.byType(CupertinoActivityIndicator), findsNothing);
        expect(find.byType(Column), findsOneWidget);
        expect(
          find.text('No Internet!'),
          findsOneWidget,
        );
        expect(
          find.byType(Container),
          findsWidgets,
        );
      },
    );

    testWidgets(
      'Check if no internet image has correct size and alignment',
      (tester) async {
        // Set connectivity to false
        AppConnectivity.isOnline = false;
        await tester.pumpWidget(createCustomProgressDialog());
        await tester.pumpAndSettle();

        // Find the image container
        final imageFinder = find.byType(Container).at(1);
        final Container imageContainer = tester.widget(imageFinder);

        // Verify container properties
        expect(imageContainer.alignment, Alignment.bottomCenter);
        expect(
          imageContainer.constraints!.biggest.width,
          SizeConfig.screenWidth! * 0.4,
        );
        expect(
          imageContainer.constraints!.biggest.height,
          SizeConfig.screenWidth! * 0.4,
        );
        expect(
          (imageContainer.decoration! as BoxDecoration).image!.image,
          const AssetImage('assets/images/no_internet.png'),
        );
      },
    );
  });
}
