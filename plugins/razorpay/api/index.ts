import type { IPluginContext, IPluginLifecycle } from '../../types';

import { eq, type InferSelectModel } from 'drizzle-orm';
import crypto from 'node:crypto';
import { configTable, ordersTable, transactionsTable } from './database/tables';

/**
 * DrizzleDB interface for type-safe database operations
 *
 * This custom interface represents the subset of Drizzle ORM methods used by this plugin.
 * We intentionally avoid importing `PostgresJsDatabase` from `drizzle-orm/postgres-js` because:
 * 1. The plugin requires a Postgres-compatible Drizzle DB (uses pgTable).
 *    See ./database/tables.ts for table definitions.
 * 2. The host application provides the database instance with its own configuration
 * 3. This minimal interface covers all operations needed by the plugin
 *
 * If you need database-specific features like `.returning()` or `.execute()`,
 * extend this interface or cast to the appropriate Drizzle database type.
 */
interface DrizzleDB {
  select(): {
    from(table: unknown): {
      where(condition: unknown): { limit(n: number): Promise<unknown[]> };
      limit(n: number): Promise<unknown[]>;
    };
  };
  insert(table: unknown): {
    values(data: unknown): Promise<unknown>;
  };
  update(table: unknown): {
    set(data: unknown): {
      where(condition: unknown): Promise<unknown>;
    };
  };
  delete(table: unknown): {
    where(condition: unknown): Promise<unknown>;
  };
}

/**
 * PubSub interface for event publishing
 */
interface PubSub {
  publish(channel: string, message: unknown): void;
}

/**
 * Payment event data structure
 */
interface PaymentEventData {
  paymentId: string;
  organizationId: string;
  amount: number;
  currency?: string;
  updatedAt: string;
}

/**
 * Type definitions for Drizzle query results
 */
export type ConfigRow = InferSelectModel<typeof configTable>;
export type OrderRow = InferSelectModel<typeof ordersTable>;
export type TransactionRow = InferSelectModel<typeof transactionsTable>;

/**
 * Razorpay payment entity from webhook
 */
interface RazorpayPaymentEntity {
  id: string;
  order_id: string;
  status: string;
  method: string;
  amount: number;
  currency: string;
  email: string;
  contact: string;
  bank?: string;
  wallet?: string;
  vpa?: string;
  fee?: number;
  tax?: number;
  error_code?: string;
  error_description?: string;
  refund_status?: string;
  captured: boolean;
  created_at: number;
}

/**
 * Razorpay webhook payload structure
 */
interface RazorpayWebhookPayload {
  payload?: {
    payment?: {
      entity: RazorpayPaymentEntity;
    };
  };
}

/**
 * Plugin request with context
 */
export interface PluginRequest {
  body: RazorpayWebhookPayload;
  headers: Record<string, string | string[] | undefined>;
  organizationId?: string;
  pluginContext?: {
    db: DrizzleDB;
    logger: {
      info(message: string, data?: unknown): void;
      warn(message: string, data?: unknown): void;
      error(message: string, data?: unknown): void;
    };
  };
}

/**
 * Plugin reply interface
 */
export interface PluginReply {
  status(code: number): {
    send(data: unknown): void;
  };
}

// Export database tables and GraphQL resolvers
export * from './database/tables';
export * from './graphql/queries';
export * from './graphql/mutations';

// Export services
export * from './services/razorpayService';

