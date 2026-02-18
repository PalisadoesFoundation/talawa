[Plugin Docs](/)

***

# Function: logPluginMapPollResolver()

> **logPluginMapPollResolver**(`_parent`, `args`, `ctx`): `Promise`\<`any`\>

Defined in: [plugins/pluginMap/api/graphql/mutations.ts:192](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/mutations.ts#L192)

Resolver to log a new plugin map poll.

This serves as an alias or alternate entry point for logging polls, particularly
for internal or test usage.

## Parameters

### \_parent

`unknown`

The parent resolver (unused).

### args

The arguments containing the poll input.

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

The GraphQL context.

## Returns

`Promise`\<`any`\>

The newly created poll record.

## Throws

If the user is unauthenticated or arguments are invalid.
