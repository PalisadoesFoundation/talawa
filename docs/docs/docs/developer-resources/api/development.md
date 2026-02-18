---
id: api-development
title: Development
slug: /developer-resources/api/development
sidebar_position: 3
---


# API Plugin Development Guide

Step-by-step guide to building Talawa API plugins.


## Development & Testing Workflow

1. **Develop your plugin in the `available` folder** (e.g., `talawa-api/src/plugin/available/razorpay_gateway/`).
2. **Use GraphiQL** to create a plugin entry in the database. For example:

   ```graphql
   mutation CreatePlugin {
     createPlugin(input: {
       pluginId: "razorpay"
     }) {
       id
       pluginId
       isActivated
       isInstalled
       backup
     }
   }
   ```
3. **Activate and test your plugin** using the Plugin Store or management UI.
4. **Access and test plugin features** via registered GraphQL queries, mutations, and webhooks.
5. **Once development is complete**, push your plugin to the repository for packaging and distribution.

## Manifest Configuration

### Complete manifest.json

```json
{
  "name": "Razorpay Payment Gateway",
  "pluginId": "razorpay",
  "version": "1.0.0",
  "description": "A payment gateway plugin that integrates Razorpay for donations and payments within organizations. Provides payment processing, transaction management, and webhook handling.",
  "author": "Palisadoes Foundation",
  "main": "index.ts",
  "extensionPoints": {
    "graphql": [
      {
        "type": "query",
        "name": "razorpayQueries",
        "file": "graphql/queries.ts",
        "builderDefinition": "registerRazorpayQueries",
        "description": "Register all Razorpay query fields"
      },
      {
        "type": "mutation",
        "name": "razorpayMutations",
        "file": "graphql/mutations.ts",
        "builderDefinition": "registerRazorpayMutations",
        "description": "Register all Razorpay mutation fields"
      }
    ],
    "database": [
      {
        "type": "table",
        "name": "configTable",
        "file": "database/tables.ts",
        "description": "Razorpay configuration settings"
      },
      {
        "type": "table",
        "name": "transactionsTable",
        "file": "database/tables.ts",
        "description": "Payment transactions"
      },
      {
        "type": "table",
        "name": "ordersTable",
        "file": "database/tables.ts",
        "description": "Payment orders"
      }
    ]
  }
}
```

## Database Schema Design

### schema.ts

```typescript
import { pgTable, serial, text, timestamp, decimal, integer, boolean, pgEnum } from 'drizzle-orm/pg-core';
import { relations } from 'drizzle-orm';

// Enums
export const paymentStatusEnum = pgEnum('plugin_payment_gateway_status', [
  'pending',
  'processing',
  'completed',
  'failed',
  'refunded',
  'canceled'
]);

export const paymentProviderEnum = pgEnum('plugin_payment_gateway_provider', [
  'stripe',
  'paypal',
  'manual'
]);

// Tables
export const payments = pgTable('plugin_payment_gateway_payments', {
  id: serial('id').primaryKey(),
  userId: text('user_id').notNull(),
  organizationId: text('organization_id'),
  amount: decimal('amount', { precision: 10, scale: 2 }).notNull(),
  currency: text('currency').notNull().default('USD'),
  status: paymentStatusEnum('status').notNull().default('pending'),
  provider: paymentProviderEnum('provider').notNull(),
  providerPaymentId: text('provider_payment_id').unique(),
  donationId: integer('donation_id'),
  eventId: integer('event_id'),
  description: text('description'),
  metadata: text('metadata'), // JSON
  errorMessage: text('error_message'),
  refundedAmount: decimal('refunded_amount', { precision: 10, scale: 2 }),
  processingFee: decimal('processing_fee', { precision: 10, scale: 2 }),
  netAmount: decimal('net_amount', { precision: 10, scale: 2 }),
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
  completedAt: timestamp('completed_at'),
});

export const paymentMethods = pgTable('plugin_payment_gateway_payment_methods', {
  id: serial('id').primaryKey(),
  userId: text('user_id').notNull(),
  provider: paymentProviderEnum('provider').notNull(),
  providerMethodId: text('provider_method_id').notNull(),
  type: text('type').notNull(), // card, bank_account
  last4: text('last4'),
  brand: text('brand'),
  expiryMonth: integer('expiry_month'),
  expiryYear: integer('expiry_year'),
  isDefault: boolean('is_default').default(false),
  isActive: boolean('is_active').default(true),
  createdAt: timestamp('created_at').defaultNow(),
});

export const transactions = pgTable('plugin_payment_gateway_transactions', {
  id: serial('id').primaryKey(),
  paymentId: integer('payment_id').notNull(),
  type: text('type').notNull(), // charge, refund, fee
  amount: decimal('amount', { precision: 10, scale: 2 }).notNull(),
  currency: text('currency').notNull(),
  providerTransactionId: text('provider_transaction_id'),
  status: text('status').notNull(),
  metadata: text('metadata'),
  createdAt: timestamp('created_at').defaultNow(),
});

// Relations
export const paymentsRelations = relations(payments, ({ many }) => ({
  transactions: many(transactions),
}));

export const transactionsRelations = relations(transactions, ({ one }) => ({
  payment: one(payments, {
    fields: [transactions.paymentId],
    references: [payments.id],
  }),
}));
```

