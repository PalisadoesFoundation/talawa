[Plugin Docs](/)

***

# Function: verifyPaymentResolver()

> **verifyPaymentResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `message`: `string`; `success`: `boolean`; `transaction`: \{ `amount`: `any`; `currency`: `any`; `paymentId`: `string`; `status`: `string`; \}; \}\>

Defined in: [plugins/razorpay/api/graphql/mutations.ts:415](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/mutations.ts#L415)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `paymentData`: `string`; `razorpayOrderId`: `string`; `razorpayPaymentId`: `string`; `razorpaySignature`: `string`; \} = `razorpayVerificationInputSchema`

#### input.paymentData

`string` = `...`

#### input.razorpayOrderId

`string` = `...`

#### input.razorpayPaymentId

`string` = `...`

#### input.razorpaySignature

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `message`: `string`; `success`: `boolean`; `transaction`: \{ `amount`: `any`; `currency`: `any`; `paymentId`: `string`; `status`: `string`; \}; \}\>
