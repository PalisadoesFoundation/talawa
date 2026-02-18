[Plugin Docs](/)

***

# Function: updateRazorpayConfigResolver()

> **updateRazorpayConfigResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `currency`: `any`; `description`: `any`; `isEnabled`: `any`; `keyId`: `any`; `keySecret`: `any`; `testMode`: `any`; `webhookSecret`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/mutations.ts:35](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/mutations.ts#L35)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `currency`: `string`; `description`: `string`; `isEnabled`: `boolean`; `keyId?`: `string`; `keySecret?`: `string`; `testMode`: `boolean`; `webhookSecret?`: `string`; \} = `razorpayConfigInputSchema`

#### input.currency

`string` = `...`

#### input.description

`string` = `...`

#### input.isEnabled

`boolean` = `...`

#### input.keyId?

`string` = `...`

#### input.keySecret?

`string` = `...`

#### input.testMode

`boolean` = `...`

#### input.webhookSecret?

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `currency`: `any`; `description`: `any`; `isEnabled`: `any`; `keyId`: `any`; `keySecret`: `any`; `testMode`: `any`; `webhookSecret`: `any`; \}\>
