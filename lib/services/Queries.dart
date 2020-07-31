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
            description
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

  String fetchUserInfo2(String id) {
    return ''' 
       query {users(id:"$id"){
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
    ''';}

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

  String getOrgId(String orgId) {
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

  String createOrg(String name, String description, String attendees,
      bool isPublic, bool visibleInSearch) {
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

//////////////EVENTS/////////////////////
  final String fetchEvents = """
      query {
        events { 
          _id
          title
          description
          isPublic
          isRegisterable
          recurring
          recurrance
        }
      }
    """;

  final String deleteEvent = """
      mutation RemoveEvent(
        \$id: ID!,
        )
        {removeEvent(
          id: \$id,
          ){
            _id
            title
            description
          }
        }
    """;

  final String registerForEvent = """
      mutation RegisterForEvent(
        \$id: ID!,
        )
        {registerForEvent(
          id: \$id,
          ){
            _id
            title
            description
          }
        }
    """;

  final String addEventProject = """
      mutation CreateEventProject(
        \$title: String!,
        \$description: String!,
        \$eventId: String!,
        ){
        createEventProject(
          data:{
            title: \$title,
            description: \$description,
            eventId: \$eventId,
          }){
            _id
            title
            description
          }
        }
    """;

  String addEvent(organizationId, title, description, isPublic, isRegisterable,
      recurring, recurrance, date) {
    return """
      mutation CreateEvent(
        \$organizationId: ID!,
        \$title: String!,
        \$description: String!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$recurring: Boolean!,
        \$date: String!,
        \$recurrance: String,
        ){
        createEvent(
          data:{
           organizationId: $organizationId,
           title: $title,
           description: $description,
           isPublic: $isPublic,
           isRegisterable: $isRegisterable,
           recurring: $recurring,
           date: $date,
           recurrance: $recurrance,
          }){
            _id
            title
            description
          }
        }
    """;
  }
}
