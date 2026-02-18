[Plugin Docs](/)

***

# Interface: IPluginContext\<TDb, TConfig\>

Defined in: [plugins/types.ts:62](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L62)

Plugin context provided to all lifecycle hooks
Contains database, logger, and other shared resources

## Property Availability

| Property | Availability | Notes |
|----------|--------------|-------|
| `db` | Optional - provided when db access is needed | Guard for undefined; throw PluginError if required but missing |
| `logger` | **Required** - guaranteed in all hooks | Always present; use `context.logger.info()` |
| `config` | Guaranteed after onInstall | May be undefined in onInstall; always present in other hooks |

## Recommended Fallbacks
- If `db` is undefined when required, throw a descriptive error
- If `config` is missing, use sensible defaults or throw during onActivate

## Example

```typescript
onActivate: async (context: IPluginContext<MyDb, MyConfig>) => {
  if (!context.db) {
    throw new Error('Database connection required for Razorpay plugin');
  }
  context.logger.info('Razorpay plugin activated');
}
```

## Type Parameters

### TDb

`TDb` = `unknown`

Type for the database connection (e.g., DrizzleORM instance)

### TConfig

`TConfig` = [`PluginConfig`](../type-aliases/PluginConfig.md)

Type for plugin configuration (defaults to PluginConfig)

## Properties

### config?

> `optional` **config**: `TConfig`

Defined in: [plugins/types.ts:85](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L85)

Plugin configuration from manifest

#### Remarks

Guaranteed after onInstall; may be undefined during initial onInstall call

***

### db?

> `optional` **db**: `TDb`

Defined in: [plugins/types.ts:67](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L67)

Database connection for plugin data access

#### Remarks

May be undefined if the host system doesn't provide db access for this hook

***

### graphql?

> `optional` **graphql**: [`IPluginGraphQL`](IPluginGraphQL.md)

Defined in: [plugins/types.ts:97](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L97)

GraphQL instance for plugin schema registration and execution

#### Remarks

Optional - provided when GraphQL access is needed

***

### isActive?

> `optional` **isActive**: `boolean`

Defined in: [plugins/types.ts:91](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L91)

Current plugin activation state (for idempotency checks)

#### Remarks

Plugins should check this before performing activation-only tasks

***

### logger

> **logger**: `object`

Defined in: [plugins/types.ts:74](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L74)

Logger instance for plugin logging (use instead of console.*)

#### debug()

> **debug**: (...`args`) => `void`

##### Parameters

###### args

...[`JsonValue`](../type-aliases/JsonValue.md)[]

##### Returns

`void`

#### error()

> **error**: (...`args`) => `void`

##### Parameters

###### args

...[`JsonValue`](../type-aliases/JsonValue.md)[]

##### Returns

`void`

#### info()

> **info**: (...`args`) => `void`

##### Parameters

###### args

...[`JsonValue`](../type-aliases/JsonValue.md)[]

##### Returns

`void`

#### warn()

> **warn**: (...`args`) => `void`

##### Parameters

###### args

...[`JsonValue`](../type-aliases/JsonValue.md)[]

##### Returns

`void`

#### Remarks

Guaranteed to be present by the plugin host in all lifecycle hooks.
This property is required and always available.

***

### pubsub?

> `optional` **pubsub**: [`IPluginPubSub`](IPluginPubSub.md)

Defined in: [plugins/types.ts:103](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L103)

PubSub instance for plugin real-time events

#### Remarks

Optional - provided when PubSub access is needed
