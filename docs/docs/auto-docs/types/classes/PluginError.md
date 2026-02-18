[Plugin Docs](/)

***

# Class: PluginError

Defined in: [plugins/types.ts:311](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L311)

Custom error class for plugin-related errors

Use this to throw/catch plugin-specific errors that can be distinguished
from generic system errors. Includes plugin name and hook context for debugging.

## Example

```typescript
throw new PluginError('Database connection required', 'Razorpay', 'onActivate');
```

## Extends

- `Error`

## Constructors

### Constructor

> **new PluginError**(`message`, `pluginName?`, `hook?`): `PluginError`

Defined in: [plugins/types.ts:318](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L318)

#### Parameters

##### message

`string`

##### pluginName?

`string`

##### hook?

keyof [`IPluginLifecycle`](../interfaces/IPluginLifecycle.md)\<`unknown`, [`PluginConfig`](../type-aliases/PluginConfig.md)\>

#### Returns

`PluginError`

#### Overrides

`Error.constructor`

## Properties

### hook?

> `readonly` `optional` **hook**: keyof [`IPluginLifecycle`](../interfaces/IPluginLifecycle.md)\<`unknown`, [`PluginConfig`](../type-aliases/PluginConfig.md)\>

Defined in: [plugins/types.ts:316](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L316)

Lifecycle hook where the error occurred

***

### pluginName?

> `readonly` `optional` **pluginName**: `string`

Defined in: [plugins/types.ts:313](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L313)

Name of the plugin that threw the error
