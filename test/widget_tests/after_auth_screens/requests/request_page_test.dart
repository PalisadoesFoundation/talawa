import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/requests/request_page.dart';

import '../../../helpers/test_helpers.dart';

Widget requestPage() => const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: RequestPage(),
    );

void main() {
  SizeConfig().test();
  registerServices();
  registerViewModels();

  group('RequestPage', () {
    testWidgets('RequestPage UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(requestPage());
      await tester.pump();
      expect(find.byType(RequestPage), findsOneWidget);
    });
  });
}