## GraphQL Implementation

### graphql/types.ts

```typescript
import { builder } from '../../../graphql/builder';

// Payment Status enum
builder.enumType('PaymentStatus', {
  values: ['pending', 'processing', 'completed', 'failed', 'refunded', 'canceled'],
});

// Payment Provider enum
builder.enumType('PaymentProvider', {
  values: ['stripe', 'paypal', 'manual'],
});

// Payment object type
builder.objectType('Payment', {
  description: 'A payment transaction',
  fields: (t) => ({
    id: t.exposeID('id', { description: 'Unique payment ID' }),
    userId: t.exposeString('userId'),
    amount: t.exposeFloat('amount'),
    currency: t.exposeString('currency'),
    status: t.expose('status', { type: 'PaymentStatus' }),
    provider: t.expose('provider', { type: 'PaymentProvider' }),
    description: t.exposeString('description', { nullable: true }),
    processingFee: t.exposeFloat('processingFee', { nullable: true }),
    netAmount: t.exposeFloat('netAmount', { nullable: true }),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
    completedAt: t.expose('completedAt', { type: 'DateTime', nullable: true }),
    
    // Relations
    transactions: t.field({
      type: ['Transaction'],
      resolve: async (payment, _, ctx) => {
        return await ctx.db.query.transactions.findMany({
          where: eq(transactions.paymentId, payment.id),
        });
      },
    }),
  }),
});

// PaymentMethod object type
builder.objectType('PaymentMethod', {
  fields: (t) => ({
    id: t.exposeID('id'),
    provider: t.expose('provider', { type: 'PaymentProvider' }),
    type: t.exposeString('type'),
    last4: t.exposeString('last4', { nullable: true }),
    brand: t.exposeString('brand', { nullable: true }),
    isDefault: t.exposeBoolean('isDefault'),
    isActive: t.exposeBoolean('isActive'),
  }),
});

// Transaction object type
builder.objectType('Transaction', {
  fields: (t) => ({
    id: t.exposeID('id'),
    type: t.exposeString('type'),
    amount: t.exposeFloat('amount'),
    currency: t.exposeString('currency'),
    status: t.exposeString('status'),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
  }),
});
```

### graphql/queries.ts

