import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/utils/queries.dart';

void main() {
  group("Tests for queries.dart", () {
    test("Check if registerUser works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().registerUser(
        'Ayush Chaudhary',
        'ayush@gmail.com',
        'password',
        'orgId123',
      );
      if (fnData.contains('Ayush')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if loginUser works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().loginUser('ayush@gmail.com', 'password');
      if (fnData.contains('ayush@gmail.com')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if logout works correctly", () {
      const mutation = false;
      expect(mutation, false);

      const data = """
        mutation {
          logout
        }
    """;
      final fnData = Queries().logout();
      expect(fnData, data);
    });
    test("Check if fetchJoinInOrg works correctly", () {
      final fnData = Queries();
      final ff = fnData.fetchJoinInOrg;
      const data = """
    query {
      organizations{
        id,
        name,
        addressLine1,
        addressLine2,
        description,
        avatarURL,
        countryCode,
        state,
        isUserRegistrationRequired,
      }
    }
    """;
      expect(data, ff);
    });
    test("Check if fetchJoinInOrgByName works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries();
      final ff = fnData.fetchJoinInOrgByName;
      if (ff.contains('query organizationsConnection')) {
        mutation = true;
      }
      expect(mutation, true);
    });

    test("Check if joinOrgById returns correct GraphQL mutation", () {
      // Get the query string
      final queryString = Queries().joinOrgById();

      // Check that it contains the expected GraphQL operation name
      expect(queryString.contains('JoinPublicOrganization'), true);

      // Check that it contains the expected fields
      expect(queryString.contains('memberId'), true);
      expect(queryString.contains('organizationId'), true);
    });
    test("Check if refreshToken works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().refreshToken('orgId123');
      if (fnData.contains('orgId123')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if fetchOrgById works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().fetchOrgById('orgId123');
      if (fnData.contains('orgId123')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if fetchJoinInOrgByName works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries();
      final ff = fnData.fetchJoinInOrgByName;
      if (ff.contains('query organizationsConnection')) {
        mutation = true;
      }
      expect(mutation, true);
    });

    test("Check if createDonation works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().createDonation(
        'userId',
        'userId',
        'userId',
        'userId',
        'userId',
        12,
      );
      if (fnData.contains('userId')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test(
        'updateUserProfile should return valid GraphQL mutation with all required fields',
        () {
      // Arrange
      final queries = Queries();

      // Act
      final result = queries.updateUserProfile();

      // Assert
      expect(result, isA<String>());
      expect(result, isNotEmpty);
      expect(result, contains('mutation UpdateCurrentUser'));
      expect(result, contains('updateCurrentUser'));
      expect(result, contains('\$emailAddress: EmailAddress'));
      expect(result, contains('\$name: String'));
      expect(result, contains('\$avatar: Upload'));
      expect(result, contains('id'));
      expect(result, contains('name'));
      expect(result, contains('emailAddress'));
      expect(result, contains('avatarURL'));

      // Verify it's valid GraphQL syntax
      expect(() => gql(result), returnsNormally);
    });
    test("Check if venueListQuery works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().venueListQuery();

      if (fnData.contains('GetVenueByOrgId') &&
          fnData.contains('GetVenueByOrgId')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if fetchUsersByOrganizationId works correctly", () {
      const orgId = 'testOrgId123';
      final query = Queries().fetchUsersByOrganizationId(orgId);

      // Verify it's a valid GraphQL query
      expect(query.trim().startsWith('query'), true);

      // Verify the organization ID is properly injected
      expect(query.contains('"$orgId"'), true);

      // Verify the correct query field is used
      expect(query.contains('usersByOrganizationId'), true);

      // Verify all expected fields are requested
      expect(query.contains('id'), true);
      expect(query.contains('name'), true);
      expect(query.contains('avatarURL'), true);
      expect(query.contains('description'), true);
      expect(query.contains('emailAddress'), true);

      // Verify proper GraphQL structure
      expect(query.contains('organizationId:'), true);
      expect(query.contains('{') && query.contains('}'), true);
    });
  });
}
