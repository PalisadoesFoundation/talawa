import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/join_organisation_after_auth.dart';
import 'package:talawa/widgets/organization_list.dart';
import 'package:talawa/widgets/organization_search_list.dart';

import 'join_org_after_auth_test.mocks.dart';

@GenerateMocks([SelectOrganizationViewModel])

void main(){

  MockSelectOrganizationViewModel mockSelectOrganizationViewModel=MockSelectOrganizationViewModel();
  final String mockOrgId="Test id";

  setUp((){

  });

  group('join_organisation_after_auth.dart tests', () {
    testWidgets('Widget render successfully', (widgetTester) async{
      widgetTester.pumpWidget(
          MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: JoinOrganisationAfterAuth(orgId: mockOrgId),
          )
      );
      await widgetTester.pumpAndSettle();
      expect(find.text('Join Organisation'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      if(mockSelectOrganizationViewModel.searching){
        expect(OrganizationSearchList(model:mockSelectOrganizationViewModel), findsOneWidget);
      }else{
        expect(OrganizationList(model: mockSelectOrganizationViewModel), findsOneWidget);
      }
      expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);
    });

    testWidgets("function scanQR is called successfully", (widgetTester) async{
      widgetTester.pumpWidget(
          MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: JoinOrganisationAfterAuth(orgId: mockOrgId),
          )
      );
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byIcon(Icons.qr_code_scanner));
      Builder(builder: (BuildContext context){
        verify(JoinOrganisationAfterAuth(orgId: mockOrgId).scanQR(context, mockSelectOrganizationViewModel)).called(1);
        return Container();
      });
    });

  });

}