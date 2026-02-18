[Plugin Docs](/)

***

# Function: createPaymentOrderResolver()

> **createPaymentOrderResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `amount`: `any`; `anonymous`: `any`; `createdAt`: `any`; `currency`: `any`; `description`: `any`; `donorEmail`: `any`; `donorName`: `any`; `donorPhone`: `any`; `id`: `any`; `organizationId`: `any`; `razorpayOrderId`: `any`; `status`: `any`; `updatedAt`: `any`; `userId`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/mutations.ts:163](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/mutations.ts#L163)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `amount`: `number`; `currency`: `string`; `description?`: `string`; `donorEmail?`: `string`; `donorName?`: `string`; `donorPhone?`: `string`; `organizationId?`: `string`; `userId?`: `string`; \} = `razorpayOrderInputSchema`

#### input.amount

`number` = `...`

#### input.currency

`string` = `...`

#### input.description?

`string` = `...`

#### input.donorEmail?

`string` = `...`

#### input.donorName?

`string` = `...`

#### input.donorPhone?

`string` = `...`

#### input.organizationId?

`string` = `...`

#### input.userId?

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `amount`: `any`; `anonymous`: `any`; `createdAt`: `any`; `currency`: `any`; `description`: `any`; `donorEmail`: `any`; `donorName`: `any`; `donorPhone`: `any`; `id`: `any`; `organizationId`: `any`; `razorpayOrderId`: `any`; `status`: `any`; `updatedAt`: `any`; `userId`: `any`; \}\>
