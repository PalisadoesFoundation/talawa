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

  String acceptRequest() {
    return """
  mutation AcceptMembershipRequest(\$id: ID!){
    acceptMembershipRequest(id: \$id){
      _id
      }
   }
  """;
  }

   String rejectRequest() {
    return """
  mutation RejectMembershipRequest(\$id: ID!){
    rejectMembershipRequest(id: \$id){
      _id
      }
   }
  """;
  }
}
