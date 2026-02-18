import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { eq } from 'drizzle-orm';
import { SummarizeAPIConfigRef } from './types';
import { configTable } from '../database/tables';

// Get configuration resolver
export async function getConfigResolver(
  _parent: unknown,
  _args: unknown,
  ctx: GraphQLContext,
) {
  try {
    const configs = await ctx.drizzleClient
      .select()
      .from(configTable)
      .where(eq(configTable.id, 'default'))
      .limit(1);

    if (configs.length === 0) {
      // Create default config
      const [newConfig] = await ctx.drizzleClient
        .insert(configTable)
        .values({
          id: 'default',
          apiEndpoint: null,
          apiKey: null,
          isEnabled: false,
          maxLength: 150,
          requestFormat: 'json',
          responseFormat: 'json',
          timeoutSeconds: 30,
        })
        .returning();

      return {
        apiEndpoint: newConfig?.apiEndpoint || null,
        apiKey: newConfig?.apiKey || null,
        isEnabled: newConfig?.isEnabled || false,
        maxLength: newConfig?.maxLength || 150,
        timeoutSeconds: newConfig?.timeoutSeconds || 30,
      };
    }

    const config = configs[0];
    return {
      apiEndpoint: config?.apiEndpoint || null,
      apiKey: config?.apiKey || null,
      isEnabled: config?.isEnabled || false,
      maxLength: config?.maxLength || 150,
      timeoutSeconds: config?.timeoutSeconds || 30,
    };
  } catch (error) {
    ctx.log?.error('Error getting SummarizeAPI config:', error);
    // Return default config on error
    return {
      apiEndpoint: null,
      apiKey: null,
      isEnabled: false,
      maxLength: 150,
      timeoutSeconds: 30,
    };
  }
}

// Health check resolver
export async function summarizeAPIHealthResolver() {
  return 'ok';
}

// Register all SummarizeAPI queries with the builder
export function registerSummarizeAPIQueries(
  builderInstance: typeof builder,
): void {
  builderInstance.queryField('getConfig', (t) =>
    t.field({
      type: SummarizeAPIConfigRef,
      description: 'Get SummarizeAPI configuration',
      resolve: getConfigResolver,
    }),
  );

  builderInstance.queryField('summarizeAPIHealth', (t) =>
    t.field({
      type: 'String',
      description: 'Health status for SummarizeAPI plugin',
      resolve: summarizeAPIHealthResolver,
    }),
  );
}
