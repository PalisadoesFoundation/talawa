[Plugin Docs](/)

***

# Type Alias: JsonValue

> **JsonValue** = `string` \| `number` \| `boolean` \| `null` \| `JsonValue`[] \| \{\[`key`: `string`\]: `JsonValue`; \}

Defined in: [plugins/types.ts:14](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/types.ts#L14)

JSON-serializable value type for safe logging
Prevents logging of functions, class instances, and non-serializable values
