///This class returns some queries for the application.
class Queries {
  //Returns a query to register a user.

  /// Mutation to register a user.
  ///
  ///
  /// **params**:
  /// * `firstName`: user's data.
  /// * `lastName`: user's data.
  /// * `email`: user's data.
  /// * `password`: user's data.
  /// * `selectedOrganization`: ID of the selected organization.
  ///
  /// **returns**:
  /// * `String`: Return the mutation in string type to be passed to graphql client.
  String registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
    String? selectedOrganization,
  ) {
    return """
            mutation {
              signUp(input: {
                emailAddress: "$email"
                name: "$firstName $lastName"
                password: "$password"
                
              }) {
                authenticationToken,
                user{
                  id
                  name,
                  avatarURL,
                  emailAddress,
                  
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
    query organizationsConnection(\$first: Int, \$skip: Int){
      organizationsConnection(
        first: \$first,
        skip: \$skip,
        orderBy: name_ASC
      ){
        image
        _id
        name
        image
        description
        address{
        city
        countryCode
        state
      }
        userRegistrationRequired
        creator{
          firstName
          lastName
        }
        members{
              firstName
              lastName
              image
              }
              admins{
              firstName
              lastName
              image
              }
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
  /// * `orgId`: refer org object.
  ///
  /// **returns**:
  /// * `String`: returns a string for client
  String joinOrgById(String orgId) {
    return '''
    mutation {
      joinPublicOrganization(organizationId: "$orgId") {
          joinedOrganizations{
            _id
            name
            image
            description
            userRegistrationRequired
            creator{
              _id
              firstName
              lastName
              image
            }
            
          }
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
          sendMembershipRequest(organizationId: "$orgId"){
            organization{
              _id
              name
              image
              description
              userRegistrationRequired
              creator{
                _id
                firstName
                lastName
                image
              }
            }
         }
    }
  ''';
  }

  /// mutation in string form, to be passed on to graphql client..
  String fetchUserInfo = '''
       query Users(\$id: ID!){
          users(where: { id: \$id }) {
            appUserProfile{
              adminFor{
                _id
                name
              }
              createdOrganizations{
                _id
                name
                image
                description
                userRegistrationRequired
                creator{
                  _id
                  firstName
                  lastName
                  image
                } 
              }
            }
            user{
              _id
              firstName
              lastName
              email
              image
              joinedOrganizations{
                _id
                name
                image
                description
                userRegistrationRequired
                creator{
                  _id
                  firstName
                  lastName
                  image
                } 
              }
              membershipRequests{
                organization{
                  _id
                  name
                  image
                  description
                  userRegistrationRequired
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  } 
                }
              }
            }
          }
        }
    ''';

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

  /// lang update mutation.
  ///
  /// **params**:
  /// * `languageCode`: lang code to identify the lang, refer lang jsons
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String updateLanguage(String languageCode) {
    return '''
        mutation {
          updateLanguage(languageCode: "$languageCode"){
            _id
            firstName
            appLanguageCode
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
      organizations(id: "$orgId"){
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
  ''';
  }

  /// query to fetch user lang.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: query in string form, to be passed on to graphql client.
  String userLanguage() {
    return '''
    query{
      myLanguage
    }
  ''';
  }

  /// query for new user language .
  ///
  ///
  /// **params**:
  /// * `userId`: user identifier
  ///
  /// **returns**:
  /// * `String`: query in string form, to be passed on to graphql client.
  String newUserLanguage(String userId) {
    return '''
    query{
      userLanguage(userId:"$userId")
    }
  ''';
  }

  /// query to fetch org details.
  ///
  /// **params**:
  /// * `orgId`: org identifier
  ///
  /// **returns**:
  /// * `String`: query in string form, to be passed on to graphql client.
  String fetchOrgDetailsById(String orgId) {
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
        userRegistrationRequired
        creator{
          _id
          firstName
          lastName
        }
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

  ///`getPluginList` queries all properties of  pluginList from the server.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: query in string form, to be passed on to graphql client.
  String getPluginsList() {
    return '''
query  {
  getPlugins {
    _id
    pluginName
    pluginCreatedBy
    pluginDesc 
    pluginInstallStatus
    installedOrgs
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
}
