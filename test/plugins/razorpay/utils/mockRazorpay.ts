import { vi, type Mock } from 'vitest';
import type { GraphQLContext } from '~/src/graphql/context';
import type { RazorpayWebhookData } from '~/plugins/razorpay/api/services/razorpayService';
import crypto from 'node:crypto';

/**
 * Mock Razorpay SDK
 */
export interface MockRazorpayOrder {
  id: string;
  entity: string;
  amount: number;
  amount_paid: number;
  amount_due: number;
  currency: string;
  receipt: string;
  status: string;
  attempts: number;
  notes: Record<string, string>;
  created_at: number;
}

export interface MockRazorpayPayment {
  id: string;
  entity: string;
  amount: number;
  currency: string;
  status: string;
  order_id: string;
  method: string;
  captured: boolean;
  email: string;
  contact: string;
  created_at: number;
}

export interface MockRazorpayRefund {
  id: string;
  entity: string;
  amount: number;
  currency: string;
  payment_id: string;
  status: string;
  created_at: number;
}

/**
 * Creates a mock Razorpay instance with all necessary methods
 */
export const createMockRazorpayInstance = () => {
  return {
    orders: {
      create: vi.fn().mockResolvedValue(createMockRazorpayOrder()),
      fetch: vi.fn().mockResolvedValue(createMockRazorpayOrder()),
      all: vi.fn().mockResolvedValue({ items: [], count: 0 }),
    },
    payments: {
      create: vi.fn().mockResolvedValue(createMockRazorpayPayment()),
      fetch: vi.fn().mockResolvedValue(createMockRazorpayPayment()),
      capture: vi.fn().mockResolvedValue(createMockRazorpayPayment()),
      refund: vi.fn().mockResolvedValue(createMockRazorpayRefund()),
      all: vi.fn().mockResolvedValue({ items: [], count: 0 }),
    },
    refunds: {
      create: vi.fn().mockResolvedValue(createMockRazorpayRefund()),
      fetch: vi.fn().mockResolvedValue(createMockRazorpayRefund()),
    },
  };
};

/**
 * Factory function to create mock Razorpay order
 */
export const createMockRazorpayOrder = (
  overrides: Partial<MockRazorpayOrder> = {},
): MockRazorpayOrder => {
  return {
    id: 'order_test123',
    entity: 'order',
    amount: 100000, // 1000.00 INR in paise
    amount_paid: 0,
    amount_due: 100000,
    currency: 'INR',
    receipt: 'receipt_123',
    status: 'created',
    attempts: 0,
    notes: {},
    created_at: Math.floor(Date.now() / 1000),
    ...overrides,
  };
};

/**
 * Factory function to create mock Razorpay payment
 */
export const createMockRazorpayPayment = (
  overrides: Partial<MockRazorpayPayment> = {},
): MockRazorpayPayment => {
  return {
    id: 'pay_test123',
    entity: 'payment',
    amount: 100000,
    currency: 'INR',
    status: 'captured',
    order_id: 'order_test123',
    method: 'card',
    captured: true,
    email: 'test@example.com',
    contact: '+919876543210',
    created_at: Math.floor(Date.now() / 1000),
    ...overrides,
  };
};

/**
 * Factory function to create mock Razorpay refund
 */
export const createMockRazorpayRefund = (
  overrides: Partial<MockRazorpayRefund> = {},
): MockRazorpayRefund => {
  return {
    id: 'rfnd_test123',
    entity: 'refund',
    amount: 100000,
    currency: 'INR',
    payment_id: 'pay_test123',
    status: 'processed',
    created_at: Math.floor(Date.now() / 1000),
    ...overrides,
  };
};

/**
 * Mock database config data
 */
export const createMockConfig = (overrides: Record<string, unknown> = {}) => {
  return {
    id: 'config-123',
    keyId: 'rzp_test_key123',
    keySecret: 'rzp_test_secret123',
    webhookSecret: 'webhook_secret_123',
    isEnabled: true,
    testMode: true,
    currency: 'INR',
    description: 'Donation to organization',
    createdAt: new Date(),
    updatedAt: new Date(),
    ...overrides,
  };
};

/**
 * Mock database order data
 */
export const createMockOrder = (overrides: Record<string, unknown> = {}) => {
  return {
    id: 'db-order-123',
    razorpayOrderId: 'order_test123',
    organizationId: 'org-123',
    userId: 'user-123',
    amount: 100000,
    currency: 'INR',
    receipt: 'receipt_123',
    status: 'created',
    description: 'Test donation',
    donorName: 'Test User',
    donorEmail: 'test@example.com',
    donorPhone: '+919876543210',
    createdAt: new Date(),
    updatedAt: new Date(),
    ...overrides,
  };
};

/**
 * Mock database transaction data
 */
