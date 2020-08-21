import 'dart:convert';
import 'dart:io';

class Queries {
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

  String registerUser(
      String firstName, String lastName, String email, String password) {
    return """
        mutation {
          signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password"}){
            accessToken
            user{
                _id
                firstName
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

  String loginUser(String email, String password) {
    return """
        mutation {
          login(data: {email: "$email", password: "$password"}){
            accessToken
            user{
                _id
                firstName
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
    ''';
  }

  final String fetchOrganizations = '''
    query{
      organizations(){
        _id
        name
        description
        isPublic
        creator{
          firstName
          lastName
        }
        members{
          _id
          firstName
          lastName
          email
        }
      }
    }
  ''';

  String fetchOrgById(String orgId) {
    return '''
    query{
      organizations(id: "$orgId"){
        _id
        name
        description
        creator{
          firstName
          lastName
        }
        members{
          _id
          firstName
          lastName
          email
        }
      }
    }
  ''';
  }

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

  // String uploadOrgImg = '''
  //      mutation uploadOrgImg(\$organizationId: ID!){
  //         addOrganizationImage(id:\$id){

  //   ''';

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

  String sendMembershipRequest(String orgId) {
    return '''
      mutation {
          sendMembershipRequest(organizationId: "$orgId"){
            _id
         }
    }
  ''';
  }

  String viewMembershipRequest(String orgId) {
    return '''
      query {
        organizations(id:"$orgId"){
          membershipRequests{
            _id
            user{
              firstName
              lastName
            }
          }
         }
    }
  ''';
  }

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
          date
          location
        }
      }
    """;
  }

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

  String registerForEvent = """
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
      date,
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
           date: "$date",
           location: "$location"
          }){
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

  String createComments(String postId, String text) {
    return """
mutation{
  createComment(postId: "$postId", 
  data:{
    text: "$text"
  }
  ){
    _id
  }
}
""";
  }

  String addPost(String text, String organizationId, String date) {
    return """
    mutation {
        createPost(
            data: {
                text: "$text",
                organizationId: "$organizationId",
        }) {
            _id
            text
        }
    }
  """;
  }
}
