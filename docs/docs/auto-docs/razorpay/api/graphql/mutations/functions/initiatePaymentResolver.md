[Plugin Docs](/)

***

# Function: initiatePaymentResolver()

> **initiatePaymentResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `amount`: `any`; `currency`: `any`; `message`: `string`; `orderId`: `any`; `paymentId`: `string`; `success`: `boolean`; `transaction`: \{ `amount`: `any`; `currency`: `any`; `paymentId`: `string`; `status`: `string`; \}; \} \| \{ `amount?`: `undefined`; `currency?`: `undefined`; `message`: `string`; `orderId?`: `undefined`; `paymentId?`: `undefined`; `success`: `boolean`; `transaction`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/mutations.ts:275](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/mutations.ts#L275)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `customerDetails?`: \{ `contact`: `string`; `email`: `string`; `name`: `string`; \}; `orderId`: `string`; `paymentMethod`: `string`; \} = `razorpayPaymentInputSchema`

#### input.customerDetails?

\{ `contact`: `string`; `email`: `string`; `name`: `string`; \} = `...`

#### input.customerDetails.contact

`string` = `...`

#### input.customerDetails.email

`string` = `...`

#### input.customerDetails.name

`string` = `...`

#### input.orderId

`string` = `...`

#### input.paymentMethod

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `amount`: `any`; `currency`: `any`; `message`: `string`; `orderId`: `any`; `paymentId`: `string`; `success`: `boolean`; `transaction`: \{ `amount`: `any`; `currency`: `any`; `paymentId`: `string`; `status`: `string`; \}; \} \| \{ `amount?`: `undefined`; `currency?`: `undefined`; `message`: `string`; `orderId?`: `undefined`; `paymentId?`: `undefined`; `success`: `boolean`; `transaction`: `any`; \}\>
