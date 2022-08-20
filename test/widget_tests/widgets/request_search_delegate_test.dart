import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/request_view_model/request_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/request_card.dart';
import 'package:talawa/widgets/request_search_delegate.dart';

import '../../helpers/test_helpers.dart';

Widget createRequestSearch() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: Scaffold(
      body: BaseView<RequestViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: RequestSearch(
                  requestList: model.requests,
                  requestViewModel: model,
                ),
              );
            },
            icon: const Icon(Icons.search),
          );
        },
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

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('Test for RequestSearch Delegate', () {
    testWidgets('Check if RequestSearch shows up', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createRequestSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        expect(find.byIcon(Icons.clear), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
        expect(find.byType(RequestCard), findsOneWidget);
      });
    });
    testWidgets('Check if back button works fine', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createRequestSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final x = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        );
        await tester.tap(x.first);
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.arrow_back), findsNothing);
      });
    });

    testWidgets('Check if typing in textfield works', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createRequestSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'te');
        await tester.pumpAndSettle();

        // expect(find.byType(RequestCard), findsOneWidget);

        await tester.enterText(textfield, 'teste');
        await tester.pumpAndSettle();

        expect(find.byType(RequestCard), findsNothing);
      });
    });
    testWidgets('Check if clear button works fine', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createRequestSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final x = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        );

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'test');
        await tester.pumpAndSettle();

        await tester.tap(x.last);
        await tester.pumpAndSettle();
        final textWidget = tester.firstWidget(textfield);
        expect((textWidget as TextField).controller!.text, '');

        await tester.tap(x.last);
        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.clear), findsNothing);
      });
    });

    testWidgets('Check if tapping on request card works', (tester) async {
      mockNetworkImagesFor(() async {
        locator.unregister<NavigationService>();
        locator.registerSingleton(NavigationService());

        await tester.pumpWidget(createRequestSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'te');
        await tester.pumpAndSettle();

        final requestCardFinder = find.byType(RequestCard);
        await tester.tap(requestCardFinder);
        await tester.pumpAndSettle();

        expect(find.byType(BottomSheet), findsOneWidget);
      });
    });
  });
}
