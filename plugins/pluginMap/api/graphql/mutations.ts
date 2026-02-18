import { sql } from 'drizzle-orm';

import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';
import { pollsTable } from '../database/tables';
import { PluginMapPollRef, ClearPollsResultRef } from './types';
import { pluginMapPollInputSchema } from './inputs';

// Shared helper for logging polls
async function logPollInternal(
  ctx: GraphQLContext,
  parsedArgs: {
    userId: string;
    userRole: string;
    organizationId?: string | null;
    extensionPoint: string;
  },
  logLabel: string,
) {
  try {
    return await ctx.drizzleClient.transaction(async (tx) => {
      // Get the next poll number atomically within transaction
      const maxPollResult = await tx
        .select({
          maxPollNumber: sql<number>`COALESCE(MAX(${pollsTable.pollNumber}), 0)`,
        })
        .from(pollsTable);

      const maxPollNumber = maxPollResult[0]?.maxPollNumber || 0;
      const nextPollNumber = maxPollNumber + 1;

      // Insert the new poll
      const [newPoll] = await tx
        .insert(pollsTable)
        .values({
          pollNumber: nextPollNumber,
          userId: parsedArgs.userId,
          userRole: parsedArgs.userRole,
          organizationId: parsedArgs.organizationId,
          extensionPoint: parsedArgs.extensionPoint,
        })
        .returning();

      ctx.log?.info(
        `Plugin Map: Logged ${logLabel} ${nextPollNumber} from ${parsedArgs.extensionPoint} by ${parsedArgs.userRole} ${parsedArgs.userId}`,
      );

      return newPoll;
    });
  } catch (error) {
    ctx.log?.error(`Error logging plugin map ${logLabel}:`, error);
    throw new TalawaGraphQLError({
      message: `Failed to log plugin map ${logLabel}`,
      extensions: { code: 'unexpected' },
    });
  }
}

// Shared helper for clearing polls
async function clearPollsInternal(ctx: GraphQLContext, logLabel: string) {
  // Ensure only admins can clear logs
  // Note: Check role property availability or strictly check if role is 'superuser' or similar if 'administrator' is not standard.
  // Using 'superuser' and 'admin' as common conventions.
  const user = ctx.currentClient.user;
  const isAdmin =
    user?.role === 'superuser' ||
    user?.role === 'admin' ||
    user?.role === 'administrator';

  if (!isAdmin) {
    throw new TalawaGraphQLError({
      message: 'Unauthorized: Only admins can clear logs',
      extensions: { code: 'unauthorized_action' },
    });
  }

  try {
    // Get count before deletion
    const countResult = await ctx.drizzleClient
      .select({ count: sql<number>`count(*)` })
      .from(pollsTable);

    const count = countResult[0]?.count || 0;

    // Delete all polls
    await ctx.drizzleClient.delete(pollsTable);

    ctx.log?.info(`Plugin Map: Cleared ${count} logged ${logLabel}s`);

    return {
      success: true,
      clearedCount: count,
      message: `Cleared ${count} ${logLabel}s`,
    };
  } catch (error) {
    ctx.log?.error(`Error clearing plugin map ${logLabel}s:`, error);
    throw new TalawaGraphQLError({
      message: `Failed to clear plugin map ${logLabel}s`,
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver to log a new plugin map request.
 *
 * This function handles requests from both admin and user contexts,
 * logging the interaction details into the database.
 *
 * @param _parent - The parent resolver (unused).
 * @param args - The arguments containing the request input.
 * @param ctx - The GraphQL context containing database client and authentication info.
 * @returns The newly created poll record.
 * @throws {TalawaGraphQLError} If the user is unauthenticated or arguments are invalid.
 */
export async function logPluginMapRequestResolver(
  _parent: unknown,
  args: {
    input: {
      userId: string;
      userRole: string;
      organizationId?: string | null;
      extensionPoint: string;
    };
  },
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = pluginMapPollInputSchema.safeParse(args.input);

  if (!success) {
    ctx.log?.error('Invalid arguments for logPluginMapRequest:', error);
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: { code: 'unexpected' },
    });
  }

  return logPollInternal(ctx, parsedArgs, 'request');
}

/**
 * Resolver to clear all logged plugin map requests.
 *
 * This function deletes all records from the polls table, effectively resetting
 * the plugin map request logs.
 *
 * @param _parent - The parent resolver (unused).
 * @param _args - The arguments (unused).
 * @param ctx - The GraphQL context.
 * @returns An object indicating success and the count of cleared records.
 * @throws {TalawaGraphQLError} If the user is unauthenticated.
 */
export async function clearPluginMapRequestsResolver(
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

  return clearPollsInternal(ctx, 'request');
}

/**
 * Resolver to log a new plugin map poll.
 *
 * This serves as an alias or alternate entry point for logging polls, particularly
 * for internal or test usage.
 *
 * @param _parent - The parent resolver (unused).
 * @param args - The arguments containing the poll input.
 * @param ctx - The GraphQL context.
 * @returns The newly created poll record.
 * @throws {TalawaGraphQLError} If the user is unauthenticated or arguments are invalid.
 */
export async function logPluginMapPollResolver(
  _parent: unknown,
  args: {
    input: {
      userId: string;
      userRole: string;
      organizationId?: string | null;
      extensionPoint: string;
    };
  },
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = pluginMapPollInputSchema.safeParse(args.input);

  if (!success) {
    ctx.log?.error('Invalid arguments for logPluginMapPoll:', error);
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: { code: 'unexpected' },
    });
  }

  return logPollInternal(ctx, parsedArgs, 'poll');
}

