# Method: `initialise`

## Description

Initializes the state of the component by checking the online status and updating the view accordingly.

 This method performs the following actions:
 1. Sets the view state to busy to indicate that an initialization process is underway.
 2. Checks the online status of the application.
    - If the app is offline, it sets the `connectivityPresent` flag to `false`.
    - If the app is online, it sets the `connectivityPresent` flag to `true`.
 3. Updates the view state to idle after the online status check is complete.

 **params**:
   None

 **returns**:
   None

## Return Type
`Future&lt;void&gt;`

