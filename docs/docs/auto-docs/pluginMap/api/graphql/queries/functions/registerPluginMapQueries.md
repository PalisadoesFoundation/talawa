[Plugin Docs](/)

***

# Function: registerPluginMapQueries()

> **registerPluginMapQueries**(`builderInstance`): `void`

Defined in: [plugins/pluginMap/api/graphql/queries.ts:289](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/graphql/queries.ts#L289)

Registers all Plugin Map queries with the GraphQL builder.

This function exposes the following queries:
- `getExtensionPointsOverview`: Metadata about extension points.
- `getPluginMapRequests`: Fetches interaction logs.
- `getPluginMapPolls`: Fetches generic poll logs.

## Parameters

### builderInstance

`any`

The Pothos schema builder instance.

## Returns

`void`
