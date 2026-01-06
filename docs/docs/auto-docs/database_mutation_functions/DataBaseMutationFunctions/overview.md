# Overview for `DataBaseMutationFunctions`

## Description

DataBaseMutationFunctions class provides different services that are under the context of graphQL mutations and queries.

 Services include:
 * `encounteredExceptionOrError`
 * `gqlAuthQuery`
 * `gqlAuthMutation`
 * `gqlNonAuthMutation`
 * `gqlNonAuthQuery`
 * `refreshAccessToken`
 * `fetchOrgById`
 * `gqlAuthSubscription`

## Members

- **clientNonAuth**: `GraphQLClient`
  Client Auth for handling non-authenticated request.

- **clientAuth**: `GraphQLClient`
  Client Auth for handling authenticated request.

- **_query**: `Queries`
  Query passed by fucntion calling this function.

- **noData**: `QueryResult`
  when result has no data and null.

