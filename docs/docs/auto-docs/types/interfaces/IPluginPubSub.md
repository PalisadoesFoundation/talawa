[Plugin Docs](/)

***

# Interface: IPluginPubSub

Defined in: [plugins/types.ts:119](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L119)

Interface for PubSub operations available to plugins

## Methods

### asyncIterator()

> **asyncIterator**\<`T`\>(`triggers`): `AsyncIterator`\<`T`\>

Defined in: [plugins/types.ts:121](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L121)

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### triggers

`string` | `string`[]

#### Returns

`AsyncIterator`\<`T`\>

***

### publish()

> **publish**\<`T`\>(`triggerName`, `payload`): `void` \| `Promise`\<`void`\>

Defined in: [plugins/types.ts:120](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L120)

#### Type Parameters

##### T

`T` = `unknown`

#### Parameters

##### triggerName

`string`

##### payload

`T`

#### Returns

`void` \| `Promise`\<`void`\>
