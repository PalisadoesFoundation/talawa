// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/org_service.dart';

import '../helpers/test_helpers.dart';

/// Tests org_service.dart.
void main() {
  registerServices();

  group('Test OrganizationService', () {
    final OrganizationService organizationService = OrganizationService();
    final dbFunctions = locator<DataBaseMutationFunctions>();

    test('Test getOrgMembersList', () async {
      const String orgId = '123';
      const String query = '''
    query{
      organizations(id: "$orgId"){
        image
        _id
        name
        admins{
          _id
        }
        description
        isPublic
        creator{
          _id
          firstName
          lastName
        }
        members{
          _id
          firstName
          lastName
          image
        }
      }
    }
  ''';

      final List<Map<String, dynamic>> userJsonList = [
        {
          '_id': 'user_id_1',
          'accessToken': ' ',
          'refreshToken': ' ',
          'firstName': 'Some',
          'lastName': 'Name',
        },
        {
          '_id': 'user_id_2',
          'accessToken': ' ',
          'refreshToken': ' ',
          'firstName': 'Name',
          'lastName': 'Some',
        },
      ];

      final QueryResult queryResult = QueryResult.internal(
        parserFn: (map) => '123',
        source: null,
        data: {
          'organizations': [
            {
              'members': userJsonList,
            },
          ],
        },
      );
      when(dbFunctions.gqlAuthMutation(query))
          .thenAnswer((realInvocation) async => queryResult);

      final result = await organizationService.getOrgMembersList(orgId);

      expect(result.length, 2);
      for (int index = 0; index < result.length; index++) {
        final User user = User.fromJson(userJsonList[index], fromOrg: true);

        expect(result[index].id, user.id);
        expect(result[index].authToken, user.authToken);
        expect(result[index].refreshToken, user.refreshToken);
        expect(result[index].firstName, user.firstName);
        expect(result[index].lastName, user.lastName);
      }
    });
  });
}
