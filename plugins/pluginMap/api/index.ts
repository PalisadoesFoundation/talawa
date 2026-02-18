import type { IPluginContext } from '~/src/plugin/types';

// Export all GraphQL components
export * from './graphql/queries';
export * from './graphql/mutations';
export * from './graphql/types';
export * from './graphql/inputs';

// Lifecycle hooks
export async function onLoad(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin loaded successfully');
  }

  // Initialize plugin table if it doesn't exist
  try {
    const { pollsTable } = await import('./database/tables');

    // Check if table exists by trying to query it
    if (
      context.db &&
      typeof context.db === 'object' &&
      'select' in context.db
    ) {
      const db = context.db as any;
      await db.select().from(pollsTable).limit(1);
    }

    if (context.logger?.info) {
      context.logger.info('Plugin Map polls table verified');
    }
  } catch (error) {
    if (context.logger?.warn) {
      context.logger.warn('Failed to verify plugin table:', error);
    }
  }
}

export async function onActivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin activated');
  }
}

export async function onDeactivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin deactivated');
  }
}

export async function onUnload(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin unloaded');
  }
}

// Hook handlers
export async function onPluginActivated(
  context: IPluginContext,
): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin activated via hook');
  }
}

export async function onPluginDeactivated(
  context: IPluginContext,
): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Plugin Map Plugin deactivated via hook');
  }
}

// Plugin information
export function getPluginInfo() {
  return {
    name: 'Plugin Map',
    version: '1.0.0',
    description: 'Simple polling system to test requests from frontend',
    author: 'Plugin Map Team',
    dependencies: [],
    graphqlOperations: [
      'getExtensionPointsOverview',
      'getPluginMapRequests',
      'getPluginMapPolls',
      'logPluginMapRequest',
      'logPluginMapPoll',
      'clearPluginMapRequests',
      'clearPluginMapPolls',
    ],
  };
}