export const createMockTransaction = (
  overrides: Record<string, unknown> = {},
) => {
  return {
    id: 'db-transaction-123',
    paymentId: 'pay_test123',
    orderId: 'db-order-123',
    organizationId: 'org-123',
    userId: 'user-123',
    amount: 100000,
    currency: 'INR',
    status: 'captured',
    method: 'card',
    bank: null,
    wallet: null,
    cardId: null,
    vpa: null,
    email: 'test@example.com',
    contact: '+919876543210',
    fee: 2000,
    tax: 360,
    errorCode: null,
    errorDescription: null,
    refundStatus: null,
    capturedAt: new Date(),
    createdAt: new Date(),
    updatedAt: new Date(),
    ...overrides,
  };
};

/**
 * Mock database client for testing
 */
export const createMockDatabaseClient = () => {
  type MockDb = {
    then: (
      resolve: (value: unknown) => void,
      reject: (reason?: unknown) => void,
    ) => Promise<unknown>;
    execute: Mock<(...args: unknown[]) => Promise<unknown>>;
    returning: Mock<(...args: unknown[]) => Promise<unknown>>;
    transaction: Mock<
      (callback: (tx: unknown) => Promise<unknown>) => Promise<unknown>
    >;
  } & Partial<Record<string, Mock<(...args: unknown[]) => unknown>>>;

  // biome-ignore lint/suspicious/noThenProperty: Intentional thenable for database mock
  const mockDb: MockDb = {
    // The "then" method is required to make the mock object "thenable" (Promise-like),
    // allowing it to be awaited directly in the application code (e.g. await db.select()...).
    // Without this, "await" would return the object itself instead of the query result.
    then: (
      resolve: (value: unknown) => void,
      reject: (reason?: unknown) => void,
    ) => mockDb.execute().then(resolve, reject),
  } as MockDb;

  const methods = [
    'groupBy',
    'select',
    'from',
    'where',
    'limit',
    'offset',
    'orderBy',
    'insert',
    'values',
    'update',
    'set',
    'delete',
    'leftJoin',
  ];

  methods.forEach((method) => {
    mockDb[method] = vi.fn(() => mockDb);
  });

  // Special handling for execute and returning
  mockDb.execute = vi.fn().mockResolvedValue([]);
  mockDb.returning = vi.fn().mockResolvedValue([createMockConfig()]);

  // Mock transaction method
  mockDb.transaction = vi.fn((callback) =>
    callback(mockDb),
  ) as MockDb['transaction'];

  return mockDb;
};

/**
 * Mock GraphQL context with Razorpay-specific fields
 */
export const createMockRazorpayContext = (
  overrides: Partial<GraphQLContext> = {},
): GraphQLContext => {
  const mockDb = createMockDatabaseClient();

  const ctx = {
    userId: 'user-123',
    user: {
      id: 'user-123',
      email: 'test@example.com',
      firstName: 'Test',
      lastName: 'User',
      roles: ['admin'],
      permissions: [],
      isSuperAdmin: false,
    },
    organizationId: 'org-123',
    organization: {
      id: 'org-123',
      name: 'Test Organization',
      slug: 'test-org',
      ownerId: 'user-123',
    },
    isAdmin: true,
    token: 'mock-jwt-token',
    db: mockDb,
    currentClient: {
      isAuthenticated: true,
      scopes: ['api:access'],
    },
    drizzleClient: mockDb,
    log: {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    },
    ...overrides,
  } as GraphQLContext;
  return ctx;
};

/**
 * Mock webhook data from Razorpay
 */
export const createMockWebhookData = (
  event: string = 'payment.captured',
  overrides: Record<string, unknown> = {},
): RazorpayWebhookData => {
  return {
    entity: 'event',
    account_id: 'acc_test123',
    event,
    contains: ['payment'],
    payload: {
      payment: {
        entity: {
          id: 'pay_test123',
          entity: 'payment',
          amount: 100000,
          currency: 'INR',
          status: 'captured',
          order_id: 'order_test123',
          method: 'card',
          amount_refunded: 0,
          refund_status: null,
          captured: true,
          description: 'Test transaction',
          card_id: null,
          bank: null,
          wallet: null,
          vpa: null,
          email: 'test@example.com',
          contact: '+919876543210',
          fee: 2000,
          tax: 360,
          error_code: null,
          error_description: null,
          created_at: Math.floor(Date.now() / 1000),
          ...overrides,
        },
      },
    },
  };
};

/**
 * Utility to create a valid Razorpay signature for testing
 */
export const createValidSignature = (
  orderId: string,
  paymentId: string,
  secret: string = 'webhook_secret_123',
): string => {
  // Use actual crypto to create valid signatures for testing
  const payload = `${orderId}|${paymentId}`;
  return crypto.createHmac('sha256', secret).update(payload).digest('hex');
};

/**
 * Create a valid HMAC signature for webhook payload
 */
export const createWebhookSignature = (
  body: string,
  secret: string,
): string => {
  return crypto.createHmac('sha256', secret).update(body).digest('hex');
};

/**
 * Mock crypto functions for signature verification
 */
export const mockCryptoFunctions = () => {
  const createHmac = vi.fn().mockReturnValue({
    update: vi.fn().mockReturnThis(),
    digest: vi.fn().mockReturnValue('valid_signature_hash'),
  });

  return {
    createHmac,
  };
};
