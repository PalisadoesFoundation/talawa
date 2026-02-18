[Plugin Docs](/)

***

# Variable: pollsTable

> `const` **pollsTable**: `PgTableWithColumns`\<\{ \}\>

Defined in: [plugins/pluginMap/api/database/tables.ts:19](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/pluginMap/api/database/tables.ts#L19)

Plugin Map Polls Table Definition.

Represents the `plugin_map_polls` table in the database.
This table stores "polls" or requests made from the frontend to specific extension points,
serving as a logging mechanism to visualize plugin activity.

Columns:
- `id`: UUID primary key.
- `pollNumber`: Incrementing integer sequence for easy human reference.
- `userId`: ID of the user triggering the request.
- `userRole`: Role of the user (e.g., 'User', 'Admin').
- `organizationId`: Optional organization ID context.
- `extensionPoint`: The specific extension point triggered (e.g., 'RA1', 'RU2').
- `createdAt`: Timestamp of creation.
