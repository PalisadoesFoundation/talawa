import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/apptheme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';
import 'package:talawa/views/base_view.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';
import '../../view_model_tests/pre_auth_view_models/signup_details_view_model_test.dart';

GetIt locator=GetIt.instance;

Widget createAccessRequestScreen(){
  OrgInfo org=OrgInfo(
      name: "Name",
      creatorInfo: User(
          firstName: "First",
          lastName: "Last"
      ),
      isPublic: false
  );
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        home: SendAccessRequest(org: org),
      );
    },
  );
}
final viewModel=MockAccessScreenViewModel();
Widget createTextButton(){
  return MaterialApp(
  home: Scaffold(
  body: TextButton(
  onPressed: () {
  viewModel.sendMembershipRequest();
  },
  style:
  TextButton.styleFrom(backgroundColor: AppTheme.green),
  child: const Text(
  "Request Access",
  style: TextStyle(
  color: AppTheme.white,
  ),
  ),
  ),
  ),
  );

}

void register(){
  registerationForAccessRequestScreenTest();
}

void unregisterclass(){

  unregisterationForAccessRequestScreenTest();

}

void main(){

  testSetupLocator();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp((){
    register();
  });

  tearDown(() {
    unregisterclass();
  });

  group("Tests for access_request_screen.dart", () {
    testWidgets("Check If the SendAccessRequest widget renders", (widgetTester) async{
      await widgetTester.pumpWidget(createAccessRequestScreen());
      await widgetTester.pumpAndSettle(const Duration(seconds: 6));
      expect(find.byType(SendAccessRequest), findsOneWidget);
    });
    testWidgets("Check if children widgets renders", (widgetTester) async{
      await widgetTester.pumpWidget(createAccessRequestScreen());
      await widgetTester.pumpAndSettle(const Duration(seconds: 6));
      expect(
        find.byWidgetPredicate(
              (widget) => widget is SafeArea && widget.child is Scaffold,
        ),
        findsOneWidget,
      );
      expect(find.text('You need access'), findsOneWidget);
      expect(find.text('Request access, or switch to an account with access'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text('Request Access'), findsOneWidget);
    });

    testWidgets("Check if function sendMemberShipRequest is called by TextButton", (widgetTester) async{
      await widgetTester.pumpWidget(createTextButton());
      await widgetTester.pump();
      await widgetTester.tap(find.byType(TextButton));
      verify(viewModel.sendMembershipRequest()).called(1);
    });
  });
}
