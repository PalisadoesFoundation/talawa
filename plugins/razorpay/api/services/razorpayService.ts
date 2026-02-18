import crypto from 'node:crypto';
import Razorpay from 'razorpay';
import type { GraphQLContext } from '~/src/graphql/context';
import {
  configTable,
  ordersTable,
  transactionsTable,
} from '../database/tables';
import { eq } from 'drizzle-orm';

export interface RazorpayOrderData {
  amount: number;
  currency: string;
  receipt: string;
  notes?: Record<string, string>;
}

export interface RazorpayPaymentData {
  amount: number;
  currency: string;
  receipt: string;
  payment_capture: number;
  notes?: Record<string, string>;
}

export interface RazorpayWebhookData {
  entity: string;
  account_id: string;
  event: string;
  contains: string[];
  payload: {
    payment: {
      entity: {
        id: string;
        entity: string;
        amount: number;
        currency: string;
        status: string;
        order_id: string;
        method: string;
        amount_refunded: number;
        refund_status: string | null;
        captured: boolean;
        description: string;
        card_id: string | null;
        bank: string | null;
        wallet: string | null;
        vpa: string | null;
        email: string;
        contact: string;
        fee: number;
        tax: number;
        error_code: string | null;
        error_description: string | null;
        created_at: number;
      };
    };
  };
}

/** Razorpay Order response from API */
export interface RazorpayOrder {
  id: string;
  entity: string;
  amount: number;
  amount_paid?: number;
  amount_due?: number;
  currency: string;
  receipt?: string;
  status: string;
  attempts?: number;
  notes?: Record<string, string>;
  created_at?: number;
}

/** Razorpay Payment response from API */
export interface RazorpayPayment {
  id: string;
  entity: string;
  amount: number;
  currency: string;
  status: string;
  order_id?: string;
  method?: string;
  description?: string;
  bank?: string;
  wallet?: string;
  vpa?: string;
  email?: string;
  contact?: string;
  fee?: number;
  tax?: number;
  error_code?: string;
  error_description?: string;
  created_at?: number;
}

/** Razorpay Refund response from API */
export interface RazorpayRefund {
  id: string;
  entity: string;
  amount: number;
  currency?: string;
  payment_id?: string;
  status: string;
  created_at?: number;
}

/**
 * Service class for handling Razorpay payment gateway operations.
 * Manages orders, payments, verification, and webhooks.
 */
export class RazorpayService {
  private razorpay: Razorpay | null = null;
  private context: GraphQLContext;

  constructor(context: GraphQLContext, razorpayInstance?: Razorpay) {
    this.context = context;
    if (razorpayInstance) {
      this.razorpay = razorpayInstance;
    }
  }

  /**
   * Initializes the Razorpay instance with credentials from the database.
   * Fetches configuration from `configTable`.
   * @throws Error if configuration is missing or incomplete.
   */
  async initialize(): Promise<void> {
    try {
      const config = await this.context.drizzleClient
        .select()
        .from(configTable)
        .limit(1);

      if (config.length === 0 || !config[0]?.keyId || !config[0]?.keySecret) {
        throw new Error('Razorpay configuration not found or incomplete');
      }

      const configItem = config[0];
      this.razorpay = new Razorpay({
        key_id: configItem?.keyId,
        key_secret: configItem?.keySecret,
      });

      this.context.log?.info('Razorpay service initialized successfully');
    } catch (error) {
      this.context.log?.error('Failed to initialize Razorpay service:', error);
      throw error;
    }
  }

