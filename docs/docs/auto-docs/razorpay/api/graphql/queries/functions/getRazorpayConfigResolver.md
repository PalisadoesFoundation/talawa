[Plugin Docs](/)

***

# Function: getRazorpayConfigResolver()

> **getRazorpayConfigResolver**(`_parent`, `_args`, `ctx`): `Promise`\<\{ `currency`: `any`; `description`: `any`; `isEnabled`: `any`; `keyId`: `any`; `keySecret`: `any`; `testMode`: `any`; `webhookSecret`: `any`; \}\>

Defined in: [plugins/razorpay/api/graphql/queries.ts:21](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/graphql/queries.ts#L21)

Resolver for fetching Razorpay configuration.
Requires authentication and superadmin privileges.

## Parameters

### \_parent

`unknown`

### \_args

`Record`\<`string`, `unknown`\>

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `currency`: `any`; `description`: `any`; `isEnabled`: `any`; `keyId`: `any`; `keySecret`: `any`; `testMode`: `any`; `webhookSecret`: `any`; \}\>
