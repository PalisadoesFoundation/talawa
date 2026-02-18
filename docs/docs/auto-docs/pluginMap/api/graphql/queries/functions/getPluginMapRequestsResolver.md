[Plugin Docs](/)

***

# Function: getPluginMapRequestsResolver()

> **getPluginMapRequestsResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `hasMore`: `boolean`; `requests`: `any`; `totalCount`: `any`; \}\>

Defined in: [plugins/pluginMap/api/graphql/queries.ts:183](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/queries.ts#L183)

Resolver to fetch plugin map request logs.

Allows filtering by user ID, role, organization, and extension point.
This function serves as the primary data fetcher for the admin dashboard.

## Parameters

### \_parent

`unknown`

The parent resolver (unused).

### args

The arguments containing filter criteria.

#### input?

\{ `extensionPoint?`: `string`; `organizationId?`: `string`; `userId?`: `string`; `userRole?`: `string`; \}

#### input.extensionPoint?

`string`

#### input.organizationId?

`string`

#### input.userId?

`string`

#### input.userRole?

`string`

### ctx

`GraphQLContext`

The GraphQL context.

## Returns

`Promise`\<\{ `hasMore`: `boolean`; `requests`: `any`; `totalCount`: `any`; \}\>

A paginated list of request logs.

## Throws

If the user is unauthenticated or arguments are invalid.
