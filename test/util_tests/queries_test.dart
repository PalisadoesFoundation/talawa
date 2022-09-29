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
}
