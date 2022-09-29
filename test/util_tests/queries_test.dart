import 'package:talawa/utils/queries.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Queries ", () {
    test("registerUser should return proper mutation", () {
      final queries = Queries();
      expect(queries.registerUser("firstName", "lastName", "email", "password"),
          equals("""
        mutation{
          signUp(data: {firstName: "firstName", lastName: "lastName", email: "email", password: "password"})
          {
            accessToken
            user{
                _id
                firstName
                lastName
                email
                image
                joinedOrganizations{
                  _id
                  name
                  image
                  description
                  isPublic
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  } 
                }
                createdOrganizations{
                  _id
                  name
                  image
                  description
                  isPublic
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  } 
                }
                membershipRequests{
                  organization{
                    _id
                    name
                    image
                    description
                    isPublic
                    creator{
                      _id
                      firstName
                      lastName
                      image
                    } 
                  }
                }
                adminFor{
                  _id
                }
              }
              refreshToken
            }
        }
    """));
    });
    test("loginUser should return proper mutation", () {
      final queries = Queries();
      expect(queries.loginUser("email", "password"), equals("""
        mutation {
          login(data: {email: "email", password: "password"}){
            accessToken
            user{
              _id
              firstName
              lastName
              email
              image
              joinedOrganizations{
                _id
                name
                image
                description
                isPublic
                creator{
                  _id
                  firstName
                  lastName
                  image
                } 
              }
              createdOrganizations{
                _id
                name
                image
                description
                isPublic
                creator{
                  _id
                  firstName
                  lastName
                  image
                } 
              }
              membershipRequests{
                organization{
                  _id
                  name
                  image
                  description
                  isPublic
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  } 
                }
              }
              adminFor{
                _id
              }
            }
            refreshToken
            androidFirebaseOptions {
              apiKey
              appId
              messagingSenderId
              projectId
              storageBucket
            }
            iosFirebaseOptions {
              apiKey
              appId
              messagingSenderId
              projectId
              storageBucket
              iosClientId
              iosBundleId
            }
          }
        }
    """));
    });
  });
  test("saveFcmToken should return proper mutation", () {
    final queries = Queries();
    expect(queries.saveFcmToken("token"), equals("""
        mutation {
          saveFcmToken(token: "token")
        }
    """));
  });
  test("logout should return proper mutation", () {
    final queries = Queries();
    expect(queries.logout(), equals("""
        mutation {
          logout
        }
    """));
  });
  test("fetchJoinInOrg should return proper mutation", () {
    final queries = Queries();
    expect(queries.fetchJoinInOrg, equals("""
    query organizationsConnection(\$first: Int, \$skip: Int){
      organizationsConnection(
        first: \$first,
        skip: \$skip,
        orderBy: name_ASC
      ){
        image
        _id
        name
        image
        isPublic
        creator{
          firstName
          lastName
        }
      }
    }
"""));
  });
  test("fetchJoinInOrgByName should return proper query", () {
    final queries = Queries();
    expect(queries.fetchJoinInOrgByName, equals("""
    query organizationsConnection(
      \$first: Int, 
      \$skip: Int, 
      \$nameStartsWith: String
    ){
      organizationsConnection(
        where:{
          name_starts_with: \$nameStartsWith,
          visibleInSearch: true,
          isPublic: true,
        }
        first: \$first,
        skip: \$skip,
        orderBy: name_ASC
      ){
        image
        _id
        name
        image
        isPublic
        creator{
          firstName
          lastName
        }
      }
    }
"""));
  });
  test("joinOrgById should return proper mutation", () {
    final queries = Queries();
    expect(queries.joinOrgById("orgId"), equals('''
    mutation {
      joinPublicOrganization(organizationId: "orgId") {
          joinedOrganizations{
            _id
            name
            image
            description
            isPublic
            creator{
              _id
              firstName
              lastName
              image
            }
            
          }
      }
	}
  '''));
  });
  test("sendMembershipRequest should return proper mutation", () {
    final queries = Queries();
    expect(queries.sendMembershipRequest("orgId"), equals('''
      mutation {
          sendMembershipRequest(organizationId: "orgId"){
            organization{
              _id
              name
              image
              description
              isPublic
              creator{
                _id
                firstName
                lastName
                image
              }
            }
         }
    }
  '''));
  });
  test("fetchUserInfo should return proper mutation", () {
    final queries = Queries();
    expect(queries.fetchUserInfo, equals(''' 
       query Users(\$id: ID!){
          users(where: { id: \$id }) {
            _id
            firstName
            lastName
            email
            image
            joinedOrganizations{
              _id
              name
              image
              description
              isPublic
              creator{
                _id
                firstName
                lastName
                image
              } 
              
            }
            createdOrganizations{
              _id
              name
              image
              description
              isPublic
              creator{
                _id
                firstName
                lastName
                image
              } 
            }
            membershipRequests{
              organization{
                _id
                name
                image
                isPublic
                creator{
                  _id
                  firstName
                  lastName
                  image
                }
              }
            }
            adminFor{
             _id
            }
          }
        }
    '''));
  });
  test("refreshToken should return proper mutation", () {
    final queries = Queries();
    expect(queries.refreshToken("refreshToken"), equals('''
        mutation{
          refreshToken(refreshToken: "refreshToken"){
            accessToken
            refreshToken
          }
        }
    '''));
  });
  test("updateLanguage should return proper mutation", () {
    final queries = Queries();
    expect(queries.updateLanguage("languageCode"), equals('''
        mutation {
          updateLanguage(languageCode: "languageCode"){
            _id
            firstName
            appLanguageCode
          }
        }
    '''));
  });
  test("fetchOrgById should return proper query", () {
    final queries = Queries();
    expect(queries.fetchOrgById("orgId"), equals('''
    query{
      organizations(id: "orgId"){
        image
        _id
        name
        image
        isPublic
        creator{
          firstName
          lastName
        }
      }
    }
  '''));
  });
  test("userLanguage should return proper query", () {
    final queries = Queries();
    expect(queries.userLanguage(), equals('''
    query{
      myLanguage
    }
  '''));
  });
  test("newUserLanguage should return proper query", () {
    final queries = Queries();
    expect(queries.newUserLanguage("userId"), equals('''
    query{
      userLanguage(userId:"userId")
    }
  '''));
  });
  test("fetchOrgDetailsById should return proper query", () {
    final queries = Queries();
    expect(queries.fetchOrgDetailsById("orgId"), equals('''
    query{
      organizations(id: "orgId"){
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
  '''));
  });
  test("getPluginsList should return proper query", () {
    final queries = Queries();
    expect(queries.getPluginsList(), equals('''
query  {
  getPlugins {
    _id
    pluginName
    pluginCreatedBy
    pluginDesc 
    pluginInstallStatus
    installedOrgs
  }
}
  '''));
  });
  test("createDonation should return proper mutation", () {
    final queries = Queries();
    expect(
        queries.createDonation(
            "userId", "orgId", "nameOfOrg", "nameOfUser", "payPalId", 50.24),
        equals('''
      mutation createDonationMutation { createDonation(
            userId :"userId"
            orgId :"orgId",
            nameOfOrg:"nameOfOrg",
            nameOfUser:"nameOfUser",
            payPalId:"payPalId"
            amount :50.24
        ){
            _id
            payPalId
            userId
            orgId
            payPalId
            nameOfUser
        }
      }
      '''));
  });
}