/**
 * Resolver to clear all logged plugin map polls.
 *
 * Distinct from `clearPluginMapRequestsResolver` only in name/schema exposure,
 * intended for clearing generic poll logs.
 *
 * @param _parent - The parent resolver (unused).
 * @param _args - The arguments (unused).
 * @param ctx - The GraphQL context.
 * @returns An object indicating success and the count of cleared records.
 * @throws {TalawaGraphQLError} If the user is unauthenticated.
 */
export async function clearPluginMapPollsResolver(
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

  return clearPollsInternal(ctx, 'poll');
}

/**
 * Registers all Plugin Map mutations with the GraphQL builder.
 *
 * This function exposes the following mutations:
 * - `logPluginMapRequest`: Logs user/admin interaction.
 * - `clearPluginMapRequests`: Clears interaction logs.
 * - `logPluginMapPoll`: Logs generic polls.
 * - `clearPluginMapPolls`: Clears generic poll logs.
 *
 * @param builderInstance - The Pothos schema builder instance.
 */
export function registerPluginMapMutations(
  builderInstance: typeof builder,
): void {
  // Log plugin map request
  builderInstance.mutationField('logPluginMapRequest', (t) =>
    t.field({
      type: PluginMapPollRef,
      args: {
        input: t.arg({
          type: builder.inputType('PluginMapRequestInput', {
            fields: (t) => ({
              userId: t.string({ required: true }),
              userRole: t.string({ required: true }),
              organizationId: t.string({ required: false }),
              extensionPoint: t.string({ required: true }),
            }),
          }),
          required: true,
        }),
      },
      description: 'Log a new request from admin or user context',
      resolve: logPluginMapRequestResolver,
    }),
  );

  // Clear plugin map requests
  builderInstance.mutationField('clearPluginMapRequests', (t) =>
    t.field({
      type: ClearPollsResultRef,
      description: 'Clear all logged requests',
      resolve: clearPluginMapRequestsResolver,
    }),
  );

  // Log plugin map poll
  builderInstance.mutationField('logPluginMapPoll', (t) =>
    t.field({
      type: PluginMapPollRef,
      args: {
        input: t.arg({
          type: builder.inputType('PluginMapPollInput', {
            fields: (t) => ({
              userId: t.string({ required: true }),
              userRole: t.string({ required: true }),
              organizationId: t.string({ required: false }),
              extensionPoint: t.string({ required: true }),
            }),
          }),
          required: true,
        }),
      },
      description: 'Log a new plugin map poll',
      resolve: logPluginMapPollResolver,
    }),
  );

  // Clear plugin map polls
  builderInstance.mutationField('clearPluginMapPolls', (t) =>
    t.field({
      type: ClearPollsResultRef,
      description: 'Clear all logged plugin map polls',
      resolve: clearPluginMapPollsResolver,
    }),
  );
}
