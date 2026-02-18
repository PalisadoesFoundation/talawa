[Plugin Docs](/)

***

# Interface: IPluginLifecycle\<TDb, TConfig\>

Defined in: [plugins/types.ts:185](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L185)

Plugin lifecycle interface

Defines the contract for plugin lifecycle hooks that must be implemented
by all plugins to ensure proper initialization, activation, and cleanup.
All hooks receive a context object for accessing shared resources.

## Error Handling

Lifecycle hooks are allowed to throw or return rejected Promises to signal failure.
Use descriptive Error messages (or a custom PluginError class) so the host can
distinguish plugin errors from system errors.

**Caller behavior on failure:**
- The host stops the current lifecycle step
- The error bubbles up to the host application
- The host may attempt rollback (call onDeactivate/onUninstall) or retry
- Plugins should implement compensating/rollback logic where meaningful

## Required vs Optional Hooks

| Hook | Recommendation | Notes |
|------|----------------|-------|
| `onActivate` | **Recommended** | Primary hook for setup; always implement |
| `onDeactivate` | **Recommended** | Cleanup resources; pair with onActivate |
| `onInstall` | Optional | First-time setup; not called on every activation |
| `onUninstall` | Optional | Data cleanup; ensure complete removal |
| `onUpdate` | Optional | Version migrations; only when schema changes |
| `onLoad`/`onUnload` | Rarely needed | Low-level memory management |

**Note:** `onActivate` may be invoked without a prior `onInstall` call if the
plugin was pre-installed or the system is restoring state. Guard accordingly.

## Idempotency Requirements

All hooks MUST be safe to run multiple times (idempotent):

- **onInstall**: Check if already installed before creating resources
- **onActivate**: Check `context.isActive` to prevent double-activation
- **onDeactivate**: Safe to call even if already deactivated
- **onUninstall**: Safe to call even if resources don't exist

## Example

```typescript
const MyPlugin: IPluginLifecycle = {
  onActivate: async (context) => {
    if (context.isActive) {
      context.logger.warn('Plugin already active, skipping activation');
      return;
    }
    // Perform activation...
  },
  onDeactivate: async (context) => {
    // Cleanup resources...
  },
};
```

## Type Parameters

### TDb

`TDb` = `unknown`

Type for the database connection

### TConfig

`TConfig` = [`PluginConfig`](../type-aliases/PluginConfig.md)

Type for plugin configuration

## Properties

### onActivate()?

> `optional` **onActivate**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:211](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L211)

Called when plugin is activated

**Primary setup hook** - Use for validation, SDK initialization, and resource setup.
This is the most commonly implemented hook.

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context with db, logger, and config

#### Returns

`Promise`\<`void`\>

#### Remarks

- Check `context.isActive` for idempotency
- May be called without prior onInstall (e.g., system restore)
- If activation fails, throw an Error; host may call onDeactivate for cleanup

#### Throws

Error if activation fails; message should be user-friendly

***

### onDeactivate()?

> `optional` **onDeactivate**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:226](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L226)

Called when plugin is deactivated

Use for cleanup, canceling in-flight operations, and releasing resources.
Should be safe to call multiple times (idempotent).

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context with db, logger, and config

#### Returns

`Promise`\<`void`\>

#### Remarks

- Called when user disables plugin or before uninstall
- May be called as rollback if onActivate fails
- Should not throw; log errors and continue cleanup

***

### onInstall()?

> `optional` **onInstall**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:251](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L251)

Called when plugin is first installed

Use for creating default configuration, database records, and registering
webhooks. Only called once per installation (not on every activation).

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context with db and logger

#### Returns

`Promise`\<`void`\>

#### Remarks

- `context.config` may be undefined (set defaults here)
- Must be idempotent: check if already installed before creating resources
- If installation fails, throw Error; host will not proceed

#### Throws

Error if installation fails; message should describe what went wrong

***

### onLoad()?

> `optional` **onLoad**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:195](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L195)

Called when plugin is loaded into memory

Use for initial setup and resource allocation that must happen before
any other hooks. Rarely needed; prefer onActivate for most setup.

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context (db may not be available yet)

#### Returns

`Promise`\<`void`\>

#### Throws

Error if loading fails; host will not proceed with activation

***

### onUninstall()?

> `optional` **onUninstall**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:265](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L265)

Called when plugin is uninstalled

Use for removing configuration, cleaning up data, and unregistering webhooks.
Should completely remove plugin presence from the system.

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context with db, logger, and config

#### Returns

`Promise`\<`void`\>

#### Remarks

- Must be idempotent: safe to call even if resources don't exist
- Should not throw; log errors and continue cleanup

***

### onUnload()?

> `optional` **onUnload**: (`context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:235](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L235)

Called when plugin is unloaded from memory

Use for final cleanup and resource release. Rarely needed.

#### Parameters

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context (some resources may already be unavailable)

#### Returns

`Promise`\<`void`\>

***

### onUpdate()?

> `optional` **onUpdate**: (`fromVersion`, `toVersion`, `context`) => `Promise`\<`void`\>

Defined in: [plugins/types.ts:293](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L293)

Called when plugin is updated from one version to another

Use for database migrations, configuration transformations, and data
format updates between versions.

#### Parameters

##### fromVersion

`string`

Previous plugin version (semver string)

##### toVersion

`string`

New plugin version (semver string)

##### context

[`IPluginContext`](IPluginContext.md)\<`TDb`, `TConfig`\>

Plugin context with db, logger, and config

#### Returns

`Promise`\<`void`\>

#### Remarks

- Compare fromVersion and toVersion to determine needed migrations
- Must be idempotent: safe to run the same migration multiple times
- If migration fails, throw Error; host may attempt rollback

#### Throws

Error if migration fails; host may rollback to previous version

#### Example

```typescript
onUpdate: async (fromVersion, toVersion, context) => {
  if (semver.lt(fromVersion, '2.0.0') && semver.gte(toVersion, '2.0.0')) {
    // Migrate database schema from v1 to v2
    await migrateToV2(context.db);
  }
}
```
