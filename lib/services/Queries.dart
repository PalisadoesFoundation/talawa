//all the queries used in the program
class Queries {
  //refresh the token
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

  //register the user
  String registerUser(
      String firstName, String lastName, String email, String password) {
    return """
        mutation (\$file: Upload) {
          signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password"},
           file: \$file){
            accessToken
            user{
                _id
                firstName
                lastName
                 joinedOrganizations{
                  _id
                  name
                 }
              }
              refreshToken
            }
        }

    """;
  }

  //update profile the user
  String updateUserProfile() {
    return """
        mutation (
          \$file: Upload, 
          \$firstName: String, 
          \$lastName: String, 
          \$email: String
        ){
          updateUserProfile(
            data: {
              firstName: \$firstName, 
              lastName: \$lastName, 
              email: \$email
            },
            file: \$file
          ){
            firstName
            lastName
            email
          }
        }
    """;
  }

  //register the user without the images
  String registerUserWithoutImg(
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
                 joinedOrganizations{
                  _id
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
                 joinedOrganizations{
                   image
                  _id
                  name
                 }
              }
              refreshToken
            }
        }

    """;
  }

  //fetches the user info
  String fetchUserInfo = ''' 
       query Users(\$id: ID!){
          users(id:\$id){
          _id
          firstName
          lastName
          email
          image
          joinedOrganizations{
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
        }
         createdOrganizations {
          _id
          name
        }
        adminFor {
          _id
          name
            creator{
        firstName
        lastName
      }
        }
      }
    }
    ''';

  //fetches the info two
  String fetchUserInfo2(String id) {
    return ''' 
       query {users(id:"$id"){
          _id
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
  }

  //fetch organization
  final String fetchOrganizations = '''
    query{
      organizations(){
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
      }
    }
  ''';

  //fetch organization by id
  String fetchOrgById(String orgId) {
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
          email
          image
        }
      }
    }
  ''';
  }

  //get the organization id
  String getOrgId(String orgId) {
    return '''
    mutation {
      joinPublicOrganization(organizationId: "$orgId") {
          joinedOrganizations{
            _id
            name
          }
      }
	}
  ''';
  }

  //to create a organization
  String createOrg(String name, String description, String attendees,
      bool isPublic, bool visibleInSearch) {
    return '''
      mutation (\$file: Upload){
          createOrganization(data: {name: "$name", description: "$description", attendees: "$attendees", isPublic: $isPublic, visibleInSearch: $visibleInSearch}, 
          file: \$file), 
           {
             image
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

  //create organization without image
  String createOrgWithoutImg(String name, String description, String attendees,
      bool isPublic, bool visibleInSearch) {
    return '''
       mutation {
           createOrganization(data: {name: "$name", description: "$description", attendees: "$attendees", isPublic: $isPublic, visibleInSearch: $visibleInSearch}), 
            {
              image
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

  //update the organization
  String updateOrg(String orgId, String name, String description, bool isPublic,
      bool visibleInSearch) {
    return '''
      mutation {
          updateOrganization(id: "$orgId", data: {name: "$name", description: "$description", isPublic: $isPublic, visibleInSearch: $visibleInSearch}){
            _id
            name
        }
    }
  ''';
  }

  //remove the organization
  String removeOrg(String orgId) {
    return '''
      mutation {
          removeOrganization(id: "$orgId"){
             firstName 
            lastName
             joinedOrganizations{
            _id
            name
          }
        }
    }
  ''';
  }

  //leave the organization
  String leaveOrg(String orgId) {
    return '''
      mutation {
          leaveOrganization(organizationId: "$orgId"){
            firstName 
            lastName
             joinedOrganizations{
            _id
            name
          }
        }
    }
  ''';
  }

  //send membership request
  String sendMembershipRequest(String orgId) {
    return '''
      mutation {
          sendMembershipRequest(organizationId: "$orgId"){
            _id
         }
    }
  ''';
  }

  //this enables to view the membership request
  String viewMembershipRequest(String orgId) {
    return '''
      query {
        organizations(id:"$orgId"){
          membershipRequests{
            _id
            user{
              firstName
              lastName
              image
            }
          }
         }
    }
  ''';
  }

  //allows to view members
  String viewMembers(String orgId) {
    return '''
      query {
        organizations(id:"$orgId"){
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

  //accepts the membership request
  String acceptMembershipRequest(String membershipRequestId) {
    return '''
      mutation {
        acceptMembershipRequest(membershipRequestId:"$membershipRequestId"){
              user{
              firstName
              lastName
           }
         }
    }
  ''';
  }

  //rejecting the membership request
  String rejectMembershipRequest(String membershipRequestId) {
    return '''
      mutation {
        rejectMembershipRequest(membershipRequestId:"$membershipRequestId"){
              user{
              firstName
              lastName
           }
         }
    }
  ''';
  }

  //remove the members
  String removeMember(String organizationId, List userIds) {
    return '''
      mutation {
        removeMember(data: {organizationId: "$organizationId", userIds: $userIds})
         {
            _id
            name
        }
        
    }
  ''';
  }

  String addAdmin(String organizationId, String userId){
    return '''
      mutation {
        createAdmin(data: {organizationId: "$organizationId", userId: $userId})
         {
            _id
         }
        
    }
  ''';
  }

//////////////EVENTS/////////////////////
  String fetchOrgEvents(String orgId) {
    return """
      query {
        events(id: "$orgId"){ 
          _id
          title
          description
          isPublic
          isRegisterable
          recurring
          recurrance
          startTime
          endTime
          allDay
          startTime
          endTime
          location
          isRegistered
        }
      }
    """;
  }

  //to update an event
  String updateEvent(
      {organizationId,
      title,
      description,
      location,
      isPublic,
      isRegisterable,
      recurring,
      recurrance,
      allDay,
      date,
      startTime,
      endTime}) {
    return """updateEventInput(
          data:{
           organizationId: "$organizationId",
           title: "$title",
           description: "$description",
           isPublic: $isPublic,
           isRegisterable: $isRegisterable,
           recurring: $recurring,
           recurrance: "$recurrance",
           allDay: $allDay,
           startTime: "$startTime"
           endTime: "$endTime"
           date: "$date",
           location: "$location"
          }){
            _id
            title
            description
          }""";
  }

  //delete any event
  String deleteEvent(String id) {
    return """
      mutation {
        removeEvent(
          id: "$id",
          ){
            _id
          }
        }
    """;
  }

  //to register for an event
  String registerForEvent(String eventid) {
    return """
      mutation {
        registerForEvent(
          id: "$eventid",
          ){
            _id
            title
            description
          }
        }
    """;
  }

  String addEventTask(
      {String eventId, String title, String description, String deadline}) {
    return """
      mutation {
        createTask(
        eventId: "$eventId",
        data: {
        title: "$title",
        description: "$description",
        deadline: "$deadline",}
        ){
          _id
        }
      }
    """;
  }

  //to get the task by any event
  String getTasksByEvent(String id) {
    return """
  query{
    tasksByEvent(id:"$id"){
        title
        description
        deadline
    }
  }
  
  """;
  }

  //to get registrants for an event
  String getRegistrantsByEvent(String id) {
    return """
  query{
    registrantsByEvent(id:"$id"){
    firstName
    lastName
    email
    image
    }
  }
  """;
  }

  //to add the events
  String addEvent(
      {organizationId,
      title,
      description,
      location,
      isPublic,
      isRegisterable,
      recurring,
      allDay,
      recurrance,
      startDate,
      endDate,
      startTime,
      endTime}) {
    return """
      mutation {
        createEvent(
          data:{
           organizationId: "$organizationId",
           title: "$title",
           description: "$description",
           isPublic: $isPublic,
           isRegisterable: $isRegisterable,
           recurring: $recurring,
           recurrance: "$recurrance",
           allDay: $allDay,
           startTime: "$startTime"
           endTime: "$endTime"
           startDate: "$startDate",
           endDate,: "$endDate",
           location: "$location"
          }){
            _id
            title
            description
          }
        }
    """;
  }

/////////////////////MEMBERS//////////////////////////////////////////////////////////////////////

  //task by users
  String tasksByUser(String id) {
    return """
  query{
    tasksByUser(id:"$id"){
      _id
      title
      description
      deadline
    }
  }
  
  """;
  }

  String registeredEventsByUser(String id) {
    return """
  query{
    registeredEventsByUser(id:"$id"){
      _id
      title
      description
    }
  }
  
  """;
  }

///////////////////NEWSFEED///////////////////////////////////////////////////////////////////////
  String getPostsById(String orgId) {
    return """
      query {
        postsByOrganization(id: "$orgId")
        { 
          _id
          text
          createdAt
          imageUrl
          videoUrl
          title
          commentCount
          likeCount
          creator{
            firstName
            lastName
          }
          organization{
            _id
          }
          likedBy{
            _id
          }
          comments{
            _id
          }
        }
      }
""";
  }

  String getPostsComments(String postId) {
    return """
query{
  commentsByPost(id: "$postId"){
    _id
    text
    createdAt
    creator{
      firstName
      lastName
    }
  }
}
""";
  }

  String createComments(String postId, var text) {
    return """
mutation{
  createComment(postId: "$postId", 
  data:{
    text: "$text",
  }
  ){
    _id
  }
}
""";
  }

  String addPost(String text, String organizationId, String title) {
    return """
    mutation {
        createPost(
            data: {
                text: "$text",
                title: "$title",
                organizationId: "$organizationId",
        }) {
            _id
            text
        }
    }
  """;
  }

  String addLike(String postID) {
    return """
  mutation{
    likePost(id:"$postID"){
      _id
    }
  }
  """;
  }

  String removeLike(String postID) {
    return """
  mutation{
    unlikePost(id:"$postID"){
      _id
      likedBy{
        _id
      }
    }
  }
  """;
  }
}
