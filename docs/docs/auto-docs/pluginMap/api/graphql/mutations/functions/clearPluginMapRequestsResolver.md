[Plugin Docs](/)

***

# Function: clearPluginMapRequestsResolver()

> **clearPluginMapRequestsResolver**(`_parent`, `_args`, `ctx`): `Promise`\<\{ `clearedCount`: `any`; `message`: `string`; `success`: `boolean`; \}\>

Defined in: [plugins/pluginMap/api/graphql/mutations.ts:165](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/mutations.ts#L165)

Resolver to clear all logged plugin map requests.

This function deletes all records from the polls table, effectively resetting
the plugin map request logs.

## Parameters

### \_parent

`unknown`

The parent resolver (unused).

### \_args

`Record`\<`string`, `unknown`\>

The arguments (unused).

### ctx

`GraphQLContext`

The GraphQL context.

## Returns

`Promise`\<\{ `clearedCount`: `any`; `message`: `string`; `success`: `boolean`; \}\>

An object indicating success and the count of cleared records.

## Throws

If the user is unauthenticated.
