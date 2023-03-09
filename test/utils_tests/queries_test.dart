// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/queries.dart';

void main() {
  group("Tests for queries.dart", () {
    test("Check if registerUser works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries()
          .registerUser('Ayush', 'Chaudhary', 'ayush@gmail.com', 'password');
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
    test("Check if saveFcmToken works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().saveFcmToken('token123');
      if (fnData.contains('token123')) {
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
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries();
      final ff = fnData.fetchJoinInOrg;
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

    test("Check if joinOrgById works correctly", () {
      var mutation = false;

      expect(mutation, false);

      final fnData = Queries().joinOrgById('orgId123');
      if (fnData.contains('orgId123')) {
        mutation = true;
      }
      expect(mutation, true);
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
    test("Check if getPluginsList works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().getPluginsList();
      if (fnData.contains('getPlugins')) {
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

    test("Check if getPluginsList works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = Queries().getPluginsList();
      if (fnData.contains('getPlugins')) {
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
  });
}
