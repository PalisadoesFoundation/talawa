//all the queries used in the program

class Queries {
  //register the user without the images
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
                   image
                  _id
                  name
                 }
                 createdOrganizations{
                   _id
                   image
                   name
                 }
                 adminFor{
                   _id
                   image
                   name
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
                   image
                  _id
                  name
                 }
                 createdOrganizations{
                   _id
                   image
                   name
                 }
                 adminFor{
                   _id
                   image
                   name
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
              email
            }
            admins{
              _id
              firstName
              lastName
              image
              email
            }
            members{
              _id
              firstName
              lastName
              image
              email
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
                email
              }
              admins{
                _id
                firstName
                lastName
                image
                email
              }
              members{
                _id
                firstName
                lastName
                image
                email
              }
            }
         }
    }
  ''';
  }
}
