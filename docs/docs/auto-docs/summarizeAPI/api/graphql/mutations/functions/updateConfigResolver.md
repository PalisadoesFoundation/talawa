[Plugin Docs](/)

***

# Function: updateConfigResolver()

> **updateConfigResolver**(`_parent`, `args`, `ctx`): `Promise`\<\{ `apiEndpoint`: `any`; `apiKey`: `any`; `isEnabled`: `any`; `maxLength`: `any`; `timeoutSeconds`: `any`; \}\>

Defined in: [plugins/summarizeAPI/api/graphql/mutations.ts:167](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/summarizeAPI/api/graphql/mutations.ts#L167)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `apiEndpoint?`: `string`; `apiKey?`: `string`; `isEnabled`: `boolean`; `maxLength`: `number`; `timeoutSeconds`: `number`; \} = `summarizeAPIConfigInputSchema`

#### input.apiEndpoint?

`string` = `...`

#### input.apiKey?

`string` = `...`

#### input.isEnabled

`boolean` = `...`

#### input.maxLength

`number` = `...`

#### input.timeoutSeconds

`number` = `...`

### ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `apiEndpoint`: `any`; `apiKey`: `any`; `isEnabled`: `any`; `maxLength`: `any`; `timeoutSeconds`: `any`; \}\>