  /**
   * Creates a new payment order in Razorpay.
   * @param orderData - The order details including amount, currency, and receipt.
   * @returns The created Razorpay order object.
   * @throws Error if API credentials are invalid or unrelated errors occur.
   */
  async createOrder(orderData: RazorpayOrderData): Promise<RazorpayOrder> {
    if (!this.razorpay) {
      await this.initialize();
    }

    try {
      // Format currency display based on currency type
      const currencySymbols: { [key: string]: string } = {
        INR: '₹',
        USD: '$',
        EUR: '€',
        GBP: '£',
      };
      const symbol = currencySymbols[orderData.currency] || orderData.currency;
      const displayAmount = (orderData.amount / 100).toFixed(2);

      this.context.log?.info(
        `Creating Razorpay order with amount: ${symbol}${displayAmount} ${orderData.currency}`,
      );

      const order = await this.razorpay!.orders.create({
        amount: orderData.amount,
        currency: orderData.currency,
        receipt: orderData.receipt,
        notes: orderData.notes,
      });

      this.context.log?.info(
        `Razorpay order created: ${order.id} for ${symbol}${displayAmount} ${orderData.currency}`,
      );
      return order;
    } catch (error) {
      this.context.log?.error('Failed to create Razorpay order:', error);

      // Provide more specific error messages
      if (error instanceof Error) {
        if (
          error.message.includes('401') ||
          error.message.includes('Unauthorized')
        ) {
          throw new Error(
            'Invalid API credentials. Please check your Key ID and Key Secret.',
          );
        } else if (
          error.message.includes('403') ||
          error.message.includes('Forbidden')
        ) {
          throw new Error(
            'Access forbidden. Please check if your Razorpay account is active.',
          );
        } else if (
          error.message.includes('429') ||
          error.message.includes('Rate limit')
        ) {
          throw new Error(
            'Rate limit exceeded. Please try again in a few minutes.',
          );
        } else {
          throw new Error(`Razorpay API error: ${error.message}`);
        }
      }

      throw error;
    }
  }

  /**
   * Creates a payment entry in Razorpay (note: usually handled on client side, but this wraps server-side creating if needed).
   * @param paymentData - Payment details.
   * @returns The created payment object.
   */
  async createPayment(
    paymentData: RazorpayPaymentData,
  ): Promise<RazorpayPayment> {
    if (!this.razorpay) {
      await this.initialize();
    }

    try {
      // Type assertion needed as Razorpay SDK types don't expose payments.create
      const payment = await (
        this.razorpay!.payments as unknown as {
          create: (data: RazorpayPaymentData) => Promise<RazorpayPayment>;
        }
      ).create({
        amount: paymentData.amount,
        currency: paymentData.currency,
        receipt: paymentData.receipt,
        payment_capture: paymentData.payment_capture,
        notes: paymentData.notes,
      });

      this.context.log?.info(`Razorpay payment created: ${payment.id}`);
      return payment;
    } catch (error) {
      this.context.log?.error('Failed to create Razorpay payment:', error);
      throw error;
    }
  }

  /**
   * Verifies a payment signature using the webhook secret.
   * @param paymentId - The ID of the payment.
   * @param orderId - The ID of the order.
   * @param signature - The signature to verify.
   * @param paymentData - The data payload to verify against.
   * @returns Boolean indicating if the signature is valid.
   */
  async verifyPayment(
    paymentId: string,
    orderId: string,
    signature: string,
    paymentData: string,
  ): Promise<boolean> {
    try {
      const config = await this.context.drizzleClient
        .select()
        .from(configTable)
        .limit(1);

      if (config.length === 0 || !config[0]?.webhookSecret) {
        throw new Error('Webhook secret not configured');
      }

      const expectedSignature = crypto
        .createHmac('sha256', config[0]?.webhookSecret)
        .update(paymentData)
        .digest('hex');

      // Validate hex strings (must be even length)
      const hexRegex = /^[0-9a-fA-F]+$/;
      if (
        !hexRegex.test(expectedSignature) ||
        !hexRegex.test(signature) ||
        expectedSignature.length % 2 !== 0 ||
        signature.length % 2 !== 0
      ) {
        return false;
      }

      const expectedBuffer = Buffer.from(expectedSignature, 'hex');
      const signatureBuffer = Buffer.from(signature, 'hex');

      if (expectedBuffer.length !== signatureBuffer.length) {
        return false;
      }

      const isValid = crypto.timingSafeEqual(expectedBuffer, signatureBuffer);

      this.context.log?.info(`Payment verification result: ${isValid}`);
      return isValid;
    } catch (error) {
      this.context.log?.error('Failed to verify payment:', error);
      throw error;
    }
  }

