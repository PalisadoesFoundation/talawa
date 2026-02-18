import { desc, eq, sql, and, gte, lte } from 'drizzle-orm';
import { z } from 'zod';
import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';
import {
  configTable,
  transactionsTable,
  ordersTable,
} from '../database/tables';
import {
  RazorpayConfigRef,
  RazorpayTransactionRef,
  RazorpayTransactionStatsRef,
} from './types';

/**
 * Resolver for fetching Razorpay configuration.
 * Requires authentication and superadmin privileges.
 */
export async function getRazorpayConfigResolver(
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

  // Check for superadmin access (strict)
  if (!ctx.user || !ctx.user.isSuperAdmin) {
    throw new TalawaGraphQLError({
      message: 'Forbidden',
      extensions: { code: 'forbidden' },
    });
  }

  try {
    const config = await ctx.drizzleClient.select().from(configTable).limit(1);

    if (config.length === 0) {
      return {
        keyId: '',
        keySecret: '',
        webhookSecret: '',
        isEnabled: false,
        testMode: true,
        currency: 'INR',
        description: 'Donation to organization',
      };
    }

    const configItem = config[0];
    if (!configItem) {
      return {
        keyId: '',
        keySecret: '',
        webhookSecret: '',
        isEnabled: false,
        testMode: true,
        currency: 'INR',
        description: 'Donation to organization',
      };
    }

    return {
      keyId: configItem.keyId || undefined,
      keySecret: configItem.keySecret || undefined,
      webhookSecret: configItem.webhookSecret || undefined,
      isEnabled: configItem.isEnabled || false,
      testMode: configItem.testMode || true,
      currency: configItem.currency || 'INR',
      description: configItem.description || 'Donation to organization',
    };
  } catch (error) {
    ctx.log?.error('Error getting Razorpay config:', error);
    throw new TalawaGraphQLError({
      message: 'Unexpected error',
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver for fetching transactions for an organization.
 * Supports pagination and filtering.
 */
const getOrganizationTransactionsArgumentsSchema = z.object({
  orgId: z.string(),
  limit: z.number().nullable().optional(),
  offset: z.number().nullable().optional(),
  status: z.string().nullable().optional(),
  dateFrom: z.string().nullable().optional(),
  dateTo: z.string().nullable().optional(),
});

export async function getOrganizationTransactionsResolver(
  _parent: unknown,
  args: z.infer<typeof getOrganizationTransactionsArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  if (!ctx.isAdmin) {
    throw new TalawaGraphQLError({
      message: 'Forbidden',
      extensions: { code: 'forbidden' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = getOrganizationTransactionsArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: {
        code: 'invalid_arguments',
        issues: error.issues.map((issue) => ({
          argumentPath: issue.path,
          message: issue.message,
        })),
      },
    });
  }

  try {
    const {
      orgId,
      limit = 20,
      offset = 0,
      status,
      dateFrom,
      dateTo,
    } = parsedArgs;

    const whereConditions = [eq(transactionsTable.organizationId, orgId)];

    if (status) {
      whereConditions.push(eq(transactionsTable.status, status));
    }

    if (dateFrom) {
      whereConditions.push(
        gte(transactionsTable.createdAt, new Date(dateFrom)),
      );
    }

    if (dateTo) {
      whereConditions.push(lte(transactionsTable.createdAt, new Date(dateTo)));
    }

    const transactions = await ctx.drizzleClient
      .select({
        id: transactionsTable.id,
        paymentId: transactionsTable.paymentId,
        amount: transactionsTable.amount,
        currency: transactionsTable.currency,
        status: transactionsTable.status,
        method: transactionsTable.method,
        bank: transactionsTable.bank,
        wallet: transactionsTable.wallet,
        vpa: transactionsTable.vpa,
        email: transactionsTable.email,
        contact: transactionsTable.contact,
        fee: transactionsTable.fee,
        tax: transactionsTable.tax,
        errorCode: transactionsTable.errorCode,
        errorDescription: transactionsTable.errorDescription,
        refundStatus: transactionsTable.refundStatus,
        capturedAt: transactionsTable.capturedAt,
        donorName: ordersTable.donorName,
        donorEmail: ordersTable.donorEmail,
        createdAt: transactionsTable.createdAt,
        updatedAt: transactionsTable.updatedAt,
      })
      .from(transactionsTable)
      .leftJoin(ordersTable, eq(transactionsTable.orderId, ordersTable.id))
      .where(and(...whereConditions))
      .orderBy(desc(transactionsTable.createdAt))
      .limit(limit || 20)
      .offset(offset || 0);

    return transactions.map((transaction) => ({
      id: transaction.id,
      paymentId: transaction.paymentId,
      amount: transaction.amount,
      currency: transaction.currency || 'INR',
      status: transaction.status || 'pending',
      donorName: transaction.donorName,
      donorEmail: transaction.donorEmail,
      method: transaction.method,
      bank: transaction.bank,
      wallet: transaction.wallet,
      vpa: transaction.vpa,
      email: transaction.email,
      contact: transaction.contact,
      fee: transaction.fee,
      tax: transaction.tax,
      errorCode: transaction.errorCode,
      errorDescription: transaction.errorDescription,
      refundStatus: transaction.refundStatus,
      capturedAt: transaction.capturedAt,
      createdAt: transaction.createdAt || new Date(),
      updatedAt: transaction.updatedAt || new Date(),
    }));
  } catch (error) {
    ctx.log?.error('Error getting organization transactions:', error);
    throw new TalawaGraphQLError({
      message: 'Unexpected error',
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver for fetching transactions for a specific user.
 * Supports pagination.
 */
const getUserTransactionsArgumentsSchema = z.object({
  userId: z.string(),
  orgId: z.string().nullable().optional(),
  limit: z.number().nullable().optional(),
  offset: z.number().nullable().optional(),
  status: z.string().nullable().optional(),
  dateFrom: z.string().nullable().optional(),
  dateTo: z.string().nullable().optional(),
});

export async function getUserTransactionsResolver(
  _parent: unknown,
  args: z.infer<typeof getUserTransactionsArgumentsSchema>,
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
  } = getUserTransactionsArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: {
        code: 'invalid_arguments',
        issues: error.issues.map((issue) => ({
          argumentPath: issue.path,
          message: issue.message,
        })),
      },
    });
  }

  try {
    const {
      userId,
      orgId,
      limit = 20,
      offset = 0,
      status,
      dateFrom,
      dateTo,
    } = parsedArgs;

    // Users can only view their own transactions unless they are admin
    if (userId !== ctx.userId && !ctx.isAdmin) {
      throw new TalawaGraphQLError({
        message: 'Forbidden',
        extensions: { code: 'forbidden' },
      });
    }

    const whereConditions = [eq(transactionsTable.userId, userId)];

    // Filter by organization if provided
    if (orgId) {
      whereConditions.push(eq(transactionsTable.organizationId, orgId));
    }

    if (status) {
      whereConditions.push(eq(transactionsTable.status, status));
    }

    if (dateFrom) {
      whereConditions.push(
        gte(transactionsTable.createdAt, new Date(dateFrom)),
      );
    }

    if (dateTo) {
      whereConditions.push(lte(transactionsTable.createdAt, new Date(dateTo)));
    }

    const transactions = await ctx.drizzleClient
      .select({
        id: transactionsTable.id,
        paymentId: transactionsTable.paymentId,
        amount: transactionsTable.amount,
        currency: transactionsTable.currency,
        status: transactionsTable.status,
        method: transactionsTable.method,
        bank: transactionsTable.bank,
        wallet: transactionsTable.wallet,
        vpa: transactionsTable.vpa,
        email: transactionsTable.email,
        contact: transactionsTable.contact,
        fee: transactionsTable.fee,
        tax: transactionsTable.tax,
        errorCode: transactionsTable.errorCode,
        errorDescription: transactionsTable.errorDescription,
        refundStatus: transactionsTable.refundStatus,
        capturedAt: transactionsTable.capturedAt,
        donorName: ordersTable.donorName,
        donorEmail: ordersTable.donorEmail,
        createdAt: transactionsTable.createdAt,
        updatedAt: transactionsTable.updatedAt,
      })
      .from(transactionsTable)
      .leftJoin(ordersTable, eq(transactionsTable.orderId, ordersTable.id))
      .where(and(...whereConditions))
      .orderBy(desc(transactionsTable.createdAt))
      .limit(limit || 20)
      .offset(offset || 0);

    return transactions.map((transaction) => ({
      id: transaction.id,
      paymentId: transaction.paymentId,
      amount: transaction.amount,
      currency: transaction.currency || 'INR',
      status: transaction.status || 'pending',
      donorName: transaction.donorName,
      donorEmail: transaction.donorEmail,
      method: transaction.method,
      bank: transaction.bank,
      wallet: transaction.wallet,
      vpa: transaction.vpa,
      email: transaction.email,
      contact: transaction.contact,
      fee: transaction.fee,
      tax: transaction.tax,
      errorCode: transaction.errorCode,
      errorDescription: transaction.errorDescription,
      refundStatus: transaction.refundStatus,
      capturedAt: transaction.capturedAt,
      createdAt: transaction.createdAt || new Date(),
      updatedAt: transaction.updatedAt || new Date(),
    }));
  } catch (error) {
    ctx.log?.error('Error getting user transactions:', error);
    throw new TalawaGraphQLError({
      message: 'Unexpected error',
      extensions: { code: 'unexpected' },
    });
  }
}

/**
 * Resolver for fetching transaction statistics for an organization.
 * Returns aggregation of transactions by date.
 */
const getOrganizationTransactionStatsArgumentsSchema = z.object({
  orgId: z.string(),
  dateFrom: z.string().nullable().optional(),
  dateTo: z.string().nullable().optional(),
});

export async function getOrganizationTransactionStatsResolver(
  _parent: unknown,
  args: z.infer<typeof getOrganizationTransactionStatsArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      message: 'Unauthenticated',
      extensions: { code: 'unauthenticated' },
    });
  }

  if (!ctx.isAdmin) {
    throw new TalawaGraphQLError({
      message: 'Forbidden',
      extensions: { code: 'forbidden' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = getOrganizationTransactionStatsArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
      message: 'Invalid arguments',
      extensions: {
        code: 'invalid_arguments',
        issues: error.issues.map((issue) => ({
          argumentPath: issue.path,
          message: issue.message,
        })),
      },
    });
  }

  try {
    const { orgId, dateFrom, dateTo } = parsedArgs;

    const whereConditions = [eq(transactionsTable.organizationId, orgId)];

    if (dateFrom) {
      whereConditions.push(
        gte(transactionsTable.createdAt, new Date(dateFrom)),
      );
    }

    if (dateTo) {
      whereConditions.push(lte(transactionsTable.createdAt, new Date(dateTo)));
    }

    const stats = await ctx.drizzleClient
      .select({
        totalTransactions: sql<number>`count(*)`,
        totalAmount: sql<number>`sum(${transactionsTable.amount})`,
        currency: transactionsTable.currency,
        successCount: sql<number>`count(case when ${transactionsTable.status} = 'captured' then 1 end)`,
        failedCount: sql<number>`count(case when ${transactionsTable.status} = 'failed' then 1 end)`,
        pendingCount: sql<number>`count(case when ${transactionsTable.status} = 'pending' then 1 end)`,
      })
      .from(transactionsTable)
      .where(and(...whereConditions))
      .groupBy(transactionsTable.currency);

    if (stats.length === 0) {
      return {
        totalTransactions: 0,
        totalAmount: 0,
        currency: 'INR',
        successfulTransactions: 0,
        failedTransactions: 0,
        averageTransactionAmount: 0,
      };
    }

    return {
      totalTransactions: stats[0]?.totalTransactions || 0,
      totalAmount: stats[0]?.totalAmount || 0,
      currency: stats[0]?.currency || 'INR',
      successfulTransactions: stats[0]?.successCount || 0,
      failedTransactions: stats[0]?.failedCount || 0,
      averageTransactionAmount:
        (stats[0]?.totalTransactions || 0) > 0
          ? Math.round(
              (stats[0]?.totalAmount || 0) / (stats[0]?.totalTransactions || 1),
            )
          : 0,
    };
  } catch (error) {
    ctx.log?.error('Error getting organization transaction stats:', error);
    throw new TalawaGraphQLError({
      extensions: { code: 'unexpected' },
    });
  }
}

// Get user transaction stats resolver
const getUserTransactionStatsArgumentsSchema = z.object({
  userId: z.string(),
  dateFrom: z.string().nullable().optional(),
  dateTo: z.string().nullable().optional(),
});

/**
 * Resolver for fetching transaction statistics for a specific user.
 * Returns aggregation of user transactions.
 */
export async function getUserTransactionStatsResolver(
  _parent: unknown,
  args: z.infer<typeof getUserTransactionStatsArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  const parsedArgs = getUserTransactionStatsArgumentsSchema.safeParse(args);

  if (!parsedArgs.success) {
    throw new TalawaGraphQLError({
      extensions: {
        code: 'invalid_arguments',
        issues: parsedArgs.error.issues.map((issue) => ({
          argumentPath: issue.path,
          message: issue.message,
        })),
      },
    });
  }

  // Users can only view their own stats unless they are admin
  // Check this before the try block so forbidden errors are thrown directly
  if (parsedArgs.data.userId !== ctx.userId && !ctx.isAdmin) {
    throw new TalawaGraphQLError({
      extensions: { code: 'forbidden' },
    });
  }

  try {
    const { userId, dateFrom, dateTo } = parsedArgs.data;

    const whereConditions = [eq(transactionsTable.userId, userId)];

    if (dateFrom) {
      whereConditions.push(
        gte(transactionsTable.createdAt, new Date(dateFrom)),
      );
    }

    if (dateTo) {
      whereConditions.push(lte(transactionsTable.createdAt, new Date(dateTo)));
    }

    const stats = await ctx.drizzleClient
      .select({
        totalTransactions: sql<number>`count(*)`,
        totalAmount: sql<number>`sum(${transactionsTable.amount})`,
        currency: transactionsTable.currency,
        successCount: sql<number>`count(case when ${transactionsTable.status} = 'captured' then 1 end)`,
        failedCount: sql<number>`count(case when ${transactionsTable.status} = 'failed' then 1 end)`,
        pendingCount: sql<number>`count(case when ${transactionsTable.status} = 'pending' then 1 end)`,
      })
      .from(transactionsTable)
      .where(and(...whereConditions))
      .groupBy(transactionsTable.currency);

    if (stats.length === 0) {
      return {
        totalTransactions: 0,
        totalAmount: 0,
        currency: 'INR',
        successfulTransactions: 0,
        failedTransactions: 0,
        averageTransactionAmount: 0,
      };
    }

    return {
      totalTransactions: stats[0]?.totalTransactions || 0,
      totalAmount: stats[0]?.totalAmount || 0,
      currency: stats[0]?.currency || 'INR',
      successCount: stats[0]?.successCount || 0,
      failedCount: stats[0]?.failedCount || 0,
      pendingCount: stats[0]?.pendingCount || 0,
    };
  } catch (error) {
    ctx.log?.error('Error getting user transaction stats:', error);
    throw new TalawaGraphQLError({
      extensions: { code: 'unexpected' },
    });
  }
}

// Register all Razorpay queries with the builder
export function registerRazorpayQueries(builderInstance: typeof builder): void {
  // Get Razorpay configuration
  builderInstance.queryField('getRazorpayConfig', (t) =>
    t.field({
      type: RazorpayConfigRef,
      description: 'Get Razorpay configuration settings',
      resolve: getRazorpayConfigResolver,
    }),
  );

  // Get organization transactions
  builderInstance.queryField('getOrganizationTransactions', (t) =>
    t.field({
      type: t.listRef(RazorpayTransactionRef),
      args: {
        orgId: t.arg.string({ required: true }),
        limit: t.arg.int({ required: false }),
        offset: t.arg.int({ required: false }),
        status: t.arg.string({ required: false }),
        dateFrom: t.arg.string({ required: false }),
        dateTo: t.arg.string({ required: false }),
      },
      description: 'Get transaction summary for an organization',
      resolve: getOrganizationTransactionsResolver,
    }),
  );

  // Get user transactions
  builderInstance.queryField('getUserTransactions', (t) =>
    t.field({
      type: t.listRef(RazorpayTransactionRef),
      args: {
        userId: t.arg.string({ required: true }),
        orgId: t.arg.string({ required: false }),
        limit: t.arg.int({ required: false }),
        offset: t.arg.int({ required: false }),
        status: t.arg.string({ required: false }),
        dateFrom: t.arg.string({ required: false }),
        dateTo: t.arg.string({ required: false }),
      },
      description: 'Get transaction summary for a user',
      resolve: getUserTransactionsResolver,
    }),
  );

  // Get organization transaction stats
  builderInstance.queryField('getOrganizationTransactionStats', (t) =>
    t.field({
      type: RazorpayTransactionStatsRef,
      args: {
        orgId: t.arg.string({ required: true }),
        dateFrom: t.arg.string({ required: false }),
        dateTo: t.arg.string({ required: false }),
      },
      description: 'Get transaction statistics for an organization',
      resolve: getOrganizationTransactionStatsResolver,
    }),
  );

  // Get user transaction stats
  builderInstance.queryField('getUserTransactionStats', (t) =>
    t.field({
      type: RazorpayTransactionStatsRef,
      args: {
        userId: t.arg.string({ required: true }),
        dateFrom: t.arg.string({ required: false }),
        dateTo: t.arg.string({ required: false }),
      },
      description: 'Get transaction statistics for a user',
      resolve: getUserTransactionStatsResolver,
    }),
  );
}
