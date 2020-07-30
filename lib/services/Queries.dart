class Queries{
   String registerUser(String firstName, String lastName, String email, String password) {
   return """
        mutation {
          signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password"}){
            userId
            token
          }
        }

    """;
   }
 
   String loginUser(String email, String password) {
   return """
        query {
          login(data: {email: "$email", password: "$password"}){
            userId
            token
          }
        }

    """;
   }

 String fetchUserInfo = ''' 
       query Users(\$id: ID!){
          users(id:\$id){
          firstName
          lastName
          email
          joinedOrganizations{
            _id
            name
          creator{
          firstName
          lastName
          }
        }
           createdOrganizations {
            _id
            name
          }
          adminFor {
            _id
            name
          }
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