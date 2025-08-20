///This class returns some queries for the application.
class Queries {
  //Returns a query to register a user.

  /// Mutation to register a user.
  ///
  ///
  /// **params**:
  /// * `name`: user's data.
  /// * `email`: user's data.
  /// * `password`: user's data.
  /// * `selectedOrganization`: ID of the selected organization.
  ///
  /// **returns**:
  /// * `String`: Return the mutation in string type to be passed to graphql client.
  String registerUser(
    String name,
    String email,
    String password,
    String? selectedOrganization,
  ) {
    return """
      mutation {
        signUp(input: {
          emailAddress: "$email"
          name: "$name"
          password: "$password"
          selectedOrganization: "$selectedOrganization"
          
        }) {
          authenticationToken,
          user{
            id
            name,
            avatarURL,
            emailAddress,
            organizationsWhereMember(first:32){
              edges{
                node{
                  id,
                  name,
                  addressLine1,
                  addressLine2,
                  avatarMimeType,
                  avatarURL,
                  postalCode,
                  countryCode,
                  description,
                  isUserRegistrationRequired,
                }
              }
            }
          }
          
        }
      }
    """;
  }

  //Returns a query to login the user
  /// mutation to login the user.
  ///
  /// **params**:
  /// * `email`: user's data
  /// * `password`: user's data
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String loginUser(String email, String password) {
    return """
      query {
      signIn(input: { emailAddress: "$email", password: "$password" }) {
        authenticationToken,
        user {
          id,
          name,
          emailAddress,
          name,
          avatarURL,
          organizationsWhereMember(first:32){
            edges{
              node{
                id,
                name,
                addressLine1,
                addressLine2,
                avatarMimeType,
                avatarURL,
                postalCode,
                countryCode,
                description,
                isUserRegistrationRequired,
              }
            }
          }
        }
      }
    }
    """;
  }

  /// to update user profile.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: return a mutation
  String updateUserProfile() {
    return """
      mutation UpdateUserProfile(
        \$firstName: String
        \$lastName: String
        \$email: EmailAddress
        \$file: String
      ) {
      updateUserProfile(
        data: { firstName: \$firstName, lastName: \$lastName, email: \$email }
        file: \$file
      ) {
        _id
        }
      }
    """;
  }

  /// logout muiation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: simple mutation
  String logout() {
    return """
        mutation {
          logout
        }
    """;
  }

  /// getter for joined org.
  ///
  String get fetchJoinInOrg {
    return """
    query {
      organizations{
        id,
        name,
        addressLine1,
        addressLine2,
        description,
        avatarURL,
        countryCode,
        state,
        isUserRegistrationRequired,
      }
    }
    """;
  }

  /// getter for fetchJoinInOrgByName.
  String get fetchJoinInOrgByName {
    return """
    query organizationsConnection(
      \$first: Int, 
      \$skip: Int, 
      \$nameStartsWith: String
    ){
      organizationsConnection(
        where:{
          name_starts_with: \$nameStartsWith,
          visibleInSearch: true,
          userRegistrationRequired: true,
        }
        first: \$first,
        skip: \$skip,
        orderBy: name_ASC
      ){
        image
        _id
        name
        image
        userRegistrationRequired
        creator{
          firstName
          lastName
        }
      }
    }
""";
  }

  /// make mutation string for joiining org by ord.id.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: returns a string for client
  String joinOrgById() {
    return '''
    mutation JoinPublicOrganization(\$organizationId: ID!) {
      joinPublicOrganization(input: {organizationId: \$organizationId}) {
        memberId
        organizationId
      }
    }
  ''';
  }

  /// mutation to send the member request.
  ///
  ///
  /// **params**:
  /// * `orgId`: refer org object
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String sendMembershipRequest(String orgId) {
    return '''
      mutation {
          sendMembershipRequest(input:{organizationId: "$orgId"}){
            userId
            membershipRequestId
            status 
         }
    }
  ''';
  }

  /// mutation in string form, to be passed on to graphql client.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String fetchUserInfo() {
    return '''
      query fetchUserInfo(
        \$id: ID!
      ) {
        user(input: {id: \$id}) {
          id
          name
          avatarURL
          emailAddress
          organizationsWhereMember(first: 32) {
            edges {
              node {
                id
                name
                addressLine1
                addressLine2
                avatarMimeType
                avatarURL
                postalCode
                countryCode
                description
                isUserRegistrationRequired
              }
            }
          }
        }
      }
    ''';
  }

  /// mutation for refresh token.
  ///
  /// **params**:
  /// * `refreshToken`: related to auth, token based authentication, mutation to refresh the token
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
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

  /// fetching org details with the help of id.
  ///
  ///
  /// **params**:
  /// * `orgId`: Org identifier
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String fetchOrgById(String orgId) {
    return '''
    query{
      organization(input:{id:"$orgId"}){
        id,
        name,
        addressLine1,
        addressLine2,
        avatarMimeType,
        avatarURL,
        postalCode,
        countryCode,
        description,
        isUserRegistrationRequired,
      }
    }
    ''';
  }

  /// `createDonation` creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `userId`: user identifier
  /// * `orgId`: org identifier
  /// * `nameOfOrg`: org data
  /// * `nameOfUser`: user data
  /// * `payPalId`: for payment
  /// * `amount`: amount
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String createDonation(
    String userId,
    String orgId,
    String nameOfOrg,
    String nameOfUser,
    String payPalId,
    double amount,
  ) {
    return '''
      mutation createDonationMutation { createDonation(
            userId :"$userId"
            orgId :"$orgId",
            nameOfOrg:"$nameOfOrg",
            nameOfUser:"$nameOfUser",
            payPalId:"$payPalId"
            amount :$amount
        ){
            _id
            payPalId
            userId
            orgId
            payPalId
            nameOfUser
        }
      }
      ''';
  }

  /// Query to get the list of Venues in an organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Query in string form, to be passed to graphql client.
  String venueListQuery() {
    return """
    query GetVenueByOrgId(\$orgId: ID!, \$first: Int, \$orderBy: VenueOrderByInput, \$where: VenueWhereInput) {
      getVenueByOrgId(orgId: \$orgId, first: \$first, orderBy: \$orderBy, where: \$where) {
        _id
        capacity
        name
        description
        imageUrl
        organization {
          _id
        }
      }
    }
  """;
  }

  /// Query to fetch users by organization ID using new GraphQL schema.
  ///
  /// **params**:
  /// * `orgId`: Organization identifier
  ///
  /// **returns**:
  /// * `String`: Query in string form, to be passed to graphql client.
  String fetchUsersByOrganizationId(String orgId) {
    return '''
    query {
      usersByOrganizationId(organizationId: "$orgId") {
        id
        name
        avatarURL
        description
        isUserRegistrationRequired
        emailAddress
      }
    }
    ''';
  }
}
