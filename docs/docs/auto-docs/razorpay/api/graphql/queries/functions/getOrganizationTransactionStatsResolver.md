[Plugin Docs](/)

***

# Function: getOrganizationTransactionStatsResolver()

> **getOrganizationTransactionStatsResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `averageTransactionAmount`: `number`; `currency`: `any`; `failedTransactions`: `any`; `successfulTransactions`: `any`; `totalAmount`: `any`; `totalTransactions`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/queries.ts:385](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/queries.ts#L385)

## Parameters

### \_parent

`unknown`

### args

#### dateFrom?

`string` = `...`

#### dateTo?

`string` = `...`

#### orgId

`string` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `averageTransactionAmount`: `number`; `currency`: `any`; `failedTransactions`: `any`; `successfulTransactions`: `any`; `totalAmount`: `any`; `totalTransactions`: `any`; \}\>
