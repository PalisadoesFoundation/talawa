// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBox<T> extends Mock implements Box<T> {}

class MockUser extends Mock implements User {
  @override
  void updateJoinedOrg(List<OrgInfo> orgList) {
    // TODO: implement updateJoinedOrg
  }

  @override
  void updateMemberRequestOrg(List<OrgInfo> orgList) {
    // TODO: implement updateMemberRequestOrg
  }
}

void main() async {
  setUp(() {
    testSetupLocator();
    registerServices();
  });

  final Directory dir = Directory('test/fixtures/core');

  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  final userBox = await Hive.openBox<User>('currentUser');
  final urlBox = await Hive.openBox('url');
  final orgBox = await Hive.openBox<OrgInfo>('currentOrg');

  group('Test UserConfig service', () {
    test('Test for User log out.', () async {
      databaseFunctions.init();

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) async {
        final data = {
          'logout': true,
        };
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.logout())),
        );
      });

      when(navigationService.pop()).thenAnswer((realInvocation) async {});
      when(
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LogoutProgress'),
          ),
        ),
      ).thenAnswer((realInvocation) async {});

      bool loggedOut = await UserConfig().userLogOut();

      expect(loggedOut, true);

      verify(navigationService.pop());
      expect(userBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
      expect(orgBox.isEmpty, true);

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) async {
        throw Exception('test exception');
      });

      loggedOut = await UserConfig().userLogOut();
      expect(loggedOut, false);
    });
  });
}