```typescript
import { builder } from '../../../graphql/builder';
import { db } from '../../../db';
import { payments, paymentMethods } from '../schema';
import { eq, and, desc } from 'drizzle-orm';

// Get single payment
builder.queryField('getPayment', (t) =>
  t.field({
    type: 'Payment',
    nullable: true,
    args: {
      id: t.arg.id({ required: true }),
    },
    authScopes: { authenticated: true },
    resolve: async (_, args, ctx) => {
      const payment = await db.query.payments.findFirst({
        where: eq(payments.id, Number(args.id)),
      });
      
      // Check authorization
      if (payment && payment.userId !== ctx.userId && !ctx.user.isAdmin) {
        throw new Error('Unauthorized');
      }
      
      return payment;
    },
  })
);

// List user payments
builder.queryField('listPayments', (t) =>
  t.field({
    type: ['Payment'],
    args: {
      userId: t.arg.string(),
      status: t.arg({ type: 'PaymentStatus', required: false }),
      limit: t.arg.int({ defaultValue: 20 }),
      offset: t.arg.int({ defaultValue: 0 }),
    },
    authScopes: { authenticated: true },
    resolve: async (_, args, ctx) => {
      const userId = args.userId || ctx.userId;
      
      // Check authorization
      if (userId !== ctx.userId && !ctx.user.isAdmin) {
        throw new Error('Unauthorized');
      }
      
      const conditions = [eq(payments.userId, userId)];
      if (args.status) {
        conditions.push(eq(payments.status, args.status));
      }
      
      return await db.query.payments.findMany({
        where: and(...conditions),
        orderBy: desc(payments.createdAt),
        limit: args.limit,
        offset: args.offset,
      });
    },
  })
);

// Get payment methods
builder.queryField('getPaymentMethods', (t) =>
  t.field({
    type: ['PaymentMethod'],
    authScopes: { authenticated: true },
    resolve: async (_, __, ctx) => {
      return await db.query.paymentMethods.findMany({
        where: and(
          eq(paymentMethods.userId, ctx.userId),
          eq(paymentMethods.isActive, true)
        ),
      });
    },
  })
);
```

### graphql/mutations.ts

```typescript
import { builder } from '../../../graphql/builder';
import { createPaymentService } from '../services/payment.service';

// Create payment
builder.mutationField('createPayment', (t) =>
  t.field({
    type: 'Payment',
    args: {
      amount: t.arg.float({ required: true, validate: { min: 0.01 } }),
      currency: t.arg.string({ defaultValue: 'USD' }),
      provider: t.arg({ type: 'PaymentProvider', required: true }),
      paymentMethodId: t.arg.string({ required: true }),
      description: t.arg.string(),
      donationId: t.arg.int(),
      eventId: t.arg.int(),
    },
    authScopes: { authenticated: true },
    resolve: async (_, args, ctx) => {
      const paymentService = createPaymentService(args.provider);
      
      return await paymentService.createPayment({
        userId: ctx.userId,
        amount: args.amount,
        currency: args.currency,
        paymentMethodId: args.paymentMethodId,
        description: args.description,
        donationId: args.donationId,
        eventId: args.eventId,
      });
    },
  })
);

// Refund payment
builder.mutationField('refundPayment', (t) =>
  t.field({
    type: 'Payment',
    args: {
      paymentId: t.arg.id({ required: true }),
      amount: t.arg.float(), // Partial refund if specified
      reason: t.arg.string(),
    },
    authScopes: { admin: true }, // Only admins can refund
    resolve: async (_, args, ctx) => {
      const payment = await db.query.payments.findFirst({
        where: eq(payments.id, Number(args.paymentId)),
      });
      
      if (!payment) {
        throw new Error('Payment not found');
      }
      
      if (payment.status !== 'completed') {
        throw new Error('Can only refund completed payments');
      }
      
      const paymentService = createPaymentService(payment.provider);
      return await paymentService.refundPayment(
        payment,
        args.amount,
        args.reason
      );
    },
  })
);
```

## Business Logic Layer

### services/payment.service.ts