  /**
   * Verifies the signature of a payment associated with an order using the Key Secret.
   * @param orderId - The Razorpay order ID.
   * @param paymentId - The Razorpay payment ID.
   * @param signature - The signature generated by Razorpay.
   * @returns Boolean indicating if the signature is valid.
   */
  async verifyPaymentSignature(
    orderId: string,
    paymentId: string,
    signature: string,
  ): Promise<boolean> {
    const config = await this.context.drizzleClient
      .select()
      .from(configTable)
      .limit(1);

    if (config.length === 0 || !config[0]?.keySecret) {
      throw new Error('Razorpay Key Secret not configured');
    }

    const generatedSignature = crypto
      .createHmac('sha256', config[0].keySecret)
      .update(`${orderId}|${paymentId}`)
      .digest('hex');

    // Validate hex strings (must be even length)
    const hexRegex = /^[0-9a-fA-F]+$/;
    if (
      !hexRegex.test(generatedSignature) ||
      !hexRegex.test(signature) ||
      generatedSignature.length % 2 !== 0 ||
      signature.length % 2 !== 0
    ) {
      return false;
    }

    const generatedBuffer = Buffer.from(generatedSignature, 'hex');
    const signatureBuffer = Buffer.from(signature, 'hex');

    if (generatedBuffer.length !== signatureBuffer.length) {
      return false;
    }

    return crypto.timingSafeEqual(generatedBuffer, signatureBuffer);
  }

  /**
   * Verifies the signature of a webhook payload.
   * @param webhookBody - The raw body of the webhook request.
   * @param signature - The X-Razorpay-Signature header value.
   * @returns Boolean indicating if the signature is valid.
   */
  async verifyWebhookSignature(
    webhookBody: string,
    signature: string,
  ): Promise<boolean> {
    try {
      const config = await this.context.drizzleClient
        .select()
        .from(configTable)
        .limit(1);

      if (config.length === 0 || !config[0]?.webhookSecret) {
        throw new Error('Webhook secret not configured');
      }

      const expectedSignature = crypto
        .createHmac('sha256', config[0]?.webhookSecret)
        .update(webhookBody)
        .digest('hex');

      const isValid = crypto.timingSafeEqual(
        Buffer.from(expectedSignature, 'hex'),
        Buffer.from(signature, 'hex'),
      );

      this.context.log?.info(
        `Webhook signature verification result: ${isValid}`,
      );
      return isValid;
    } catch (error) {
      this.context.log?.error('Failed to verify webhook signature:', error);
      throw error;
    }
  }

