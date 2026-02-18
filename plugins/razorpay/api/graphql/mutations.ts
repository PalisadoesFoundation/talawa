import { eq } from 'drizzle-orm';
import crypto from 'node:crypto';
import { z } from 'zod';
import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';
import {
  configTable,
  ordersTable,
  transactionsTable,
} from '../database/tables';
import { createRazorpayService } from '../services/razorpayService';
import {
  RazorpayConfigRef,
  RazorpayOrderRef,
  RazorpayPaymentResultRef,
  RazorpayTestResultRef,
} from './types';
import {
  RazorpayConfigInput,
  RazorpayOrderInput,
  RazorpayPaymentInput,
  RazorpayVerificationInput,
  razorpayConfigInputSchema,
  razorpayOrderInputSchema,
  razorpayPaymentInputSchema,
  razorpayVerificationInputSchema,
} from './inputs';

// Update Razorpay configuration resolver
const updateRazorpayConfigArgumentsSchema = z.object({
  input: razorpayConfigInputSchema,
});

export async function updateRazorpayConfigResolver(
  _parent: unknown,
  args: z.infer<typeof updateRazorpayConfigArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  // Check for superadmin access
  if (!ctx.user || !ctx.user.isSuperAdmin) {
    throw new TalawaGraphQLError({
      extensions: { code: 'forbidden' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = updateRazorpayConfigArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
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
    // Check if config exists
    const existingConfig = await ctx.drizzleClient
      .select()
      .from(configTable)
      .limit(1);

    if (existingConfig.length === 0) {
      // Create new config
      const [newConfig] = await ctx.drizzleClient
        .insert(configTable)
        .values({
          keyId: parsedArgs.input.keyId,
          keySecret: parsedArgs.input.keySecret,
          webhookSecret: parsedArgs.input.webhookSecret,
          isEnabled: parsedArgs.input.isEnabled,
          testMode: parsedArgs.input.testMode,
          currency: parsedArgs.input.currency,
          description: parsedArgs.input.description,
          createdAt: new Date(),
          updatedAt: new Date(),
        })
        .returning();

      if (!newConfig) {
        throw new TalawaGraphQLError({
          extensions: { code: 'unexpected' },
        });
      }

      return {
        keyId: newConfig.keyId || undefined,
        keySecret: newConfig.keySecret || undefined,
        webhookSecret: newConfig.webhookSecret || undefined,
        isEnabled: newConfig.isEnabled || false,
        testMode: newConfig.testMode || true,
        currency: newConfig.currency || 'INR',
        description: newConfig.description || 'Donation to organization',
      };
    } else {
      // Update existing config
      const existingConfigItem = existingConfig[0];
      if (!existingConfigItem) {
        throw new TalawaGraphQLError({
          extensions: { code: 'unexpected' },
        });
      }

      const [updatedConfig] = await ctx.drizzleClient
        .update(configTable)
        .set({
          keyId: parsedArgs.input.keyId,
          keySecret: parsedArgs.input.keySecret,
          webhookSecret: parsedArgs.input.webhookSecret,
          isEnabled: parsedArgs.input.isEnabled,
          testMode: parsedArgs.input.testMode,
          currency: parsedArgs.input.currency,
          description: parsedArgs.input.description,
          updatedAt: new Date(),
        })
        .where(eq(configTable.id, existingConfigItem.id))
        .returning();

      if (!updatedConfig) {
        throw new TalawaGraphQLError({
          extensions: { code: 'unexpected' },
        });
      }

      return {
        keyId: updatedConfig.keyId || undefined,
        keySecret: updatedConfig.keySecret || undefined,
        webhookSecret: updatedConfig.webhookSecret || undefined,
        isEnabled: updatedConfig.isEnabled || false,
        testMode: updatedConfig.testMode || true,
        currency: updatedConfig.currency || 'INR',
        description: updatedConfig.description || 'Donation to organization',
      };
    }
  } catch (error) {
    ctx.log?.error('Error updating Razorpay config:', error);
    throw new TalawaGraphQLError({
      extensions: { code: 'unexpected' },
    });
  }
}

// Create payment order resolver
const createPaymentOrderArgumentsSchema = z.object({
  input: razorpayOrderInputSchema,
});

export async function createPaymentOrderResolver(
  _parent: unknown,
  args: z.infer<typeof createPaymentOrderArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = createPaymentOrderArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
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
    // Step 1: Initialize the Razorpay service
    const razorpayService = createRazorpayService(ctx);

    // Step 2: Create a real order with the Razorpay API
    const razorpayOrder = await razorpayService.createOrder({
      amount: parsedArgs.input.amount,
      currency: parsedArgs.input.currency,
      receipt: `receipt_${Date.now()}_${Math.random()
        .toString(36)
        .substr(2, 9)}`,
      notes: {
        organizationId: parsedArgs.input.organizationId,
        userId: parsedArgs.input.userId || 'guest',
        donorName: parsedArgs.input.donorName,
      },
    });

    if (!razorpayOrder || !razorpayOrder.id) {
      throw new Error('Failed to create Razorpay order.');
    }

    // Check authentication before database insert
    if (!ctx.user) {
      throw new TalawaGraphQLError({
        extensions: { code: 'unauthenticated' },
      });
    }

    // Step 3: Save the REAL order details to your database
    const [order] = await ctx.drizzleClient
      .insert(ordersTable)
      .values({
        razorpayOrderId: razorpayOrder.id, // Use the REAL ID from Razorpay
        organizationId: parsedArgs.input.organizationId,
        userId: parsedArgs.input.userId,
        amount: razorpayOrder.amount, // Use amount from Razorpay response as source of truth
        currency: razorpayOrder.currency,
        receipt: razorpayOrder.receipt,
        status: razorpayOrder.status, // Status will be "created"
        donorName: parsedArgs.input.donorName,
        donorEmail: parsedArgs.input.donorEmail,
        donorPhone: parsedArgs.input.donorPhone,
        description: parsedArgs.input.description,
        createdAt: new Date(),
        updatedAt: new Date(),
      })
      .returning();

    // Return the correct data to the frontend
    return {
      id: order.id,
      razorpayOrderId: order.razorpayOrderId, // This is now the REAL order ID
      organizationId: order.organizationId,
      userId: order.userId,
      amount: order.amount,
      currency: order.currency,
      status: order.status,
      donorName: order.donorName,
      donorEmail: order.donorEmail,
      donorPhone: order.donorPhone,
      description: order.description,
      anonymous: order.anonymous,
      createdAt: order.createdAt,
      updatedAt: order.updatedAt,
    };
  } catch (error) {
    ctx.log?.error('Error creating payment order:', error);
    throw new TalawaGraphQLError({
      extensions: { code: 'unexpected' },
      message:
        error instanceof Error
          ? error.message
          : 'Could not create payment order',
    });
  }
}

// Initiate payment resolver
const initiatePaymentArgumentsSchema = z.object({
  input: razorpayPaymentInputSchema,
});

export async function initiatePaymentResolver(
  _parent: unknown,
  args: z.infer<typeof initiatePaymentArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = initiatePaymentArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
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
    // Get order details
    const order = await ctx.drizzleClient
      .select()
      .from(ordersTable)
      .where(eq(ordersTable.id, parsedArgs.input.orderId))
      .limit(1);

    if (order.length === 0) {
      throw new TalawaGraphQLError({
        extensions: {
          code: 'arguments_associated_resources_not_found',
          issues: [{ argumentPath: ['input', 'orderId'] }],
        },
      });
    }

    const orderItem = order[0];
    if (!orderItem) {
      throw new TalawaGraphQLError({
        extensions: { code: 'unexpected' },
      });
    }

    if (orderItem.status === 'paid') {
      throw new TalawaGraphQLError('Order already paid', {
        extensions: {
          code: 'invalid_arguments',
          issues: [
            {
              argumentPath: ['input', 'orderId'],
              message: 'Order already paid',
            },
          ],
        },
      });
    }

    // Get Razorpay configuration
    const config = await ctx.drizzleClient.select().from(configTable).limit(1);

    if (config.length === 0 || !config[0].isEnabled) {
      throw new TalawaGraphQLError({
        extensions: {
          code: 'precondition_required',
          message: 'Razorpay is not enabled',
        },
      });
    }

    // Generate payment ID
    const paymentId = `pay_${Date.now()}_${Math.random()
      .toString(36)
      .substr(2, 9)}`;

    // Create transaction record
    const [_transaction] = await ctx.drizzleClient
      .insert(transactionsTable)
      .values({
        paymentId,
        orderId: orderItem.id,
        organizationId: orderItem.organizationId,
        userId: orderItem.userId,
        amount: orderItem.amount,
        currency: orderItem.currency,
        status: 'pending',
        method: parsedArgs.input.paymentMethod,
        createdAt: new Date(),
        updatedAt: new Date(),
      })
      .returning();

    // Update order status
    await ctx.drizzleClient
      .update(ordersTable)
      .set({
        status: 'pending',
        updatedAt: new Date(),
      })
      .where(eq(ordersTable.id, orderItem.id));

    return {
      success: true,
      message: 'Payment initiated successfully',
      orderId: orderItem.id,
      paymentId: paymentId,
      amount: orderItem.amount || undefined,
      currency: orderItem.currency || 'INR',
      transaction: {
        paymentId: paymentId,
        status: 'pending',
        amount: orderItem.amount || undefined,
        currency: orderItem.currency || 'INR',
      },
    };
  } catch (error) {
    ctx.log?.error('Error initiating payment:', error);
    return {
      success: false,
      message:
        error instanceof Error ? error.message : 'Failed to initiate payment',
      transaction: null,
    };
  }
}

// Verify payment resolver
const verifyPaymentArgumentsSchema = z.object({
  input: razorpayVerificationInputSchema,
});

export async function verifyPaymentResolver(
  _parent: unknown,
  args: z.infer<typeof verifyPaymentArgumentsSchema>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  const {
    success,
    data: parsedArgs,
    error,
  } = verifyPaymentArgumentsSchema.safeParse(args);

  if (!success) {
    throw new TalawaGraphQLError({
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
    // Get Razorpay configuration
    const config = await ctx.drizzleClient.select().from(configTable).limit(1);

    if (config.length === 0) {
      throw new TalawaGraphQLError({
        extensions: {
          code: 'arguments_associated_resources_not_found',
          issues: [{ argumentPath: ['input', 'razorpayOrderId'] }],
        },
      });
    }

    const configItem = config[0];
    if (!configItem) {
      throw new TalawaGraphQLError({
        extensions: { code: 'unexpected' },
      });
    }

    // Verify signature using keySecret (not webhookSecret)
    const expectedSignature = crypto
      .createHmac('sha256', configItem.keySecret || '')
      .update(
        `${parsedArgs.input.razorpayOrderId}|${parsedArgs.input.razorpayPaymentId}`,
      )
      .digest('hex');

    if (expectedSignature !== parsedArgs.input.razorpaySignature) {
      ctx.log?.error('Signature verification failed');
      throw new TalawaGraphQLError({
        extensions: {
          code: 'unauthorized_action_on_arguments_associated_resources',
          issues: [{ argumentPath: ['input', 'razorpaySignature'] }],
        },
      });
    }

    // Get order details
    const order = await ctx.drizzleClient
      .select()
      .from(ordersTable)
      .where(eq(ordersTable.razorpayOrderId, parsedArgs.input.razorpayOrderId))
      .limit(1);

    if (order.length === 0) {
      throw new TalawaGraphQLError({
        extensions: {
          code: 'arguments_associated_resources_not_found',
          issues: [{ argumentPath: ['input', 'razorpayOrderId'] }],
        },
      });
    }

    // Check if transaction already exists (created by webhook)
    const existingTransaction = await ctx.drizzleClient
      .select()
      .from(transactionsTable)
      .where(
        eq(transactionsTable.paymentId, parsedArgs.input.razorpayPaymentId),
      )
      .limit(1);

    const orderItem = order[0];
    if (!orderItem) {
      throw new TalawaGraphQLError({
        extensions: { code: 'unexpected' },
      });
    }

    // If transaction doesn't exist, create a basic one
    // (The webhook should have created it, but just in case)
    if (existingTransaction.length === 0) {
      const transactionData = {
        paymentId: parsedArgs.input.razorpayPaymentId,
        orderId: orderItem.id,
        organizationId: orderItem.organizationId,
        userId: orderItem.userId,
        amount: orderItem.amount,
        currency: orderItem.currency,
        status: 'captured',
        capturedAt: new Date(),
      };

      await ctx.drizzleClient.insert(transactionsTable).values(transactionData);
    }

    // Update order status
    await ctx.drizzleClient
      .update(ordersTable)
      .set({
        status: 'paid',
        updatedAt: new Date(),
      })
      .where(eq(ordersTable.id, orderItem.id));

    return {
      success: true,
      message: 'Payment verified successfully',
      transaction: {
        paymentId: parsedArgs.input.razorpayPaymentId,
        status: 'captured',
        amount: orderItem.amount || undefined,
        currency: orderItem.currency || 'INR',
      },
    };
  } catch (error) {
    ctx.log?.error('Error verifying payment:', error);

    return {
      success: false,
      message:
        error instanceof Error ? error.message : 'Failed to verify payment',
      transaction: null,
    };
  }
}

// Test Razorpay setup with dummy payment
export async function testRazorpaySetupResolver(
  _parent: unknown,
  _args: Record<string, unknown>,
  ctx: GraphQLContext,
) {
  if (!ctx.currentClient.isAuthenticated) {
    throw new TalawaGraphQLError({
      extensions: { code: 'unauthenticated' },
    });
  }

  // Check for admin access
  if (!ctx.isAdmin) {
    throw new TalawaGraphQLError({
      extensions: { code: 'forbidden' },
    });
  }

  try {
    // Get current configuration
    const config = await ctx.drizzleClient.select().from(configTable).limit(1);

    if (config.length === 0 || !config[0]) {
      return {
        success: false,
        message:
          'No Razorpay configuration found. Please configure your API keys first.',
      };
    }

    const configItem = config[0];

    ctx.log?.info('Testing Razorpay setup configuration', {
      keyId: configItem.keyId?.substring(0, 8) + '...',
      isEnabled: configItem.isEnabled,
      testMode: configItem.testMode,
    });

    if (!configItem.keyId || !configItem.keySecret) {
      return {
        success: false,
        message:
          'API keys are not configured. Please enter your Key ID and Key Secret.',
      };
    }

    if (!configItem.webhookSecret) {
      return {
        success: false,
        message:
          'Webhook secret is not configured. Please enter your webhook secret.',
      };
    }

    // Import Razorpay service to test setup
    const { createRazorpayService } =
      await import('../services/razorpayService');
    const razorpayService = createRazorpayService(ctx);

    ctx.log?.info(
      `Testing Razorpay setup with Key ID: ${configItem.keyId?.substring(0, 8)}...`,
    );

    // Test by creating a dummy payment order (₹1.00 = 100 paise)
    const testOrder = await razorpayService.createOrder({
      amount: 100, // 100 paise = ₹1.00
      currency: configItem.currency || 'INR',
      receipt: `test_${Date.now()}`,
      notes: {
        test: 'true',
        purpose: 'setup_verification',
      },
    });

    ctx.log?.info(`Test order created successfully: ${testOrder.id}`);

    return {
      success: true,
      message: `Setup verified! Test order created: ${testOrder.id} (₹1.00). Your Razorpay configuration is working correctly.`,
    };
  } catch (error) {
    ctx.log?.error('Error testing Razorpay setup', {
      error: error instanceof Error ? error.message : String(error),
      stack: error instanceof Error ? error.stack : undefined,
    });

    if (error instanceof Error) {
      if (error.message.includes('Invalid API credentials')) {
        return {
          success: false,
          message:
            'Invalid API credentials. Please check your Key ID and Key Secret.',
        };
      } else if (error.message.includes('Webhook secret not configured')) {
        return {
          success: false,
          message:
            'Webhook secret not configured. Please add your webhook secret.',
        };
      } else {
        return {
          success: false,
          message: `Setup test failed: ${error.message}`,
        };
      }
    } else {
      return {
        success: false,
        message:
          'Setup test failed. Please check your configuration and try again.',
      };
    }
  }
}

// Register all Razorpay mutations with the builder
export function registerRazorpayMutations(
  builderInstance: typeof builder,
): void {
  // Update Razorpay configuration
  builderInstance.mutationField('updateRazorpayConfig', (t) =>
    t.field({
      type: RazorpayConfigRef,
      args: {
        input: t.arg({
          type: RazorpayConfigInput,
          required: true,
          description: 'Razorpay configuration input',
        }),
      },
      description: 'Update Razorpay configuration settings',
      resolve: updateRazorpayConfigResolver,
    }),
  );

  // Create payment order
  builderInstance.mutationField('createPaymentOrder', (t) =>
    t.field({
      type: RazorpayOrderRef,
      args: {
        input: t.arg({
          type: RazorpayOrderInput,
          required: true,
          description: 'Payment order input',
        }),
      },
      description: 'Create a new payment order',
      resolve: createPaymentOrderResolver,
    }),
  );

  // Initiate payment
  builderInstance.mutationField('initiatePayment', (t) =>
    t.field({
      type: RazorpayPaymentResultRef,
      args: {
        input: t.arg({
          type: RazorpayPaymentInput,
          required: true,
          description: 'Payment initiation input',
        }),
      },
      description: 'Initiate a payment transaction',
      resolve: initiatePaymentResolver,
    }),
  );

  // Verify payment
  builderInstance.mutationField('verifyPayment', (t) =>
    t.field({
      type: RazorpayPaymentResultRef,
      args: {
        input: t.arg({
          type: RazorpayVerificationInput,
          required: true,
          description: 'Payment verification input',
        }),
      },
      description: 'Verify payment signature and update transaction status',
      resolve: verifyPaymentResolver,
    }),
  );

  // Test Razorpay setup with dummy payment
  builderInstance.mutationField('testRazorpaySetup', (t) =>
    t.field({
      type: RazorpayTestResultRef,
      description: 'Test Razorpay setup by creating a dummy payment order',
      resolve: testRazorpaySetupResolver,
    }),
  );
}
