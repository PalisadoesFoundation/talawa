[Plugin Docs](/)

***

# Function: getUserTransactionStatsResolver()

> **getUserTransactionStatsResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `averageTransactionAmount`: `number`; `currency`: `string`; `failedCount?`: `undefined`; `failedTransactions`: `number`; `pendingCount?`: `undefined`; `successCount?`: `undefined`; `successfulTransactions`: `number`; `totalAmount`: `number`; `totalTransactions`: `number`; \} \| \{ `averageTransactionAmount?`: `undefined`; `currency`: `any`; `failedCount`: `any`; `failedTransactions?`: `undefined`; `pendingCount`: `any`; `successCount`: `any`; `successfulTransactions?`: `undefined`; `totalAmount`: `any`; `totalTransactions`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/queries.ts:494](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/queries.ts#L494)

Resolver for fetching transaction statistics for a specific user.
Returns aggregation of user transactions.

## Parameters

### \_parent

`unknown`

### args

#### dateFrom?

`string` = `...`

#### dateTo?

`string` = `...`

#### userId

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `averageTransactionAmount`: `number`; `currency`: `string`; `failedCount?`: `undefined`; `failedTransactions`: `number`; `pendingCount?`: `undefined`; `successCount?`: `undefined`; `successfulTransactions`: `number`; `totalAmount`: `number`; `totalTransactions`: `number`; \} \| \{ `averageTransactionAmount?`: `undefined`; `currency`: `any`; `failedCount`: `any`; `failedTransactions?`: `undefined`; `pendingCount`: `any`; `successCount`: `any`; `successfulTransactions?`: `undefined`; `totalAmount`: `any`; `totalTransactions`: `any`; \}\>
