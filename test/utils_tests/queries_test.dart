import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/queries.dart';

void main() {
  group("Tests for queries.dart", () {
    test("Check if registerUser works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().registerUser(
        'Ayush',
        'Chaudhary',
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
      }
    }
    """;
      expect(data, ff);
    });
    test("Check if newUserLanguage works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().newUserLanguage('12345');
      if (fnData.contains('12345')) {
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

    test("Check if joinOrgById returns correct GraphQL mutation", () {
      // Get the query string
      final queryString = Queries().joinOrgById();

      // Check that it contains the expected GraphQL operation name
      expect(queryString.contains('JoinPublicOrganization'), true);

      // Check that it contains the expected fields
      expect(queryString.contains('memberId'), true);
      expect(queryString.contains('organizationId'), true);
    });
    test("Check if sendMembershipRequest works correctly", () {
      var mutation = false;

      expect(mutation, false);

      final fnData = Queries().sendMembershipRequest('orgId123');
      if (fnData.contains('orgId123')) {
        mutation = true;
      }
      expect(mutation, true);
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
    test("Check if updateLanguage works correctly", () {
      var mutation = false;

      expect(mutation, false);
      final fnData = Queries().updateLanguage('orgId123');
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
    test("Check if userlanguage works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().userLanguage();
      if (fnData.contains('myLanguage')) {
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

    test("Check if newUserLanguage works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().newUserLanguage('12345');
      if (fnData.contains('12345')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if fetchOrgDetailsById works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().fetchOrgDetailsById('12345');
      if (fnData.contains('12345')) {
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
    test("Check if updateUserProfile works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().updateUserProfile();

      if (fnData.contains('mutation UpdateUserProfile') &&
          fnData.contains('updateUserProfile')) {
        mutation = true;
      }
      expect(mutation, true);
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
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().fetchUsersByOrganizationId('orgId123');
      if (fnData.contains('orgId123') &&
          fnData.contains('usersByOrganizationId')) {
        mutation = true;
      }
      expect(mutation, true);
    });
  });
}
