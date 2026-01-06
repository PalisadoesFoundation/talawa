# Overview for `UserConfig`

## Description

Provides different services in the context of the User.

 Services include:
 * `userLoggedIn` : helps to make user logged in to the application.
 * `updateUserJoinedOrg` : helps to update the user joined organization.
 * `updateUserCreatedOrg` : helps to update the user created organization.
 * `updateUserMemberRequestOrg` : helps to update the User membership
 request for the organization.
 * `updateUserAdminOrg` : helps to update the Admin of the Organization.
 * `updateAccessToken` : helps to update the access token of an user.
 * `updateUser` : helps to update the user.

## Members

- **_currentUser**: `User?`
- **_currentOrg**: `OrgInfo?`
- **_currentOrgInfoStream**: `Stream&lt;OrgInfo&gt;`
- **_currentOrgInfoController**: `StreamController&lt;OrgInfo&gt;`
