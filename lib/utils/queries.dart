class Queries {
  String registerUser(
      String firstName, String lastName, String email, String password) {
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

  //login the user
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
          }
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
          users(id:\$id){
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
}
