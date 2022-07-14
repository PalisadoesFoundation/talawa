class RequestQueries {
  String getRequests(String orgId) {
    return """
      query{
        organizations(id: "$orgId"){
          _id
          membershipRequests{
            _id
            user{
              _id
              firstName
              lastName
              image
            }
          }
        }
      }
    """;
  }

  String acceptRequest(String requestId) {
    return """
      mutation {
        acceptMembershipRequest(id: "$requestId"){
          _id
        }
      }
   """;
  }

  String rejectRequest(String requestId) {
    return """
      mutation {
        rejectMembershipRequest(id: $requestId){
          _id
        }
      }
    """;
  }
}
