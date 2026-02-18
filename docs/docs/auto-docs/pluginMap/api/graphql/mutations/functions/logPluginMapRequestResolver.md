[Plugin Docs](/)

***

# Function: logPluginMapRequestResolver()

> **logPluginMapRequestResolver**(`_parent`, `args`, `ctx`): `Promise`\<`any`\>

Defined in: [plugins/pluginMap/api/graphql/mutations.ts:117](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/mutations.ts#L117)

Resolver to log a new plugin map request.

This function handles requests from both admin and user contexts,
logging the interaction details into the database.

## Parameters

### \_parent

`unknown`

The parent resolver (unused).

### args

The arguments containing the request input.

#### input

\{ `extensionPoint`: `string`; `organizationId?`: `string`; `userId`: `string`; `userRole`: `string`; \}

#### input.extensionPoint

`string`

#### input.organizationId?

`string`

#### input.userId

`string`

#### input.userRole

`string`

### ctx

`GraphQLContext`

The GraphQL context containing database client and authentication info.

## Returns

`Promise`\<`any`\>

The newly created poll record.

## Throws

If the user is unauthenticated or arguments are invalid.
