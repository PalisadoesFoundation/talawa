class Queries{
  final String signUp = """
        mutation SignUp (\$firstName: String!, \$lastName: String!, \$email: String!, \$password: String!){
          signUp(data: {firstName: \$firstName, lastName: \$lastName, email: \$email, password: \$password}){
            userId
            token
          }
        }

    """;
 String login = '''
        query Login(\$email: String!, \$password: String!){
          login (data: {email:\$email, password:\$password})
          {
          userId
          token
        }
      }

    ''';


    
 String fetchNavDrawerUserInfo = ''' 
        query Users(\$id: ID!){
          users(id:\$id)
          {
          firstName
          lastName
          email
        }
      }
    ''';

final String fetchOrganizations = '''
    query{
      organizations{
        _id
        name
        description
        creator{
          firstName
          lastName
        }
      }
    }
  ''';

  String getOrgId(String orgId){
   return '''
    mutation {
      joinPublicOrganization(organizationId: "$orgId") {
        firstName
        lastName
        email
      }
	}
  ''';
  }

 String createOrg(String name, String description, String attendees, bool isPublic, bool visibleInSearch) {
    return '''
      mutation {
          createOrganization(data: {name: "$name", description: "$description", attendees: "$attendees", isPublic: $isPublic, visibleInSearch: $visibleInSearch}){
            _id
            name
            description
          creator{
            firstName
            lastName
            
          }
        }
    }
  ''';
  }
}