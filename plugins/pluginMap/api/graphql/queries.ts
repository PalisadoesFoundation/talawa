import { desc, eq, sql, and, isNull } from 'drizzle-orm';

import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';
import { pollsTable } from '../database/tables';
import {
  PluginMapPollsResultRef,
  ExtensionPointsOverviewRef,
  PluginMapRequestsResultRef,
} from './types';
import { getPluginMapPollsInputSchema } from './inputs';

// Shared helper to fetch and pagination polls
async function fetchPollsInternal(
  ctx: GraphQLContext,
  filters: {
    userId?: string | null;
    userRole?: string | null;
    organizationId?: string | null;
    extensionPoint?: string | null;
  },
  logLabel: string,
) {
  try {
    const whereConditions = [];

    if (filters.userId) {
      whereConditions.push(eq(pollsTable.userId, filters.userId));
    }

    if (filters.userRole) {
      whereConditions.push(eq(pollsTable.userRole, filters.userRole));
    }

    if (filters.organizationId !== undefined) {
      if (filters.organizationId === null) {
        whereConditions.push(isNull(pollsTable.organizationId));
      } else {
        whereConditions.push(
          eq(pollsTable.organizationId, filters.organizationId),
        );
      }
    }

    if (filters.extensionPoint) {
      whereConditions.push(
        eq(pollsTable.extensionPoint, filters.extensionPoint),
      );
    }

    const limit = 50; // Fixed limit
    const offset = 0; // Fixed offset - currently only first page supported by API for simplicity

    const polls = await ctx.drizzleClient
      .select()
      .from(pollsTable)
      .where(whereConditions.length > 0 ? and(...whereConditions) : undefined)
      .orderBy(desc(pollsTable.createdAt))
      .limit(limit)
      .offset(offset);

    // Get total count
    const countResult = await ctx.drizzleClient
      .select({ count: sql<number>`count(*)` })
      .from(pollsTable)
      .where(whereConditions.length > 0 ? and(...whereConditions) : undefined);

    const count = countResult[0]?.count || 0;

    return {
      items: polls,
      totalCount: count,
      hasMore: count > limit,
    };
  } catch (error) {
    ctx.log?.error(`Error getting plugin map ${logLabel}:`, error);
    throw new TalawaGraphQLError({
      message: `Failed to fetch plugin map ${logLabel}`,
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver to get an overview of all available extension points.
 *
 * This provides static metadata about the extension points supported by the plugin,
 * describing their context, role requirements, and features.
 *
 * @param _parent - The parent resolver (unused).
 * @param _args - The arguments (unused).
 * @param ctx - The GraphQL context.
 * @returns An extension points overview object.
 * @throws {TalawaGraphQLError} If the user is unauthenticated.
 */
export async function getExtensionPointsOverviewResolver(
  _parent: unknown,
  _args: Record<string, unknown>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  try {
    // Return a comprehensive overview of all available extension points
    return {
      extensionPoints: [
        {
          id: 'RA1',
          name: 'Admin Global Route',
          description: "Admin's global view and cross-organization features",
          context: 'Global',
          userRole: 'Admin',
          features: [
            'Global settings',
            'Cross-org management',
            'System-wide admin features',
          ],
        },
        {
          id: 'RA2',
          name: 'Admin Organization Route',
          description: "Admin's organization-specific management features",
          context: 'Organization',
          userRole: 'Admin',
          features: ['Org settings', 'Member management', 'Event management'],
        },
        {
          id: 'RU1',
          name: 'User Organization Route',
          description: "User's organization-specific features",
          context: 'Organization',
          userRole: 'User',
          features: [
            'Org participation',
            'Event registration',
            'Member features',
          ],
        },
        {
          id: 'RU2',
          name: 'User Global Route',
          description: "User's global view and cross-organization features",
          context: 'Global',
          userRole: 'User',
          features: [
            'Global profile',
            'Cross-org settings',
            'Global preferences',
          ],
        },
      ],
      totalCount: 4,
      description:
        'Overview of all available extension points in the Talawa system',
    };
  } catch (error) {
    ctx.log?.error('Error getting extension points overview:', error);
    throw new TalawaGraphQLError({
      message: 'Failed to fetch overview',
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver to fetch plugin map request logs.
 *
 * Allows filtering by user ID, role, organization, and extension point.
 * This function serves as the primary data fetcher for the admin dashboard.
 *
 * @param _parent - The parent resolver (unused).
 * @param args - The arguments containing filter criteria.
 * @param ctx - The GraphQL context.
 * @returns A paginated list of request logs.
 * @throws {TalawaGraphQLError} If the user is unauthenticated or arguments are invalid.
 */
export async function getPluginMapRequestsResolver(
  _parent: unknown,
  args: {
    input?: {
      userId?: string | null;
      userRole?: string | null;
      organizationId?: string | null;
      extensionPoint?: string | null;
    } | null;
  },
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  const input = args.input || {};
  const {
    success,
    data: parsedArgs,
    error,
  } = getPluginMapPollsInputSchema.safeParse(input);

  if (!success) {
    ctx.log?.error('Invalid arguments for getPluginMapRequests:', error);
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: { code: 'unexpected' },
    });
  }

  const result = await fetchPollsInternal(ctx, parsedArgs, 'requests');

  return {
    requests: result.items,
    totalCount: result.totalCount,
    hasMore: result.hasMore,
  };
}

/**
 * Resolver to fetch all logged polls.
 *
 * Similar to `getPluginMapRequestsResolver`, but exposed as a generic poll fetcher.
 *
 * @param _parent - The parent resolver (unused).
 * @param args - The arguments containing filter criteria.
 * @param ctx - The GraphQL context.
 * @returns A paginated list of polls.
 * @throws {TalawaGraphQLError} If the user is unauthenticated or arguments are invalid.
 */
export async function getPluginMapPollsResolver(
  _parent: unknown,
  args: {
    input?: {
      userRole?: string | null;
      organizationId?: string | null;
      extensionPoint?: string | null;
    } | null;
  },
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  const input = args.input || {};
  const {
    success,
    data: parsedArgs,
    error,
  } = getPluginMapPollsInputSchema.safeParse(input);

  if (!success) {
    ctx.log?.error('Invalid arguments for getPluginMapPolls:', error);
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: { code: 'unexpected' },
    });
  }

  const result = await fetchPollsInternal(ctx, parsedArgs, 'polls');

  return {
    polls: result.items,
    totalCount: result.totalCount,
    hasMore: result.hasMore,
  };
}

/**
 * Registers all Plugin Map queries with the GraphQL builder.
 *
 * This function exposes the following queries:
 * - `getExtensionPointsOverview`: Metadata about extension points.
 * - `getPluginMapRequests`: Fetches interaction logs.
 * - `getPluginMapPolls`: Fetches generic poll logs.
 *
 * @param builderInstance - The Pothos schema builder instance.
 */
export function registerPluginMapQueries(
  builderInstance: typeof builder,
): void {
  // Get extension points overview
  builderInstance.queryField('getExtensionPointsOverview', (t) =>
    t.field({
      type: ExtensionPointsOverviewRef,
      description:
        'Get an overview of all available extension points in the system',
      resolve: getExtensionPointsOverviewResolver,
    }),
  );

  // Get plugin map requests
  builderInstance.queryField('getPluginMapRequests', (t) =>
    t.field({
      type: PluginMapRequestsResultRef,
      args: {
        input: t.arg({
          type: builder.inputType('GetPluginMapRequestsInput', {
            fields: (t) => ({
              userId: t.string({ required: false }),
              userRole: t.string({ required: false }),
              organizationId: t.string({ required: false }),
              extensionPoint: t.string({ required: false }),
            }),
          }),
          required: false,
        }),
      },
      description: 'Get logged requests from different contexts',
      resolve: getPluginMapRequestsResolver,
    }),
  );

  // Get plugin map polls
  builderInstance.queryField('getPluginMapPolls', (t) =>
    t.field({
      type: PluginMapPollsResultRef,
      args: {
        input: t.arg({
          type: builder.inputType('GetPluginMapPollsInput', {
            fields: (t) => ({
              userRole: t.string({ required: false }),
              organizationId: t.string({ required: false }),
              extensionPoint: t.string({ required: false }),
            }),
          }),
          required: false,
        }),
      },
      description: 'Get plugin map polls with optional filtering',
      resolve: getPluginMapPollsResolver,
    }),
  );
}