```typescript
import Stripe from 'stripe';
import { db } from '../../../db';
import { payments, transactions } from '../schema';
import { eventEmitter } from '../../../events';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: '2023-10-16',
});

export interface IPaymentService {
  createPayment(data: CreatePaymentInput): Promise<Payment>;
  refundPayment(payment: Payment, amount?: number, reason?: string): Promise<Payment>;
  getPaymentStatus(paymentId: string): Promise<string>;
}

export class StripePaymentService implements IPaymentService {
  async createPayment(data: CreatePaymentInput) {
    // Create Stripe payment intent
    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.round(data.amount * 100),
      currency: data.currency.toLowerCase(),
      payment_method: data.paymentMethodId,
      confirm: true,
      metadata: {
        userId: data.userId,
        donationId: data.donationId?.toString(),
        eventId: data.eventId?.toString(),
      },
    });

    // Calculate fees
    const processingFee = data.amount * 0.029 + 0.30; // Stripe fees
    const netAmount = data.amount - processingFee;

    // Save to database
    const [payment] = await db.insert(payments).values({
      userId: data.userId,
      amount: data.amount.toString(),
      currency: data.currency,
      status: 'processing',
      provider: 'stripe',
      providerPaymentId: paymentIntent.id,
      donationId: data.donationId,
      eventId: data.eventId,
      description: data.description,
      processingFee: processingFee.toFixed(2),
      netAmount: netAmount.toFixed(2),
    }).returning();

    // Create transaction record
    await db.insert(transactions).values({
      paymentId: payment.id,
      type: 'charge',
      amount: data.amount.toString(),
      currency: data.currency,
      providerTransactionId: paymentIntent.id,
      status: paymentIntent.status,
    });

    // Emit event
    eventEmitter.emit('PAYMENT_CREATED', { payment });

    return payment;
  }

  async refundPayment(payment: Payment, amount?: number, reason?: string) {
    const refundAmount = amount || parseFloat(payment.amount);
    
    // Create Stripe refund
    const refund = await stripe.refunds.create({
      payment_intent: payment.providerPaymentId!,
      amount: Math.round(refundAmount * 100),
      reason: reason as any,
    });

    // Update payment
    const [updatedPayment] = await db.update(payments)
      .set({
        status: refundAmount === parseFloat(payment.amount) ? 'refunded' : 'completed',
        refundedAmount: refundAmount.toString(),
        updatedAt: new Date(),
      })
      .where(eq(payments.id, payment.id))
      .returning();

    // Create refund transaction
    await db.insert(transactions).values({
      paymentId: payment.id,
      type: 'refund',
      amount: refundAmount.toString(),
      currency: payment.currency,
      providerTransactionId: refund.id,
      status: refund.status,
    });

    // Emit event
    eventEmitter.emit('PAYMENT_REFUNDED', { payment: updatedPayment, amount: refundAmount });

    return updatedPayment;
  }

  async getPaymentStatus(paymentId: string): Promise<string> {
    const paymentIntent = await stripe.paymentIntents.retrieve(paymentId);
    return paymentIntent.status;
  }
}

export function createPaymentService(provider: string): IPaymentService {
  switch (provider) {
    case 'stripe':
      return new StripePaymentService();
    default:
      throw new Error(`Unsupported payment provider: ${provider}`);
  }
}
```

## Webhook Implementation

Webhooks are HTTP callbacks that payment providers use to notify your application about payment events in real-time. When a payment status changes (e.g., successful payment, failed payment, refund), the payment provider sends a POST request to your webhook endpoint with event details. Implementing webhooks is essential for keeping your payment records synchronized with the payment provider's state, especially for asynchronous payment methods where the final status may not be immediately available.

### webhooks/razorpay.ts

The Razorpay webhook handler validates incoming webhook requests using HMAC-SHA256 signature verification to ensure requests are authentic and come from Razorpay. This security measure prevents malicious actors from sending fake payment notifications. The handler then processes different event types to update payment statuses in your database accordingly.

