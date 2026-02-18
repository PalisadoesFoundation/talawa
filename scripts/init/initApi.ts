// scripts/initAPI.ts
import { spinner } from '@clack/prompts';
import { mkdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

/**
 * Scaffolds the Server/API side of a plugin.
 *
 * tree:
 * plugins/<name>/api/
 * ├─ database/
 * │  └─ tables.ts
 * ├─ graphql/
 * │  ├─ queries.ts
 * │  ├─ mutations.ts
 * │  ├─ types.ts
 * │  └─ inputs.ts
 * ├─ index.ts
 * ├─ manifest.json
 * └─ README.md
 */
export function createAPISkeleton(
  pluginName: string,
  pluginsRoot = 'plugins',
): void {
  if (!pluginName || pluginName.trim() === '') {
    throw new Error('Plugin name cannot be empty');
  }

  if (!/^[a-zA-Z0-9-_]+$/.test(pluginName)) {
    throw new Error(
      'Plugin name can only contain letters, numbers, hyphens, and underscores',
    );
  }

  const s = spinner();
  s.start('Creating API skeleton…');

  const apiRoot = join(pluginsRoot, pluginName, 'api');
  const dbDir = join(apiRoot, 'database');
  const gqlDir = join(apiRoot, 'graphql');

  [dbDir, gqlDir].forEach((d) => mkdirSync(d, { recursive: true }));

  // Database tables
  writeFileSync(
    join(dbDir, 'tables.ts'),
    `import { pgTable, text, timestamp, uuid } from 'drizzle-orm/pg-core';

export const ${camelCase(pluginName)}Table = pgTable('${pluginName.toLowerCase()}', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  description: text('description'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
  updatedAt: timestamp('updated_at').defaultNow().notNull(),
});

export type ${pascal(pluginName)} = typeof ${camelCase(pluginName)}Table.$inferSelect;
export type New${pascal(pluginName)} = typeof ${camelCase(pluginName)}Table.$inferInsert;
`,
  );

  // GraphQL types
  writeFileSync(
    join(gqlDir, 'types.ts'),
    `import { z } from 'zod';

export const ${pascal(pluginName)}Schema = z.object({
  id: z.string(),
  name: z.string(),
  description: z.string().optional(),
  createdAt: z.string(),
  updatedAt: z.string(),
});

export type ${pascal(pluginName)}Type = z.infer<typeof ${pascal(pluginName)}Schema>;

export const ${pascal(pluginName)}ListSchema = z.array(${pascal(pluginName)}Schema);
export type ${pascal(pluginName)}ListType = z.infer<typeof ${pascal(pluginName)}ListSchema>;
`,
  );

  // GraphQL inputs
  writeFileSync(
    join(gqlDir, 'inputs.ts'),
    `import { z } from 'zod';

export const Create${pascal(pluginName)}InputSchema = z.object({
  name: z.string().min(1, 'Name is required'),
  description: z.string().optional(),
});

export type Create${pascal(pluginName)}Input = z.infer<typeof Create${pascal(pluginName)}InputSchema>;

export const Update${pascal(pluginName)}InputSchema = z.object({
  id: z.string().min(1, 'ID is required'),
  name: z.string().min(1, 'Name is required').optional(),
  description: z.string().optional(),
});

export type Update${pascal(pluginName)}Input = z.infer<typeof Update${pascal(pluginName)}InputSchema>;
`,
  );

  // GraphQL queries
  writeFileSync(
    join(gqlDir, 'queries.ts'),
    `import type { IPluginContext } from '~/src/plugin/types';
import { ${pascal(pluginName)}ListSchema } from './types';

export function register${pascal(pluginName)}Queries(graphql: any): void {
  graphql.extendQuery({
    get${pascal(pluginName)}s: {
      type: ${pascal(pluginName)}ListSchema,
      resolve: async (parent: any, args: any, context: IPluginContext) => {
        try {
          // TODO: Implement query logic
          return [];
        } catch (error) {
          throw new Error(\`Failed to fetch ${pluginName}s: \${error}\`);
        }
      },
    },
  });
}
`,
  );

  // GraphQL mutations
  writeFileSync(
    join(gqlDir, 'mutations.ts'),
    `import type { IPluginContext } from '~/src/plugin/types';
import { ${pascal(pluginName)}Schema, Create${pascal(pluginName)}InputSchema, Update${pascal(pluginName)}InputSchema } from './types';

export function register${pascal(pluginName)}Mutations(graphql: any): void {
  graphql.extendMutation({
    create${pascal(pluginName)}: {
      type: ${pascal(pluginName)}Schema,
      args: {
        input: Create${pascal(pluginName)}InputSchema,
      },
      resolve: async (parent: any, { input }: { input: any }, context: IPluginContext) => {
        try {
          // TODO: Implement creation logic
          return {
            id: 'temp-id',
            name: input.name,
            description: input.description,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
          };
        } catch (error) {
          throw new Error(\`Failed to create ${pluginName}: \${error}\`);
        }
      },
    },

    update${pascal(pluginName)}: {
      type: ${pascal(pluginName)}Schema,
      args: {
        input: Update${pascal(pluginName)}InputSchema,
      },
      resolve: async (parent: any, { input }: { input: any }, context: IPluginContext) => {
        try {
          // TODO: Implement update logic
          return {
            id: input.id,
            name: input.name || 'Updated Name',
            description: input.description,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
          };
        } catch (error) {
          throw new Error(\`Failed to update ${pluginName}: \${error}\`);
        }
      },
    },
  });
}
`,
  );

  // Main index.ts
  writeFileSync(
    join(apiRoot, 'index.ts'),
    `import type { IPluginContext } from '~/src/plugin/types';

// Export all GraphQL components
export * from './graphql/queries';
export * from './graphql/mutations';
export * from './graphql/types';
export * from './graphql/inputs';

// Lifecycle hooks
export async function onLoad(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('${pascal(pluginName)} Plugin loaded successfully');
  }

  // Initialize plugin table if it doesn't exist
  try {
    const { ${camelCase(pluginName)}Table } = await import('./database/tables');

    // Check if table exists by trying to query it
    if (context.db && typeof context.db === 'object' && 'select' in context.db) {
      const db = context.db as any;
      await db.select().from(${camelCase(pluginName)}Table).limit(1);
    }

    if (context.logger?.info) {
      context.logger.info('${pascal(pluginName)} table verified');
    }
  } catch (error) {
    if (context.logger?.warn) {
      context.logger.warn('Failed to verify plugin table:', error);
    }
  }
}

export async function onActivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('${pascal(pluginName)} Plugin activated');
  }

  // Register GraphQL schema extensions
  if (context.graphql) {
    try {
      const { register${pascal(pluginName)}Queries } = await import('./graphql/queries');
      const { register${pascal(pluginName)}Mutations } = await import('./graphql/mutations');

      // Register queries and mutations with the GraphQL builder
      register${pascal(pluginName)}Queries(context.graphql as any);
      register${pascal(pluginName)}Mutations(context.graphql as any);

      if (context.logger?.info) {
        context.logger.info('GraphQL schema extensions registered for ${pascal(pluginName)} Plugin');
      }
    } catch (error) {
      if (context.logger?.error) {
        context.logger.error('Failed to register GraphQL extensions:', error);
      }
    }
  }
}

export async function onDeactivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('${pascal(pluginName)} Plugin deactivated');
  }
}

export async function onUnload(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('${pascal(pluginName)} Plugin unloaded');
  }
}

// Plugin information
export function getPluginInfo() {
  return {
    name: '${pascal(pluginName)}',
    version: '1.0.0',
    description: '${pascal(pluginName)} plugin for Talawa',
    author: '${pascal(pluginName)} Team',
    dependencies: [],
    graphqlOperations: [
      'get${pascal(pluginName)}s',
      'create${pascal(pluginName)}',
      'update${pascal(pluginName)}',
    ],
  };
}
`,
  );

  // Manifest.json
  writeFileSync(
    join(apiRoot, 'manifest.json'),
    JSON.stringify(
      {
        name: pascal(pluginName),
        pluginId: camelCase(pluginName),
        version: '1.0.0',
        description: `A ${pluginName} plugin that provides ${pluginName} functionality.`,
        author: 'Palisadoes Foundation',
        main: 'index.ts',
        extensionPoints: {
          graphql: [
            {
              type: 'query',
              name: `${camelCase(pluginName)}Queries`,
              file: 'graphql/queries.ts',
              builderDefinition: `register${pascal(pluginName)}Queries`,
              description: `Register all ${pascal(pluginName)} query fields`,
            },
            {
              type: 'mutation',
              name: `${camelCase(pluginName)}Mutations`,
              file: 'graphql/mutations.ts',
              builderDefinition: `register${pascal(pluginName)}Mutations`,
              description: `Register all ${pascal(pluginName)} mutation fields`,
            },
          ],
          database: [
            {
              type: 'table',
              name: `${camelCase(pluginName)}Table`,
              file: 'database/tables.ts',
              description: `${pascal(pluginName)} data table`,
            },
          ],
        },
      },
      null,
      2,
    ),
  );

  // README.md
  writeFileSync(
    join(apiRoot, 'README.md'),
    `# ${pascal(pluginName)} – API module

This folder contains the server-side code that extends **Talawa-API**.

## Structure

- \`database/\` - Database table definitions and migrations
- \`graphql/\` - GraphQL schema, resolvers, and type definitions
- \`index.ts\` - Main plugin entry point with lifecycle hooks
- \`manifest.json\` - Plugin metadata and extension point definitions

## GraphQL Operations

- \`get${pascal(pluginName)}s\` - Query to fetch all ${pluginName}s
- \`create${pascal(pluginName)}\` - Mutation to create a new ${pluginName}
- \`update${pascal(pluginName)}\` - Mutation to update an existing ${pluginName}

## Database

The plugin creates a \`${pluginName.toLowerCase()}\` table with the following fields:
- \`id\` (UUID, Primary Key)
- \`name\` (Text, Required)
- \`description\` (Text, Optional)
- \`created_at\` (Timestamp)
- \`updated_at\` (Timestamp)
`,
  );

  s.stop('API skeleton created.');
}

// ──────────────────────────────────────────────────────────────
function pascal(str: string): string {
  return str
    .split(/[-_]/)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join('');
}

function camelCase(str: string): string {
  return str
    .split(/[-_]/)
    .map((w, i) =>
      i === 0
        ? w.toLowerCase()
        : w.charAt(0).toUpperCase() + w.slice(1).toLowerCase(),
    )
    .join('');
}
