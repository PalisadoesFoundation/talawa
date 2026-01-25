<<<<<<< HEAD
=======
import 'package:talawa/utils/gql_fragments.dart';

>>>>>>> upstream/develop
///This class returns some queries for the application.
class Queries {
  //Returns a query to register a user.

  /// Mutation to register a user.
  ///
  ///
  /// **params**:
<<<<<<< HEAD
  /// * `firstName`: user's data.
  /// * `lastName`: user's data.
=======
  /// * `name`: user's data.
>>>>>>> upstream/develop
  /// * `email`: user's data.
  /// * `password`: user's data.
  /// * `selectedOrganization`: ID of the selected organization.
  ///
  /// **returns**:
  /// * `String`: Return the mutation in string type to be passed to graphql client.
  String registerUser(
<<<<<<< HEAD
    String firstName,
    String lastName,
=======
    String name,
>>>>>>> upstream/develop
    String email,
    String password,
    String? selectedOrganization,
  ) {
    return """
            mutation {
              signUp(input: {
                emailAddress: "$email"
<<<<<<< HEAD
                name: "$firstName $lastName"
                password: "$password"
=======
                name: "$name"
                password: "$password"
                selectedOrganization: "$selectedOrganization"
>>>>>>> upstream/develop
                
              }) {
                authenticationToken,
                user{
<<<<<<< HEAD
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
=======
                  ...UserFields
                  organizationsWhereMember(first:32){
                    edges{
                      node{
                        ...OrganizationFields
>>>>>>> upstream/develop
                        members(first:32){
                          edges{
                            node{
                              name
                              role
                            }
                          }
                        }
                      }
                    }
                  }
                }
                
              }
            }
<<<<<<< HEAD
=======
    $userFieldsFragment
    $organizationFieldsFragment
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
                members(first:32){
                  edges{
                    node{
=======
          ...UserFields
          orgIdWhereMembershipRequested
          organizationsWhereMember(first:32){
            edges{
              node{
                ...OrganizationFields
                members(first:32){
                  edges{
                    node{
                      id
>>>>>>> upstream/develop
                      name
                      role
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
<<<<<<< HEAD
=======
    $userFieldsFragment
    $organizationFieldsFragment
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
=======
    return '''
      mutation UpdateCurrentUser(
        \$emailAddress: EmailAddress,
        \$name: String,
        \$avatar: Upload
      ) {
        updateCurrentUser(
          input: {
            emailAddress: \$emailAddress,
            name: \$name,
            avatar: \$avatar
          }
        ) {
          id
          name
          emailAddress
          avatarURL
        }
      }
    ''';
>>>>>>> upstream/develop
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
<<<<<<< HEAD
        id,
        name,
        addressLine1,
        addressLine2,
        description,
        avatarURL,
        countryCode,
        state,
      }
    }
=======
        ...OrganizationFields
      }
    }
    $organizationFieldsFragment
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
=======
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
>>>>>>> upstream/develop
  ''';
  }

  /// mutation to send the member request.
  ///
  ///
  /// **params**:
<<<<<<< HEAD
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
=======
  ///   None
  ///
  /// **returns**:
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String sendMembershipRequest() {
    return '''
      mutation SendMemberShipRequest(\$organizationId: ID!) {
          sendMembershipRequest(input:{organizationId: \$organizationId}){
            userId
            membershipRequestId
            organizationId
            status 
>>>>>>> upstream/develop
         }
    }
  ''';
  }

<<<<<<< HEAD
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
=======
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
        \$id: String!
      ) {
        user(input: {id: \$id}) {
          ...UserFields
          orgIdWhereMembershipRequested,
          organizationsWhereMember(first: 32) {
            edges {
              node {
               ...OrganizationFields
>>>>>>> upstream/develop
              }
            }
          }
        }
<<<<<<< HEAD
    ''';
=======
      }
      $userFieldsFragment
      $organizationFieldsFragment
    ''';
  }
>>>>>>> upstream/develop

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

<<<<<<< HEAD
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

=======
>>>>>>> upstream/develop
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
<<<<<<< HEAD
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
=======
      organization(input:{id:"$orgId"}){
        ...OrganizationFields
      }
    }
    $organizationFieldsFragment
    ''';
  }

  /// mutation to delete organization membership.
>>>>>>> upstream/develop
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
<<<<<<< HEAD
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
=======
  /// * `String`: mutation in string form, to be passed on to graphql client.
  String deleteOrganizationMembershipMutation() {
    return '''
      mutation DeleteOrganizationMembership(
        \$memberId: ID!,
        \$organizationId: ID!
      ) {
        deleteOrganizationMembership(
          input: {
            memberId: \$memberId,
            organizationId: \$organizationId
          }
        ) {
          id
        }
      }
    ''';
>>>>>>> upstream/develop
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
<<<<<<< HEAD
=======

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
        ...UserFields
      }
    }
    $userFieldsFragment
    ''';
  }
>>>>>>> upstream/develop
}