```typescript
import { FastifyRequest, FastifyReply } from 'fastify';
import crypto from 'crypto';

// Razorpay Webhook Handler
export async function handleRazorpayWebhook(req: FastifyRequest, reply: FastifyReply) {
  const signature = req.headers['x-razorpay-signature'] as string;
  const webhookSecret = process.env.RAZORPAY_WEBHOOK_SECRET;
  const expectedSignature = crypto
    .createHmac('sha256', webhookSecret!)
    .update(req.body as string)
    .digest('hex');

  if (signature !== expectedSignature) {
    reply.code(400).send({ error: 'Invalid signature' });
    return;
  }

  // Handle event
  const event = req.body as any;
  switch (event.event) {
    case 'payment.captured':
      // Update payment status in DB
      break;
    case 'payment.failed':
      // Handle failed payment
      break;
    default:
      // Log unhandled event
      break;
  }

  reply.send({ received: true });
}
```

After processing each webhook event, always respond with a 200 status code to acknowledge receipt. Payment providers typically retry webhook deliveries if they don't receive a successful response, which could lead to duplicate event processing if not handled properly. Consider implementing idempotency checks using the event ID to prevent duplicate processing.

### webhooks/stripe.ts

The Stripe webhook implementation uses Stripe's official SDK to verify webhook signatures and construct event objects. This approach provides additional type safety and automatic signature verification compared to manual verification. The handler processes critical payment lifecycle events including successful payments, failed payments, and refunds. Each event type triggers specific database updates and emits internal events that other parts of your application can listen to.

```typescript
import { FastifyRequest, FastifyReply } from 'fastify';
import Stripe from 'stripe';
import { db } from '../../../db';
import { payments } from '../schema';
import { eq } from 'drizzle-orm';
import { eventEmitter } from '../../../events';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: '2023-10-16',
});

export async function handleStripeWebhook(
  req: FastifyRequest,
  reply: FastifyReply
) {
  const sig = req.headers['stripe-signature'] as string;
  
  let event: Stripe.Event;
  
  try {
    event = stripe.webhooks.constructEvent(
      req.body as string,
      sig,
      process.env.STRIPE_WEBHOOK_SECRET!
    );
  } catch (err) {
    console.error('Webhook signature verification failed:', err);
    return reply.code(400).send({ error: 'Invalid signature' });
  }

  // Handle event
  try {
    switch (event.type) {
      case 'payment_intent.succeeded':
        await handlePaymentSuccess(event.data.object as Stripe.PaymentIntent);
        break;
        
      case 'payment_intent.payment_failed':
        await handlePaymentFailure(event.data.object as Stripe.PaymentIntent);
        break;
        
      case 'charge.refunded':
        await handleRefund(event.data.object as Stripe.Charge);
        break;
        
      default:
        console.log(`Unhandled event type: ${event.type}`);
    }
    
    reply.send({ received: true });
  } catch (err) {
    console.error('Error processing webhook:', err);
    reply.code(500).send({ error: 'Webhook processing failed' });
  }
}

async function handlePaymentSuccess(paymentIntent: Stripe.PaymentIntent) {
  const [payment] = await db.update(payments)
    .set({
      status: 'completed',
      completedAt: new Date(),
      updatedAt: new Date(),
    })
    .where(eq(payments.providerPaymentId, paymentIntent.id))
    .returning();

  if (payment) {
    eventEmitter.emit('PAYMENT_COMPLETED', { payment });
  }
}

async function handlePaymentFailure(paymentIntent: Stripe.PaymentIntent) {
  const [payment] = await db.update(payments)
    .set({
      status: 'failed',
      errorMessage: paymentIntent.last_payment_error?.message,
      updatedAt: new Date(),
    })
    .where(eq(payments.providerPaymentId, paymentIntent.id))
    .returning();

  if (payment) {
    eventEmitter.emit('PAYMENT_FAILED', { payment });
  }
}

async function handleRefund(charge: Stripe.Charge) {
  console.log('Refund processed:', charge.id);
  // Additional refund handling if needed
}
```

