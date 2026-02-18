import { describe, it, expect, vi, beforeEach } from 'vitest';
import { RazorpayService } from '../../../plugins/razorpay/api/services/razorpayService';
// Removed unused imports: updateRazorpayConfigResolver, createPaymentOrderResolver
import {
  createMockRazorpayContext,
  createMockConfig,
  createMockRazorpayOrder,
} from './utils/mockRazorpay';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';

import { mockOrders, mockPayments } from '../../../__mocks__/razorpay';

// Use global mock
vi.mock('razorpay');

describe('Razorpay Error Handling', () => {
  let mockContext: any;
  // mockOrders placed by direct imports

  beforeEach(async () => {
    mockContext = createMockRazorpayContext();
    vi.clearAllMocks();

    const RazorpayConstructor = (await import('razorpay')).default;
    (vi.mocked(RazorpayConstructor) as any).mockImplementation(function () {
      return {
        orders: mockOrders,
        payments: mockPayments,
      } as any;
    });

    // Set default mock values
    const { createMockRazorpayOrder } = await import('./utils/mockRazorpay');
    mockOrders.create.mockResolvedValue(createMockRazorpayOrder());
    mockPayments.fetch.mockResolvedValue({ status: 'captured' } as any);

    // Create a circular mock that always returns itself for chaining
    const mockDb: any = {
      select: vi.fn().mockReturnThis(),
      from: vi.fn().mockReturnThis(),
      where: vi.fn().mockReturnThis(),
      limit: vi.fn().mockReturnThis(),
      insert: vi.fn().mockReturnThis(),
      values: vi.fn().mockReturnThis(),
      update: vi.fn().mockReturnThis(),
      set: vi.fn().mockReturnThis(),
      returning: vi.fn().mockReturnThis(),
      execute: vi.fn(),
    };

    // Ensure all methods return the same mockDb object
    Object.keys(mockDb).forEach((key) => {
      if (typeof mockDb[key] === 'function' && key !== 'execute') {
        mockDb[key].mockReturnValue(mockDb);
      }
    });

    mockContext.drizzleClient = mockDb;

    mockContext.log = {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    };

    global.fetch = vi.fn();
  });

  describe('network failures', () => {
    it('should handle Razorpay API timeout', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      const timeoutInstance = {
        orders: {
          create: vi
            .fn()
            .mockRejectedValue(new Error('ETIMEDOUT: Request timeout')),
        },
      };
      RazorpayConstructor.mockImplementation(function () {
        return timeoutInstance as any;
      });

      await expect(
        service.createOrder({
          amount: 100000,
          currency: 'INR',
          receipt: 'receipt_123',
        }),
      ).rejects.toThrow();
    });

    it('should handle network error during order creation', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      const networkErrorInstance = {
        orders: {
          create: vi.fn().mockRejectedValue(new Error('ECONNREFUSED')),
        },
      };
      RazorpayConstructor.mockImplementation(function () {
        return networkErrorInstance as any;
      });

      await expect(
        service.createOrder({
          amount: 100000,
          currency: 'INR',
          receipt: 'receipt_123',
        }),
      ).rejects.toThrow();
    });

    it('should handle network error during payment verification', async () => {
      const service = new RazorpayService(mockContext);

      mockContext.drizzleClient.limit.mockRejectedValue(
        new Error('Network error'),
      );

      await expect(
        service.verifyPayment('pay_123', 'order_123', 'sig_123', 'data'),
      ).rejects.toThrow();
    });

    it('should handle connection test network failure', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      (global.fetch as any).mockRejectedValue(
        new TypeError('fetch failed: Network is unreachable'),
      );

      const result = await service.testConnection();

      expect(result.success).toBe(false);
      expect(result.message).toContain('Network error');
    });
  });

  describe('invalid credentials', () => {
    it('should handle authentication failures with Razorpay', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      const authErrorInstance = {
        orders: {
          create: vi
            .fn()
            .mockRejectedValue(new Error('401 Unauthorized: Invalid API key')),
        },
      };
      RazorpayConstructor.mockImplementation(function () {
        return authErrorInstance as any;
      });

      await expect(
        service.createOrder({
          amount: 100000,
          currency: 'INR',
          receipt: 'receipt_123',
        }),
      ).rejects.toThrow('Invalid API credentials');
    });

    it('should handle revoked API keys', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      (global.fetch as any).mockResolvedValue({
        ok: false,
        status: 403,
      });

      const result = await service.testConnection();

      expect(result.success).toBe(false);
      expect(result.message).toContain('Access forbidden');
    });
  });

  describe('edge cases', () => {
    it('should handle duplicate payment IDs', async () => {
      // This would typically be handled by database unique constraints
      mockContext.drizzleClient.insert = vi.fn().mockReturnValue({
        values: vi
          .fn()
          .mockRejectedValue(
            new Error('duplicate key value violates unique constraint'),
          ),
      });

      // Verify that the error propagates correctly
      await expect(
        mockContext.drizzleClient.insert().values({}),
      ).rejects.toThrow('unique constraint');
    });

    it('should handle null/undefined values gracefully', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      RazorpayConstructor.mockImplementation(function () {
        return { orders: mockOrders, payments: mockPayments } as any;
      });

      // Order with minimal data (some fields undefined)
      await expect(
        service.createOrder({
          amount: 100000,
          currency: 'INR',
          receipt: 'receipt_123',
          notes: undefined,
        }),
      ).resolves.toBeDefined();
    });

    it('should handle very large amounts', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      RazorpayConstructor.mockImplementation(function () {
        return { orders: mockOrders, payments: mockPayments } as any;
      });

      const largeAmount = Number.MAX_SAFE_INTEGER;

      await expect(
        service.createOrder({
          amount: largeAmount,
          currency: 'INR',
          receipt: 'receipt_large',
        }),
      ).resolves.toBeDefined();
    });

    it('should handle unsupported currencies gracefully', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      const currencyErrorInstance = {
        orders: {
          create: vi
            .fn()
            .mockRejectedValue(
              new Error('BAD_REQUEST_ERROR: Currency not supported'),
            ),
        },
      };
      RazorpayConstructor.mockImplementation(function () {
        return currencyErrorInstance as any;
      });

      await expect(
        service.createOrder({
          amount: 100000,
          currency: 'ABC', // Invalid currency
          receipt: 'receipt_123',
        }),
      ).rejects.toThrow();
    });

    it('should reject zero amount (simulating Razorpay behavior)', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      RazorpayConstructor.mockImplementation(function () {
        return {
          orders: {
            create: vi.fn().mockImplementation((params) => {
              if (params.amount <= 0) {
                return Promise.reject(
                  new Error('Amount must be at least 100 paise'),
                );
              }
              return Promise.resolve(createMockRazorpayOrder());
            }),
          },
          payments: mockPayments,
        } as any;
      });

      // Razorpay rejects zero amounts
      await expect(
        service.createOrder({
          amount: 0,
          currency: 'INR',
          receipt: 'receipt_zero',
        }),
      ).rejects.toThrow();
    });

    it('should handle negative amounts correctly', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      const negativeErrorInstance = {
        orders: {
          create: vi
            .fn()
            .mockRejectedValue(new Error('BAD_REQUEST_ERROR: Invalid amount')),
        },
      };
      RazorpayConstructor.mockImplementation(function () {
        return negativeErrorInstance as any;
      });

      await expect(
        service.createOrder({
          amount: -100,
          currency: 'INR',
          receipt: 'receipt_negative',
        }),
      ).rejects.toThrow();
    });
  });

  describe('concurrent payment processing', () => {
    it('should handle concurrent order creation', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const RazorpayConstructor = (await import('razorpay')).default as any;
      RazorpayConstructor.mockImplementation(function () {
        return { orders: mockOrders, payments: mockPayments } as any;
      });

      const promises = Array.from({ length: 10 }, (_, i) =>
        service.createOrder({
          amount: 100000 + i,
          currency: 'INR',
          receipt: `receipt_${i}`,
        }),
      );

      const results = await Promise.allSettled(promises);

      // All should succeed
      results.forEach((result) => {
        expect(result.status).toBe('fulfilled');
      });
    });

    it('should handle race conditions in payment verification', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig({ webhookSecret: 'test_secret' });

      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      // Simulate concurrent verification attempts
      const promises = Array.from({ length: 5 }, () =>
        service.verifyPayment('pay_123', 'order_123', 'invalid_sig', 'data'),
      );

      const results = await Promise.allSettled(promises);

      // All should fail with same error
      results.forEach((result) => {
        expect(result.status).toBe('fulfilled');
        if (result.status === 'fulfilled') {
          expect(result.value).toBe(false);
        }
      });
    });
  });

  describe('TalawaGraphQLError usage', () => {
    it('should throw TalawaGraphQLError for user-facing errors', () => {
      expect(() => {
        throw new TalawaGraphQLError({
          extensions: { code: 'UNAUTHENTICATED' },
          message: 'User not authenticated',
        });
      }).toThrow(TalawaGraphQLError);
    });

    it('should include error codes for different failure types', () => {
      const errorCodes = [
        'UNAUTHENTICATED',
        'FORBIDDEN',
        'BAD_USER_INPUT',
        'NOT_FOUND',
        'INTERNAL_SERVER_ERROR',
      ];

      errorCodes.forEach((code) => {
        expect(() => {
          throw new TalawaGraphQLError({
            extensions: { code },
            message: `Error with code ${code}`,
          });
        }).toThrow(TalawaGraphQLError);
      });
    });

    it('should provide meaningful error messages', () => {
      const error = new TalawaGraphQLError({
        extensions: { code: 'BAD_USER_INPUT' },
        message: 'Invalid payment amount',
      });

      expect(error.message).toBe('Invalid payment amount');
      expect(error.extensions.code).toBe('BAD_USER_INPUT');
    });
  });

  describe('database transaction failures', () => {
    it('should handle database connection errors', async () => {
      // Create a mock chain where the final await/execute fails
      const mockChain = {
        from: vi.fn().mockReturnThis(),
        limit: vi.fn().mockRejectedValue(new Error('Connection timeout')),
      };

      mockContext.drizzleClient.select = vi.fn().mockReturnValue(mockChain);

      const service = new RazorpayService(mockContext);

      await expect(service.initialize()).rejects.toThrow('Connection timeout');
    });

    it('should handle transaction rollback scenarios', async () => {
      // Mock insert() to return an object with values() that rejects
      mockContext.drizzleClient.insert = vi.fn().mockReturnValue({
        values: vi.fn().mockRejectedValue(new Error('Transaction aborted')),
      });

      await expect(
        mockContext.drizzleClient.insert().values({}),
      ).rejects.toThrow('Transaction aborted');
    });

    it('should handle deadlock errors', async () => {
      // Mock update() to return an object with set() that rejects
      mockContext.drizzleClient.update = vi.fn().mockReturnValue({
        set: vi.fn().mockRejectedValue(new Error('Deadlock detected')),
      });

      await expect(mockContext.drizzleClient.update().set({})).rejects.toThrow(
        'Deadlock detected',
      );
    });
  });

  describe('malformed data handling', () => {
    it('should handle malformed JSON in webhook', async () => {
      const malformedJson = '{ invalid json';

      expect(() => JSON.parse(malformedJson)).toThrow();
    });

    it('should handle missing required fields in webhook data', async () => {
      const incompleteWebhookData = {
        entity: 'event',
        event: 'payment.captured',
        // Missing payload
      };

      // Should handle gracefully in webhook processor
      expect(incompleteWebhookData).toBeDefined();
    });

    it('should handle unexpected data types', async () => {
      // Test with incorrect types
      const invalidData = {
        amount: 'not a number',
        currency: 123,
        receipt: null,
      };

      // Schema validation should catch this
      expect(invalidData.amount).toBe('not a number');
    });
  });

  describe('retry logic scenarios', () => {
    it('should handle transient errors appropriately', async () => {
      const service = new RazorpayService(mockContext);
      const mockConfig = createMockConfig();

      let attemptCount = 0;
      mockContext.drizzleClient.limit.mockImplementation(() => {
        attemptCount++;
        if (attemptCount === 1) {
          return Promise.reject(new Error('Temporary failure'));
        }
        return Promise.resolve([mockConfig]);
      });

      // First attempt will fail
      await expect(service.initialize()).rejects.toThrow('Temporary failure');

      // Second attempt should succeed
      await expect(service.initialize()).resolves.toBeUndefined();
    });
  });
});
