[Plugin Docs](/)

***

# Function: getPluginMapPollsResolver()

> **getPluginMapPollsResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `hasMore`: `boolean`; `polls`: `any`; `totalCount`: `any`; \}\>

Defined in: [plugins/pluginMap/api/graphql/queries.ts:237](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/queries.ts#L237)

Resolver to fetch all logged polls.

Similar to `getPluginMapRequestsResolver`, but exposed as a generic poll fetcher.

## Parameters

### \_parent

`unknown`

The parent resolver (unused).

### args

The arguments containing filter criteria.

#### input?

\{ `extensionPoint?`: `string`; `organizationId?`: `string`; `userRole?`: `string`; \}

#### input.extensionPoint?

`string`

#### input.organizationId?

`string`

#### input.userRole?

`string`

### ctx

`GraphQLContext`

The GraphQL context.

## Returns

`Promise`\<\{ `hasMore`: `boolean`; `polls`: `any`; `totalCount`: `any`; \}\>

A paginated list of polls.

## Throws

If the user is unauthenticated or arguments are invalid.
