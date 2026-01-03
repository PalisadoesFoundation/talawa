# Overview for `CustomDrawerViewModel`

## Description

CustomDrawerViewModel class helps to serve the data and to react to user's input for Custom Dialog Widget.

 Functions include:
 * `switchOrg`
 * `isPresentinSwitchableOrg`
 * `setSelectedOrganizationName`

## Dependencies

- BaseModel

## Members

- **controller**: `ScrollController`
  Scroll controller for managing scrolling behavior.

- **_currentUser**: `User`
- **_switchAbleOrg**: `List<OrgInfo>`
- **_disposed**: `bool`
- **_selectedOrg**: `OrgInfo?`
- **_currentOrganizationStreamSubscription**: `StreamSubscription<OrgInfo>?`