// Lifecycle hooks
export async function onLoad(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Razorpay Plugin loaded successfully');
  }

  // Initialize plugin tables if they don't exist
  try {
    const { configTable, transactionsTable, ordersTable } =
      await import('./database/tables');

    // Check if tables exist by trying to query them
    if (
      context.db &&
      typeof context.db === 'object' &&
      'select' in context.db
    ) {
      const db = context.db as DrizzleDB;
      await db.select().from(configTable).limit(1);
      await db.select().from(transactionsTable).limit(1);
      await db.select().from(ordersTable).limit(1);
    }

    if (context.logger?.info) {
      context.logger.info('Razorpay plugin tables verified');
    }
  } catch (error) {
    if (context.logger?.warn) {
      context.logger.warn('Failed to verify Razorpay plugin tables:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
}

export async function onActivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Razorpay Plugin activated');
  }

  // Initialize Razorpay configuration
  try {
    // Set up default configuration if not exists
    const { configTable } = await import('./database/tables');

    if (
      context.db &&
      typeof context.db === 'object' &&
      'select' in context.db
    ) {
      const db = context.db as DrizzleDB;
      const existingConfig = await db.select().from(configTable).limit(1);

      if (existingConfig.length === 0) {
        // Create default configuration
        await db.insert(configTable).values({
          keyId: '',
          keySecret: '',
          webhookSecret: '',
          isEnabled: false,
          testMode: true,
          currency: 'INR',
          description: 'Donation to organization',
        });

        if (context.logger?.info) {
          context.logger.info('Default Razorpay configuration created');
        }
      }
    }

    if (context.logger?.info) {
      context.logger.info('Razorpay configuration initialized');
    }
  } catch (error) {
    if (context.logger?.error) {
      context.logger.error('Failed to initialize Razorpay configuration:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }

  // Register GraphQL schema extensions
  if (context.graphql) {
    try {
      if (context.logger?.info) {
        context.logger.info(
          'GraphQL schema extensions registered for Razorpay Plugin',
        );
      }
    } catch (error) {
      if (context.logger?.error) {
        context.logger.error('Failed to register GraphQL extensions:', {
          error: error instanceof Error ? error.message : String(error),
        });
      }
    }
  }
}

export async function onDeactivate(context: IPluginContext): Promise<void> {
  if (context.logger?.info) {
    context.logger.info('Razorpay Plugin deactivated');
  }

  // Cleanup plugin-specific resources
  try {
    // Clean up any active payment sessions
    if (context.logger?.info) {
      context.logger.info('Razorpay plugin cleanup completed');
    }
  } catch (error) {
    if (context.logger?.warn) {
      context.logger.warn(
        'Failed to handle plugin deactivation for Razorpay:',
        { error: error instanceof Error ? error.message : String(error) },
      );
    }
  }
}

export async function onUnload(context: IPluginContext): Promise<void> {
  try {
    if (context.logger?.info) {
      context.logger.info('Razorpay Plugin unloaded');
    }
  } catch (error) {
    if (context.logger?.error) {
      context.logger.error('Error during Razorpay plugin unload:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
}

// Event handlers
export async function onPaymentCreated(
  data: PaymentEventData,
  context: IPluginContext,
): Promise<void> {
  try {
    if (context.logger?.info) {
      context.logger.info(`Payment created: ${data.paymentId}`);
    }

    // Notify via pubsub if available
    if (context.pubsub) {
      (context.pubsub as PubSub).publish('payment:notification', {
        type: 'payment_created',
        paymentId: data.paymentId,
        organizationId: data.organizationId,
        amount: data.amount,
        message: `New payment of ${data.amount} created`,
        timestamp: new Date().toISOString(),
      });
    }
  } catch (error) {
    if (context.logger?.error) {
      context.logger.error('Error in onPaymentCreated:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
}

export async function onPaymentCompleted(
  data: PaymentEventData,
  context: IPluginContext,
): Promise<void> {
  try {
    if (context.logger?.info) {
      context.logger.info(`Payment completed: ${data.paymentId}`);
    }

    // Update transaction status
    const { transactionsTable } = await import('./database/tables');

    if (
      context.db &&
      typeof context.db === 'object' &&
      'update' in context.db
    ) {
      const db = context.db as DrizzleDB;
      await db
        .update(transactionsTable)
        .set({
          status: 'captured',
          updatedAt: new Date(),
        })
        .where(eq(transactionsTable.paymentId, data.paymentId));
    }

    // Notify via pubsub if available
    if (context.pubsub) {
      (context.pubsub as PubSub).publish('payment:notification', {
        type: 'payment_completed',
        paymentId: data.paymentId,
        organizationId: data.organizationId,
        amount: data.amount,
        message: `Payment of ${data.amount} completed successfully`,
        timestamp: new Date().toISOString(),
      });
    }
  } catch (error) {
    if (context.logger?.error) {
      context.logger.error('Error in onPaymentCompleted:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
}

export async function onPaymentFailed(
  data: PaymentEventData,
  context: IPluginContext,
): Promise<void> {
  try {
    if (context.logger?.info) {
      context.logger.info(`Payment failed: ${data.paymentId}`);
    }

    // Update transaction status
    const { transactionsTable } = await import('./database/tables');

    if (
      context.db &&
      typeof context.db === 'object' &&
      'update' in context.db
    ) {
      const db = context.db as DrizzleDB;
      await db
        .update(transactionsTable)
        .set({
          status: 'failed',
          updatedAt: new Date(),
        })
        .where(eq(transactionsTable.paymentId, data.paymentId));
    }

    // Notify via pubsub if available
    if (context.pubsub) {
      (context.pubsub as PubSub).publish('payment:notification', {
        type: 'payment_failed',
        paymentId: data.paymentId,
        organizationId: data.organizationId,
        amount: data.amount,
        message: `Payment of ${data.amount} failed`,
        timestamp: new Date().toISOString(),
      });
    }
  } catch (error) {
    if (context.logger?.error) {
      context.logger.error('Error in onPaymentFailed:', {
        error: error instanceof Error ? error.message : String(error),
      });
    }
  }
}

// Utility functions for the plugin
// _context kept for API compatibility - may be used in future for logging/config
export async function getPluginInfo(_context: IPluginContext) {
  return {
    name: 'Razorpay Payment Gateway',
    version: '1.0.0',
    description:
      'A payment gateway plugin that integrates Razorpay for donations and payments within organizations.',
    features: [
      'Razorpay payment gateway integration',
      'Payment order creation and management',
      'Transaction tracking and history',
      'Webhook handling for payment updates',
      'Organization-specific transaction summaries',
      'User transaction history across organizations',
      'Payment verification and security',
      'Test and production mode support',
    ],
    tables: ['razorpay_config', 'razorpay_transactions', 'razorpay_orders'],
    graphqlOperations: [
      'getRazorpayConfig',
      'updateRazorpayConfig',
      'testRazorpayConnection',
      'getOrganizationTransactions',
      'getUserTransactions',
      'getOrganizationTransactionStats',
      'getUserTransactionStats',
      'createPaymentOrder',
      'initiatePayment',
      'verifyPayment',
    ],
    events: ['payment:created', 'payment:completed', 'payment:failed'],
    webhooks: [
      'POST /api/plugins/razorpay/webhook/ - Razorpay webhook endpoint',
    ],
  };
}

// Webhook handler for Razorpay - Standard implementation per Razorpay docs
export async function handleRazorpayWebhook(
  request: PluginRequest,
  reply: PluginReply,
): Promise<void> {
  try {
    const webhookData = request.body;

    // Basic webhook data validation
    if (!webhookData || !webhookData.payload || !webhookData.payload.payment) {
      return reply.status(400).send({
        error: 'Invalid webhook data',
        message: 'Missing required webhook payload structure',
      });
    }

    const { payment } = webhookData.payload;
    const paymentEntity = payment.entity;

    // Get plugin context from request first for logging
    const pluginContext = request.pluginContext;

    // Log the webhook for debugging
    if (pluginContext?.logger) {
      pluginContext.logger.info('Razorpay webhook received', {
        paymentId: paymentEntity.id,
        status: paymentEntity.status,
      });
    }

    // Format currency display
    const currencySymbols: { [key: string]: string } = {
      INR: '₹',
      USD: '$',
      EUR: '€',
      GBP: '£',
    };
    const symbol =
      currencySymbols[paymentEntity.currency] || paymentEntity.currency;
    const displayAmount = (paymentEntity.amount / 100).toFixed(2);

    if (pluginContext?.logger) {
      pluginContext.logger.info('Payment Details', {
        id: paymentEntity.id,
        status: paymentEntity.status,
        amount: `${symbol}${displayAmount} ${paymentEntity.currency}`,
        method: paymentEntity.method,
        orderId: paymentEntity.order_id,
        email: paymentEntity.email,
        captured: paymentEntity.captured,
      });
    }

    // Verify plugin context is available
    if (!pluginContext) {
      // Use stderr for critical errors when context unavailable
      process.stderr.write('Plugin context not available in webhook\n');
      return reply.status(500).send({
        error: 'Plugin context not available',
        message: 'Cannot process webhook without plugin context',
      });
    }

    // Verify webhook signature manually
    const signature = request.headers['x-razorpay-signature'] as string;

    if (!signature) {
      pluginContext.logger.warn('Missing Razorpay signature header');
      return reply.status(400).send({
        error: 'Missing signature',
        message: 'Missing x-razorpay-signature header',
      });
    }

    const webhookBody = JSON.stringify(webhookData);

    // Get webhook secret from config
    const { configTable } = await import('./database/tables');

    const orgId = request.organizationId; // Assuming organizationId is available on the request
    if (!orgId) {
      pluginContext.logger.error(
        'Organization ID not found in request for webhook',
      );
      return reply.status(400).send({
        error: 'Organization ID missing',
        message: 'Cannot process webhook without organization context',
      });
    }

    // Use db.select() to fetch config, keeping consistency with existing pattern
    // Cast to ConfigRow[] to ensure type safety
    const config = (await pluginContext.db
      .select()
      .from(configTable)
      .where(eq(configTable.organizationId, orgId))
      .limit(1)) as ConfigRow[];

    // Ensure config exists and check webhookSecret
    if (config.length === 0 || !config[0]?.webhookSecret) {
      if (pluginContext.logger) {
        pluginContext.logger.error('Webhook secret not configured');
      } else {
        process.stderr.write(
          'Razorpay Webhook Error: Webhook secret not configured\n',
        );
      }
      return reply.status(404).send({
        error: 'Configuration not found',
        message: 'Razorpay configuration not found for this organization',
      });
    }

    // Verify signature
    // Use typed config[0].webhookSecret
    const expectedSignature = crypto
      .createHmac('sha256', config[0].webhookSecret)
      .update(webhookBody)
      .digest('hex');

    // Validate that both signatures are valid hex strings of even length
    const isValidHex = (str: string) =>
      /^[0-9a-fA-F]+$/.test(str) && str.length % 2 === 0;

    if (!isValidHex(signature) || !isValidHex(expectedSignature)) {
      if (pluginContext.logger) {
        pluginContext.logger.error(
          'Invalid signature format: not a valid hex string',
        );
      } else {
        process.stderr.write(
          'Razorpay Webhook Error: Invalid signature format - not a valid hex string\n',
        );
      }
      return reply.status(400).send({
        error: 'Invalid signature',
        message: 'Webhook signature verification failed',
      });
    }

    const expectedBuffer = Buffer.from(expectedSignature, 'hex');
    const signatureBuffer = Buffer.from(signature, 'hex');

    const isValidSignature =
      expectedBuffer.length === signatureBuffer.length &&
      crypto.timingSafeEqual(expectedBuffer, signatureBuffer);

    if (!isValidSignature) {
      if (pluginContext.logger) {
        pluginContext.logger.error('Webhook signature validation failed');
      } else {
        process.stderr.write(
          'Razorpay Webhook Error: Webhook signature validation failed\n',
        );
      }
      return reply.status(400).send({
        error: 'Invalid signature',
        message: 'Webhook signature verification failed',
      });
    }

    // Process webhook directly with database access
    const { ordersTable, transactionsTable } =
      await import('./database/tables');

    // Get order details to get userId and other info
    const orderDetails = await pluginContext.db
      .select()
      .from(ordersTable)
      .where(eq(ordersTable.razorpayOrderId, paymentEntity.order_id))
      .limit(1);

    if (orderDetails.length === 0) {
      if (pluginContext.logger) {
        pluginContext.logger.error(
          `Order not found for payment: ${paymentEntity.id}`,
        );
      } else {
        process.stderr.write(
          `Razorpay Webhook Error: Order not found for payment: ${paymentEntity.id}\n`,
        );
      }
      return reply.status(400).send({
        error: 'Order not found',
        message: `Order not found for payment: ${paymentEntity.id}`,
      });
    }

    const order = orderDetails[0] as OrderRow;

    // Check if transaction already exists
    const existingTransaction = await pluginContext.db
      .select()
      .from(transactionsTable)
      .where(eq(transactionsTable.paymentId, paymentEntity.id))
      .limit(1);

    if (existingTransaction.length === 0) {
      // Create new transaction with userId from order
      await pluginContext.db.insert(transactionsTable).values({
        paymentId: paymentEntity.id,
        orderId: order.id,
        organizationId: order.organizationId,
        userId: order.userId, // Use userId from order
        amount: order.amount,
        currency: order.currency,
        status: paymentEntity.status,
        method: paymentEntity.method,
        bank: paymentEntity.bank || undefined,
        wallet: paymentEntity.wallet || undefined,
        vpa: paymentEntity.vpa || undefined,
        email: paymentEntity.email,
        contact: paymentEntity.contact,
        fee: paymentEntity.fee,
        tax: paymentEntity.tax,
        errorCode: paymentEntity.error_code || undefined,
        errorDescription: paymentEntity.error_description || undefined,
        refundStatus: paymentEntity.refund_status || undefined,
        capturedAt: paymentEntity.captured
          ? new Date(paymentEntity.created_at * 1000)
          : undefined,
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    } else {
      // Update existing transaction
      await pluginContext.db
        .update(transactionsTable)
        .set({
          status: paymentEntity.status,
          method: paymentEntity.method,
          bank: paymentEntity.bank || undefined,
          wallet: paymentEntity.wallet || undefined,
          vpa: paymentEntity.vpa || undefined,
          email: paymentEntity.email,
          contact: paymentEntity.contact,
          fee: paymentEntity.fee,
          tax: paymentEntity.tax,
          errorCode: paymentEntity.error_code || undefined,
          errorDescription: paymentEntity.error_description || undefined,
          refundStatus: paymentEntity.refund_status || undefined,
          capturedAt: paymentEntity.captured
            ? new Date(paymentEntity.created_at * 1000)
            : undefined,
          updatedAt: new Date(),
        })
        .where(eq(transactionsTable.paymentId, paymentEntity.id));
    }

    // Update order status if payment is captured
    if (paymentEntity.captured) {
      await pluginContext.db
        .update(ordersTable)
        .set({
          status: 'paid',
          updatedAt: new Date(),
        })
        .where(eq(ordersTable.razorpayOrderId, paymentEntity.order_id));
    }

    // Return success response as per Razorpay docs
    reply.status(200).send({
      status: 'success',
      message: 'Webhook processed successfully',
    });
  } catch (error) {
    // Use process.stderr since pluginContext may not be available in catch
    process.stderr.write(
      `Razorpay webhook error: ${error instanceof Error ? error.message : 'Unknown error'}\n`,
    );
    reply.status(500).send({
      error: 'Webhook processing failed',
      message: error instanceof Error ? error.message : 'Unknown error',
    });
  }
}

// Export the plugin lifecycle interface
const RazorpayPlugin: IPluginLifecycle = {
  onLoad,
  onActivate,
  onDeactivate,
  onUnload,
};

export default RazorpayPlugin;