## Plugin Entry Point

### index.ts

```typescript
import { IPluginLifecycle } from '../../types';
import { db } from '../../db';
import { payments, paymentMethods, transactions } from './schema';
import { sql } from 'drizzle-orm';
import { eventEmitter } from '../../events';
import { webhookRegistry } from '../../webhooks';
import { handleStripeWebhook } from './webhooks/stripe';

// Import GraphQL definitions
import './graphql/types';
import './graphql/queries';
import './graphql/mutations';

const PaymentGatewayPlugin: IPluginLifecycle = {
  async onInstall() {
    console.log('[Payment Gateway] Installing plugin...');
    
    // Create enums
    await db.execute(sql`
      CREATE TYPE plugin_payment_gateway_status AS ENUM (
        'pending', 'processing', 'completed', 'failed', 'refunded', 'canceled'
      );
    `);
    
    await db.execute(sql`
      CREATE TYPE plugin_payment_gateway_provider AS ENUM (
        'stripe', 'paypal', 'manual'
      );
    `);
    
    // Create tables (handled by Drizzle migrations)
    console.log('[Payment Gateway] Database schema created');
  },

  async onActivate() {
    console.log('[Payment Gateway] Activating plugin...');
    
    // Register webhooks
    webhookRegistry.register({
      path: '/plugin/payment_gateway/stripe-webhook',
      method: 'POST',
      handler: handleStripeWebhook,
    });
    
    // Register event listeners
    eventEmitter.on('DONATION_CREATED', handleDonationCreated);
    eventEmitter.on('EVENT_REGISTRATION_CREATED', handleEventRegistration);
    
    console.log('[Payment Gateway] Plugin activated');
  },

  async onDeactivate() {
    console.log('[Payment Gateway] Deactivating plugin...');
    
    // Unregister webhooks
    webhookRegistry.unregister('/plugin/payment_gateway/stripe-webhook');
    
    // Remove event listeners
    eventEmitter.off('DONATION_CREATED', handleDonationCreated);
    eventEmitter.off('EVENT_REGISTRATION_CREATED', handleEventRegistration);
    
    console.log('[Payment Gateway] Plugin deactivated');
  },

  async onUninstall() {
    console.log('[Payment Gateway] Uninstalling plugin...');
    
    // Drop tables
    await db.execute(sql`DROP TABLE IF EXISTS plugin_payment_gateway_transactions CASCADE`);
    await db.execute(sql`DROP TABLE IF EXISTS plugin_payment_gateway_payment_methods CASCADE`);
    await db.execute(sql`DROP TABLE IF EXISTS plugin_payment_gateway_payments CASCADE`);
    
    // Drop enums
    await db.execute(sql`DROP TYPE IF EXISTS plugin_payment_gateway_status`);
    await db.execute(sql`DROP TYPE IF EXISTS plugin_payment_gateway_provider`);
    
    console.log('[Payment Gateway] Plugin uninstalled');
  },
};

// Event handlers
async function handleDonationCreated(data: any) {
  console.log('[Payment Gateway] Processing donation:', data.id);
  // Auto-create payment intent for donation
}

async function handleEventRegistration(data: any) {
  console.log('[Payment Gateway] Processing event registration:', data.id);
  // Handle event registration payment
}

export default PaymentGatewayPlugin;
```

## Next Steps

- **[Testing Guide](https://docs-api.talawa.io/docs/developer-resources/testing)**: Write tests

## Resources

- [Stripe API](https://stripe.com/docs/api)
- [Pothos GraphQL](https://pothos-graphql.dev)
- [Drizzle ORM](https://orm.drizzle.team)
