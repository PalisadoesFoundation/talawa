[Plugin Docs](/)

***

# Function: summarizeTextResolver()

> **summarizeTextResolver**(`_parent`, `args`, `_ctx`): `Promise`\<\{ `originalLength`: `number`; `postId`: `string`; `summary`: `string`; `summaryLength`: `number`; \}\>

Defined in: [plugins/summarizeT5/api/graphql/mutations.ts:11](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/summarizeT5/api/graphql/mutations.ts#L11)

## Parameters

### \_parent

`unknown`

### args

#### input

\{ `postId?`: `string`; `text`: `string`; \} = `summarizeInputSchema`

#### input.postId?

`string` = `...`

#### input.text

`string` = `...`

### \_ctx

`GraphQLContext`

## Returns

`Promise`\<\{ `originalLength`: `number`; `postId`: `string`; `summary`: `string`; `summaryLength`: `number`; \}\>
