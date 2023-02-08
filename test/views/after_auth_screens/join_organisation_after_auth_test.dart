import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_organisation_after_auth.dart';
import 'package:talawa/views/base_view.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createJoinOrgAfterAuth({String orgId = "fake_id"}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: JoinOrganisationAfterAuth(
          orgId: orgId,
        ),
      );
    },
  );
}

void main() {
  testSetupLocator();
  // locator<GraphqlConfig>().test();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group("Tests for JoinOrganizationAfterAuth", () {
    testWidgets(
      "Check if JoinOrganizationsAfterAuth shows up",
      (tester) async {
        await tester.pumpWidget(createJoinOrgAfterAuth());
        await tester.pumpAndSettle();

        expect(find.byType(JoinOrganisationAfterAuth), findsOneWidget);
      },
    );
  });
}
