[Plugin Docs](/)

***

# Function: getExtensionPointsOverviewResolver()

> **getExtensionPointsOverviewResolver**(`_parent`, `_args`, `ctx`): `Promise`\<\{ `description`: `string`; `extensionPoints`: `object`[]; `totalCount`: `number`; \}\>

Defined in: [plugins/pluginMap/api/graphql/queries.ts:97](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/queries.ts#L97)

Resolver to get an overview of all available extension points.

This provides static metadata about the extension points supported by the plugin,
describing their context, role requirements, and features.

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

`Promise`\<\{ `description`: `string`; `extensionPoints`: `object`[]; `totalCount`: `number`; \}\>

An extension points overview object.

## Throws

If the user is unauthenticated.
