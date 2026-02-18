import { describe, it, expect, vi, beforeEach, type Mock } from 'vitest';
import {
  handleRazorpayWebhook,
  type PluginRequest,
  type PluginReply,
} from '../../../plugins/razorpay/api/index';
import {
  createMockRazorpayContext,
  createMockConfig,
  createMockOrder,
  createMockTransaction,
  createMockWebhookData,
  createWebhookSignature,
} from './utils/mockRazorpay';
import {
  configTable,
  ordersTable,
  transactionsTable,
} from '../../../plugins/razorpay/api/database/tables';

// Define a strict mock type for Reply that satisfies PluginReply
interface TestReply extends PluginReply {
  status: Mock<(code: number) => { send: Mock<(data: unknown) => void> }>;
}

// Helper to create a fresh mock reply that matches TestReply
const createMockReply = (): TestReply => {
  const send = vi.fn();
  const status = vi.fn().mockReturnValue({ send });
  return { status, send } as unknown as TestReply;
};

// Define a strict mock type for Request that satisfies PluginRequest
// We strictly override pluginContext to match our mock's capability plus required fields
interface TestRequest extends PluginRequest {
  pluginContext: PluginRequest['pluginContext'] &
    ReturnType<typeof createMockRazorpayContext>;
}

describe('Razorpay Webhook Handler', () => {
  let mockContext: ReturnType<typeof createMockRazorpayContext>;
  let mockRequest: TestRequest;
  let mockReply: TestReply;
  const secret = 'webhook_secret_123';

  beforeEach(() => {
    // Create base mocks
    const baseContext = createMockRazorpayContext();

    // Align mockContext with PluginRequest expectations
    // PluginRequest expects 'db' and 'logger', our mock has 'drizzleClient' and 'log'
    const contextWithAliases = {
      ...baseContext,
      db: baseContext.drizzleClient,
      logger: baseContext.log,
    };

    mockContext = baseContext; // Keep ref to base for assertions

    // Assemble strict TestRequest without any leftovers from MockFastifyRequest
    mockRequest = {
      pluginContext:
        contextWithAliases as unknown as TestRequest['pluginContext'],
      organizationId: 'org-123',
      headers: {},
      body: {} as PluginRequest['body'],
    };

    mockReply = createMockReply();

    vi.clearAllMocks();

    // Default mock behavior
    mockContext.drizzleClient.insert = vi.fn().mockReturnValue({
      values: vi.fn().mockResolvedValue({}),
    });
    mockContext.drizzleClient.update = vi.fn().mockReturnValue({
      set: vi.fn().mockReturnValue({
        where: vi.fn().mockResolvedValue({}),
      }),
    });
    // Use 'unknown' for table argument to avoid 'any' lint warning
    mockContext.drizzleClient.from = vi
      .fn()
      .mockImplementation((_table: unknown) => ({
        where: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue([]),
      }));
  });

  describe('signature verification', () => {
    it('should accept valid webhook signature', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const mockOrder = createMockOrder();

      const signature1 = createWebhookSignature(
        JSON.stringify(webhookData),
        secret,
      );

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': signature1 };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        if (table === ordersTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockOrder]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      // Assert using the mocked status function directly
      expect(mockReply.status).toHaveBeenCalledWith(200);
    });

    it('should reject invalid webhook signature', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: 'test_secret' });

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': 'invalid_signature' };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(400);
    });

    it('should reject webhook with missing signature', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      mockRequest.body = webhookData;
      mockRequest.headers = {};

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(400);
    });

    it('should handle missing webhook secret in config', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: null });

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': 'some_signature' };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(404);
    });
  });

  describe('event processing', () => {
    let validSignature: string;

    beforeEach(() => {
      const webhookData = createMockWebhookData('payment.captured');
      const webhookBody = JSON.stringify(webhookData);
      validSignature = createWebhookSignature(webhookBody, secret);
    });

    it('should process payment.captured event', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const mockOrder = createMockOrder();

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': validSignature };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        if (table === ordersTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockOrder]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockContext.drizzleClient.insert).toHaveBeenCalledWith(
        transactionsTable,
      );
      expect(mockReply.status).toHaveBeenCalledWith(200);
    });

    it('should process payment.failed event', async () => {
      const webhookData = createMockWebhookData('payment.failed', {
        status: 'failed',
        captured: false,
        error_code: 'BAD_REQUEST_ERROR',
        error_description: 'Payment failed',
      });
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const mockOrder = createMockOrder();

      const webhookBody = JSON.stringify(webhookData);
      const signature = createWebhookSignature(webhookBody, secret);

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': signature };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        if (table === ordersTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockOrder]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(200);
    });

    it('should handle unknown event types gracefully', async () => {
      const webhookData = createMockWebhookData('payment.unknown_event');
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const mockOrder = createMockOrder();

      const signature = createWebhookSignature(
        JSON.stringify(webhookData),
        secret,
      );

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': signature };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        if (table === ordersTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockOrder]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(200);
    });
  });

  describe('database updates', () => {
    it('should update existing transaction', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const mockOrder = createMockOrder();
      const mockTransaction = createMockTransaction();

      const signature = createWebhookSignature(
        JSON.stringify(webhookData),
        secret,
      );

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': signature };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        if (table === ordersTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockOrder]),
          };
        if (table === transactionsTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockTransaction]),
          };
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([]),
        };
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockContext.drizzleClient.update).toHaveBeenCalledWith(
        transactionsTable,
      );
    });

    it('should handle database errors gracefully', async () => {
      const webhookData = createMockWebhookData('payment.captured');
      const mockConfig = createMockConfig({ webhookSecret: secret });
      const signature = createWebhookSignature(
        JSON.stringify(webhookData),
        secret,
      );

      mockRequest.body = webhookData;
      mockRequest.headers = { 'x-razorpay-signature': signature };

      mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
        if (table === configTable)
          return {
            where: vi.fn().mockReturnThis(),
            limit: vi.fn().mockResolvedValue([mockConfig]),
          };
        throw new Error('Database error');
      });

      await handleRazorpayWebhook(mockRequest, mockReply);

      expect(mockReply.status).toHaveBeenCalledWith(500);
    });
  });

  it('should handle missing order gracefully', async () => {
    const webhookData = createMockWebhookData('payment.captured');
    const mockConfig = createMockConfig({ webhookSecret: secret });
    const signature = createWebhookSignature(
      JSON.stringify(webhookData),
      secret,
    );

    mockRequest.body = webhookData;
    mockRequest.headers = { 'x-razorpay-signature': signature };

    mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
      if (table === configTable)
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([mockConfig]),
        };
      return {
        where: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue([]),
      };
    });

    await handleRazorpayWebhook(mockRequest, mockReply);

    expect(mockReply.status).toHaveBeenCalledWith(400);
  });

  it('should handle concurrent webhook processing', async () => {
    const mockConfig = createMockConfig({ webhookSecret: secret });

    const payload1 = {
      payload: {
        payment: {
          entity: {
            id: 'pay_1',
            order_id: 'order_1',
            status: 'captured',
            amount: 50000,
            currency: 'INR',
            captured: true,
            created_at: 1234567890,
          },
        },
      },
    };
    const signature1 = createWebhookSignature(JSON.stringify(payload1), secret);

    const payload2 = {
      payload: {
        payment: {
          entity: {
            id: 'pay_2',
            order_id: 'order_1',
            status: 'captured',
            amount: 50000,
            currency: 'INR',
            captured: true,
            created_at: 1234567890,
          },
        },
      },
    };

    // Construct valid TestRequests
    const mockRequest1: TestRequest = {
      ...mockRequest,
      headers: { 'x-razorpay-signature': signature1 },
      body: payload1 as unknown as PluginRequest['body'],
    };

    const mockRequest2: TestRequest = {
      ...mockRequest,
      headers: {}, // Missing signature
      body: payload2 as unknown as PluginRequest['body'],
    };

    const mockReply1 = createMockReply();
    const mockReply2 = createMockReply();

    const mockOrder = {
      ...createMockOrder(),
      id: 'order_1',
      razorpayOrderId: 'order_1',
    };

    mockContext.drizzleClient.from.mockImplementation((table: unknown) => {
      if (table === configTable)
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([mockConfig]),
        };
      if (table === ordersTable)
        return {
          where: vi.fn().mockReturnThis(),
          limit: vi.fn().mockResolvedValue([mockOrder]),
        };
      return {
        where: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue([]),
      };
    });

    await Promise.all([
      handleRazorpayWebhook(mockRequest1, mockReply1),
      handleRazorpayWebhook(mockRequest2, mockReply2),
    ]);

    expect(mockReply1.status).toHaveBeenCalledWith(200);
    expect(mockReply2.status).toHaveBeenCalledWith(400);
  });
});
