//all the queries used in the program

class Queries {
  //register the user without the images
  String registerUser(
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
                email
                image
                 joinedOrganizations{
                   image
                  _id
                  name
                 }
                 createdOrganizations{
                   _id
                   image
                   name
                 }
                 adminFor{
                   _id
                   image
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
                email
                image
                 joinedOrganizations{
                   image
                  _id
                  name
                 }
                 createdOrganizations{
                   _id
                   image
                   name
                 }
                 adminFor{
                   _id
                   image
                   name
                 }
              }
              refreshToken
            }
        }
    """;
  }
}
