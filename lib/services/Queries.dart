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
        name
        description
        creator{
          firstName
          lastName
        }
      }
    }
  ''';

  final String createOrganization = '''
      mutation createOrg (\$name: String!, \$description: String!, \$attendees: String!, \$isPublic: Boolean!){
          createOrganization(data: {name: \$name, description: \$description, attendees: \$attendees, isPublic: \$isPublic}){
            
          }
        }


  ''';
}
