// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This class returns some queries for the application.
class Queries {
  //Returns a query to register a user.
  String registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    return """
        mutation{
          signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password"})
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
    """;
  }

  //Returns a query to login the user
  String loginUser(String email, String password) {
    return """
        mutation {
          login(data: {email: "$email", password: "$password"}){
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
    """;
  }

  String saveFcmToken(String? token) {
    return """
        mutation {
          saveFcmToken(token: "$token")
        }
    """;
  }

  String logout() {
    return """
        mutation {
          logout
        }
    """;
  }

  String get fetchJoinInOrg {
    return """
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
""";
  }

  String get fetchJoinInOrgByName {
    return """
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
""";
  }

  String joinOrgById(String orgId) {
    return '''
    mutation {
      joinPublicOrganization(organizationId: "$orgId") {
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
  ''';
  }

  String sendMembershipRequest(String orgId) {
    return '''
      mutation {
          sendMembershipRequest(organizationId: "$orgId"){
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
  ''';
  }

  String fetchUserInfo = ''' 
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
    ''';

  String refreshToken(String refreshToken) {
    return '''
        mutation{
          refreshToken(refreshToken: "$refreshToken"){
            accessToken
            refreshToken
          }
        }
    ''';
  }

  String updateLanguage(String languageCode) {
    return '''
        mutation {
          updateLanguage(languageCode: "$languageCode"){
            _id
            firstName
            appLanguageCode
          }
        }
    ''';
  }

  String fetchOrgById(String orgId) {
    return '''
    query{
      organizations(id: "$orgId"){
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
  ''';
  }

  String userLanguage() {
    return '''
    query{
      myLanguage
    }
  ''';
  }

  String newUserLanguage(String userId) {
    return '''
    query{
      userLanguage(userId:"$userId")
    }
  ''';
  }

  String fetchOrgDetailsById(String orgId) {
    return '''
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
  }

  ///`getPluginList` queries all properties of  pluginList from the server
  String getPluginsList() {
    return '''
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
  ''';
  }

  /// `createDonation` creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters
  String createDonation(
    String userId,
    String orgId,
    String nameOfOrg,
    String nameOfUser,
    String payPalId,
    double amount,
  ) {
    return '''
      mutation createDonationMutation { createDonation(
            userId :"$userId"
            orgId :"$orgId",
            nameOfOrg:"$nameOfOrg",
            nameOfUser:"$nameOfUser",
            payPalId:"$payPalId"
            amount :$amount
        ){
            _id
            payPalId
            userId
            orgId
            payPalId
            nameOfUser
        }
      }
      ''';
  }
}
