[Plugin Docs](/)

***

# Interface: PluginRequest

Defined in: [plugins/razorpay/api/index.ts:103](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/index.ts#L103)

Plugin request with context

## Properties

### body

> **body**: `RazorpayWebhookPayload`

Defined in: [plugins/razorpay/api/index.ts:104](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/index.ts#L104)

***

### headers

> **headers**: `Record`\<`string`, `string` \| `string`[] \| `undefined`\>

Defined in: [plugins/razorpay/api/index.ts:105](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/index.ts#L105)

***

### organizationId?

> `optional` **organizationId**: `string`

Defined in: [plugins/razorpay/api/index.ts:106](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/index.ts#L106)

***

### pluginContext?

> `optional` **pluginContext**: `object`

Defined in: [plugins/razorpay/api/index.ts:107](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/index.ts#L107)

#### db

> **db**: `DrizzleDB`

#### logger

> **logger**: `object`

##### logger.error()

> **error**(`message`, `data?`): `void`

###### Parameters

###### message

`string`

###### data?

`unknown`

###### Returns

`void`

##### logger.info()

> **info**(`message`, `data?`): `void`

###### Parameters

###### message

`string`

###### data?

`unknown`

###### Returns

`void`

##### logger.warn()

> **warn**(`message`, `data?`): `void`

###### Parameters

###### message

`string`

###### data?

`unknown`

###### Returns

`void`