  /**
   * Processes a verified webhook event from Razorpay.
   * Updates order and transaction status based on the event payload.
   * @param webhookData - The parsed webhook data.
   */
  async processWebhook(webhookData: RazorpayWebhookData): Promise<void> {
    try {
      const { payment } = webhookData.payload;
      const paymentEntity = payment.entity;

      // Get order details to get userId and other info
      const orderDetails = await this.context.drizzleClient
        .select()
        .from(ordersTable)
        .where(eq(ordersTable.razorpayOrderId, paymentEntity.order_id))
        .limit(1);

      if (orderDetails.length === 0) {
        this.context.log?.error(
          `Order not found for payment: ${paymentEntity.id}`,
        );
        throw new Error(`Order not found for payment: ${paymentEntity.id}`);
      }

      const order = orderDetails[0];

      // Check if transaction already exists
      const existingTransaction = await this.context.drizzleClient
        .select()
        .from(transactionsTable)
        .where(eq(transactionsTable.paymentId, paymentEntity.id))
        .limit(1);

      if (existingTransaction.length === 0) {
        // Create new transaction with userId from order
        await this.context.drizzleClient.insert(transactionsTable).values({
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
        await this.context.drizzleClient
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
        await this.context.drizzleClient
          .update(ordersTable)
          .set({
            status: 'paid',
            updatedAt: new Date(),
          })
          .where(eq(ordersTable.razorpayOrderId, paymentEntity.order_id));
      }

      this.context.log?.info(
        `Webhook processed for payment: ${paymentEntity.id}`,
      );
    } catch (error) {
      this.context.log?.error('Failed to process webhook:', error);
      throw error;
    }
  }

  /**
   * Fetches details of a specific payment from Razorpay.
   * @param paymentId - The ID of the payment to fetch.
   * @returns The payment details object.
   */
  async getPaymentDetails(paymentId: string): Promise<RazorpayPayment> {
    if (!this.razorpay) {
      await this.initialize();
    }

    try {
      const payment = await this.razorpay!.payments.fetch(paymentId);
      this.context.log?.info(`Payment details retrieved: ${paymentId}`);
      return payment;
    } catch (error) {
      this.context.log?.error('Failed to get payment details:', error);
      throw error;
    }
  }

  /**
   * Initiates a refund for a specific payment.
   * @param paymentId - The ID of the payment to refund.
   * @param amount - Optional amount to refund (if partial).
   * @returns The refund object.
   */
  async refundPayment(
    paymentId: string,
    amount?: number,
  ): Promise<RazorpayRefund> {
    if (!this.razorpay) {
      await this.initialize();
    }

    try {
      const refund = await this.razorpay!.payments.refund(paymentId, {
        amount: amount,
      });

      this.context.log?.info(`Payment refunded: ${paymentId}`);
      return refund;
    } catch (error) {
      this.context.log?.error('Failed to refund payment:', error);
      throw error;
    }
  }

  /**
   * Tests the connection to Razorpay API using current configuration.
   * @returns Object containing success status and message.
   */
  async testConnection(): Promise<{ success: boolean; message: string }> {
    try {
      // Get current configuration
      const config = await this.context.drizzleClient
        .select()
        .from(configTable)
        .limit(1);

      if (config.length === 0 || !config[0]) {
        return {
          success: false,
          message:
            'No Razorpay configuration found. Please configure your API keys first.',
        };
      }

      const configItem = config[0];

      if (!configItem.keyId || !configItem.keySecret) {
        return {
          success: false,
          message:
            'API keys are not configured. Please enter your Key ID and Key Secret.',
        };
      }

      // Validate key format
      if (!configItem.keyId.startsWith('rzp_')) {
        return {
          success: false,
          message:
            "Invalid Key ID format. Razorpay Key ID should start with 'rzp_'.",
        };
      }

      this.context.log?.info(
        `Testing Razorpay connection with Key ID: ${configItem.keyId.substring(0, 8)}...`,
      );

      // Test connection by making a simple API call to Razorpay
      const response = await fetch(
        'https://api.razorpay.com/v1/payments?count=1',
        {
          method: 'GET',
          headers: {
            Authorization: `Basic ${Buffer.from(`${configItem.keyId}:${configItem.keySecret}`).toString('base64')}`,
            'Content-Type': 'application/json',
            'User-Agent': 'Talawa-Razorpay-Plugin/1.0.0',
          },
        },
      );

      this.context.log?.info(
        `Razorpay API response status: ${response.status}`,
      );

      if (response.ok) {
        // Parse JSON to validate the response format; result is intentionally discarded
        await response.json();
        this.context.log?.info('Razorpay API test successful');
        return {
          success: true,
          message:
            'Connection successful! Your Razorpay credentials are valid.',
        };
      } else if (response.status === 401) {
        return {
          success: false,
          message:
            "Invalid API credentials. Please check your Key ID and Key Secret. Make sure you're using the correct test/live keys.",
        };
      } else if (response.status === 403) {
        return {
          success: false,
          message:
            'Access forbidden. Please check if your Razorpay account is active and has the necessary permissions.',
        };
      } else if (response.status === 429) {
        return {
          success: false,
          message: 'Rate limit exceeded. Please try again in a few minutes.',
        };
      } else if (response.status >= 500) {
        return {
          success: false,
          message: 'Razorpay server error. Please try again later.',
        };
      } else {
        const errorText = await response.text().catch(() => 'Unknown error');
        this.context.log?.error(
          `Razorpay API error: ${response.status} - ${errorText}`,
        );
        return {
          success: false,
          message: `Connection failed with status ${response.status}. ${errorText}`,
        };
      }
    } catch (error) {
      this.context.log?.error('Error testing Razorpay connection:', error);

      if (error instanceof TypeError && error.message.includes('fetch')) {
        return {
          success: false,
          message:
            'Network error. Please check your internet connection and try again.',
        };
      } else if (error instanceof Error) {
        return {
          success: false,
          message: `Connection test failed: ${error.message}`,
        };
      } else {
        return {
          success: false,
          message:
            'Connection test failed. Please check your internet connection and try again.',
        };
      }
    }
  }
}

export function createRazorpayService(
  context: GraphQLContext,
): RazorpayService {
  return new RazorpayService(context);
}
