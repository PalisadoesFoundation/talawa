import { describe, it, expect, vi, beforeEach } from 'vitest';
import {
  getRazorpayConfigResolver,
  getOrganizationTransactionsResolver,
  getUserTransactionsResolver,
  getOrganizationTransactionStatsResolver,
  getUserTransactionStatsResolver,
} from '../../../plugins/razorpay/api/graphql/queries';
import { expectTransaction, expectConfig } from './graphql.queries.helpers';
import {
  createMockRazorpayContext,
  createMockConfig,
  createMockTransaction,
} from './utils/mockRazorpay';

// Mock the Razorpay module
vi.mock('razorpay');
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';

describe('Razorpay GraphQL Queries', () => {
  let mockContext: any;

  beforeEach(() => {
    mockContext = createMockRazorpayContext({
      isAdmin: true,
      user: {
        id: 'user-123',
        // We rely on the default robust mock from createMockRazorpayContext
      },
    });

    // Mock log functions
    mockContext.log = {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    };
  });

  describe('getRazorpayConfigResolver', () => {
    it('should return config for super admin', async () => {
      mockContext.user.isSuperAdmin = true;
      const mockConfig = createMockConfig();
      mockContext.drizzleClient.limit.mockResolvedValue([mockConfig]);

      const result = await getRazorpayConfigResolver({}, {}, mockContext);

      expect(result).toEqual(expectConfig(mockConfig));
      expect(mockContext.drizzleClient.select).toHaveBeenCalled();
    });

    it('should throw error for non-super-admin', async () => {
      mockContext.user.isSuperAdmin = false;

      await expect(
        getRazorpayConfigResolver({}, {}, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should return default config when config not found', async () => {
      mockContext.user = { isSuperAdmin: true } as any;
      mockContext.drizzleClient.limit.mockResolvedValue([]);

      const result = await getRazorpayConfigResolver({}, {}, mockContext);

      // Resolver returns default config when not found
      expect(result).toEqual({
        keyId: '',
        keySecret: '',
        webhookSecret: '',
        isEnabled: false,
        testMode: true,
        currency: 'INR',
        description: 'Donation to organization',
      });
    });

    it('should throw error when user is not authenticated', async () => {
      mockContext.currentClient.isAuthenticated = false;

      await expect(
        getRazorpayConfigResolver({}, {}, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('getOrganizationTransactionsResolver', () => {
    const args = {
      orgId: 'org-123',
      limit: 10,
      offset: 0,
      status: null,
      dateFrom: null,
      dateTo: null,
    };

    it('should return organization transactions for admin', async () => {
      const mockTransactions = [
        createMockTransaction(),
        createMockTransaction({ id: 'transaction-2' }),
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getOrganizationTransactionsResolver(
        {},
        args,
        mockContext,
      );

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should filter by status', async () => {
      const mockTransactions = [createMockTransaction({ status: 'captured' })];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getOrganizationTransactionsResolver(
        {},
        { ...args, status: 'captured' },
        mockContext,
      );

      expect(mockContext.drizzleClient.where).toHaveBeenCalled();
      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should filter by date range', async () => {
      const mockTransactions = [createMockTransaction()];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getOrganizationTransactionsResolver(
        {},
        {
          ...args,
          dateFrom: '2024-01-01',
          dateTo: '2024-12-31',
        },
        mockContext,
      );

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should apply pagination', async () => {
      const mockTransactions = [createMockTransaction()];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      await getOrganizationTransactionsResolver(
        {},
        { ...args, limit: 5, offset: 10 },
        mockContext,
      );

      expect(mockContext.drizzleClient.limit).toHaveBeenCalledWith(5);
      expect(mockContext.drizzleClient.offset).toHaveBeenCalledWith(10);
    });

    it('should throw error for non-admin user', async () => {
      mockContext.isAdmin = false;

      await expect(
        getOrganizationTransactionsResolver({}, args, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should throw error for unauthenticated user', async () => {
      mockContext.currentClient.isAuthenticated = false;

      await expect(
        getOrganizationTransactionsResolver({}, args, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should return empty array when no transactions found', async () => {
      mockContext.drizzleClient.execute.mockResolvedValue([]);

      const result = await getOrganizationTransactionsResolver(
        {},
        args,
        mockContext,
      );

      expect(result).toEqual([]);
    });
  });

  describe('getUserTransactionsResolver', () => {
    const args = {
      userId: 'user-123',
      orgId: null,
      limit: 10,
      offset: 0,
      status: null,
      dateFrom: null,
      dateTo: null,
    };

    it('should return user transactions for own account', async () => {
      const mockTransactions = [createMockTransaction()];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getUserTransactionsResolver({}, args, mockContext);

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should allow admin to view any user transactions', async () => {
      const mockTransactions = [
        createMockTransaction({ userId: 'other-user' }),
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getUserTransactionsResolver(
        {},
        { ...args, userId: 'other-user' },
        mockContext,
      );

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should throw error when non-admin tries to view other user transactions', async () => {
      mockContext.isAdmin = false;

      await expect(
        getUserTransactionsResolver(
          {},
          { ...args, userId: 'other-user' },
          mockContext,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should filter by organization', async () => {
      const mockTransactions = [createMockTransaction()];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getUserTransactionsResolver(
        {},
        { ...args, orgId: 'org-456' },
        mockContext,
      );

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should filter by status and date range', async () => {
      const mockTransactions = [createMockTransaction()];
      mockContext.drizzleClient.execute.mockResolvedValue(mockTransactions);

      const result = await getUserTransactionsResolver(
        {},
        {
          ...args,
          status: 'captured',
          dateFrom: '2024-01-01',
          dateTo: '2024-12-31',
        },
        mockContext,
      );

      expect(result).toEqual(mockTransactions.map(expectTransaction));
    });

    it('should throw error for unauthenticated user', async () => {
      mockContext.currentClient.isAuthenticated = false;

      await expect(
        getUserTransactionsResolver({}, args, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('getOrganizationTransactionStatsResolver', () => {
    const args = {
      orgId: 'org-123',
      dateFrom: null,
      dateTo: null,
    };

    it('should return transaction stats for admin', async () => {
      mockContext.drizzleClient.execute.mockResolvedValue([
        {
          totalTransactions: 10,
          totalAmount: 1000000,
          currency: 'INR',
          successCount: 8,
          failedCount: 1,
          pendingCount: 0,
        },
      ]);

      const result = await getOrganizationTransactionStatsResolver(
        {},
        args,
        mockContext,
      );

      expect(result).toEqual({
        totalTransactions: 10,
        totalAmount: 1000000,
        currency: 'INR',
        successfulTransactions: 8,
        failedTransactions: 1,
        averageTransactionAmount: 100000,
      });
    });

    it('should filter stats by date range', async () => {
      const mockStats = [
        {
          total: 5,
          totalAmount: 500000,
          successful: 5,
          successfulAmount: 500000,
          failed: 0,
          failedAmount: 0,
          pending: 0,
          pendingAmount: 0,
        },
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockStats);

      const result = await getOrganizationTransactionStatsResolver(
        {},
        {
          ...args,
          dateFrom: '2024-01-01',
          dateTo: '2024-12-31',
        },
        mockContext,
      );

      expect(result).toBeDefined();
    });

    it('should throw error for non-admin', async () => {
      mockContext.isAdmin = false;

      await expect(
        getOrganizationTransactionStatsResolver({}, args, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle empty stats', async () => {
      mockContext.drizzleClient.execute.mockResolvedValue([]);

      const result = await getOrganizationTransactionStatsResolver(
        {},
        args,
        mockContext,
      );

      // Should return default stats when no data
      expect(result).toBeDefined();
    });
  });

  describe('getUserTransactionStatsResolver', () => {
    const args = {
      userId: 'user-123',
      dateFrom: undefined,
      dateTo: undefined,
    };

    it('should return user transaction stats', async () => {
      const mockStats = [
        {
          totalTransactions: 5,
          totalAmount: 500000,
          currency: 'INR',
          successfulTransactions: 4,
          failedTransactions: 1,
          averageTransactionAmount: 10000,
        },
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockStats);

      const result = await getUserTransactionStatsResolver(
        {},
        args,
        mockContext,
      );

      expect(result).toBeDefined();
    });

    it('should allow admin to view any user stats', async () => {
      const mockStats = [
        {
          total: 3,
          totalAmount: 300000,
          successful: 3,
          successfulAmount: 300000,
          failed: 0,
          failedAmount: 0,
          pending: 0,
          pendingAmount: 0,
        },
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockStats);

      const result = await getUserTransactionStatsResolver(
        {},
        { ...args, userId: 'other-user' },
        mockContext,
      );

      expect(result).toBeDefined();
    });

    it('should throw error when non-admin tries to view other user stats', async () => {
      mockContext.isAdmin = false;

      await expect(
        getUserTransactionStatsResolver(
          {},
          { ...args, userId: 'other-user' },
          mockContext,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should filter stats by date range', async () => {
      const mockStats = [
        {
          total: 2,
          totalAmount: 200000,
          successful: 2,
          successfulAmount: 200000,
          failed: 0,
          failedAmount: 0,
          pending: 0,
          pendingAmount: 0,
        },
      ];
      mockContext.drizzleClient.execute.mockResolvedValue(mockStats);

      const result = await getUserTransactionStatsResolver(
        {},
        {
          ...args,
          dateFrom: '2024-01-01',
          dateTo: '2024-12-31',
        },
        mockContext,
      );

      expect(result).toBeDefined();
    });

    it('should throw error for unauthenticated user', async () => {
      mockContext.currentClient.isAuthenticated = false;

      await expect(
        getUserTransactionStatsResolver({}, args, mockContext),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });
});
