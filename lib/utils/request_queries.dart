class RequestQueries {

  String getRequests(String orgId) {
    return """
 query{
  Organization(id: "$orgId"){
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
  }""";
  }

  String acceptRequest(String requestId) {
    return """
  mutation AcceptMembershipRequest(id: $requestId){
    acceptMembershipRequest(id: $requestId){
      _id
      }
   }
  """;
  }

   String rejectRequest(String requestId) {
    return """
  mutation RejectMembershipRequest(\$id: $requestId){
    rejectMembershipRequest(id: $requestId){
      _id
      }
   }
  """;
  }
}
