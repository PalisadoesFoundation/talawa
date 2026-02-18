import { describe, it, expect, vi, beforeEach } from 'vitest';
import {
  getExtensionPointsOverviewResolver,
  getPluginMapRequestsResolver,
  getPluginMapPollsResolver,
} from '../../../plugins/pluginMap/api/graphql/queries';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';

const mockCtx = {
  currentClient: { isAuthenticated: true },
  userId: 'user-1',
  user: { id: 'user-1', isSuperAdmin: true },
  drizzleClient: {
    select: vi.fn(),
  },
  organizationId: 'org-1',
  log: {
    error: vi.fn(),
    info: vi.fn(),
  },
};

describe('Plugin Map GraphQL Queries', () => {
  beforeEach(() => {
    vi.resetAllMocks();
    mockCtx.currentClient.isAuthenticated = true;

    // Standard mock chain
    const mockChain = {
      from: vi.fn().mockReturnThis(),
      where: vi.fn().mockReturnThis(),
      orderBy: vi.fn().mockReturnThis(),
      limit: vi.fn().mockReturnThis(),
      offset: vi.fn().mockResolvedValue([]),
    };

    mockCtx.drizzleClient.select.mockReturnValue(mockChain);

    // Customize the mock chain behavior to return Promises where appropriate
    // mocking method chains: .from().where().orderBy().limit().offset()

    // Default resolve
    const defaultResolve = Promise.resolve([]);

    // Chain methods return the chain itself (synchronously)
    mockChain.from.mockReturnValue(mockChain);
    mockChain.where.mockReturnValue(mockChain);
    mockChain.orderBy.mockReturnValue(mockChain);
    mockChain.limit.mockReturnValue(mockChain);

    // For offset (final link in many chains), return a Promise
    mockChain.offset.mockReturnValue(defaultResolve);

    // If a query ends without offset, we might need to mock that specific return value
    // But since the query logic uses await on the chain, we need the *last called method* to return a Promise.
    // The previous implementation used .then to catch-all.
    // To replicate catch-all with standard mocks is harder.
    // Instead we'll rely on specific mocks in tests or default "safe" Promise return from `offset`.

    // Count query special handling:
    mockCtx.drizzleClient.select.mockImplementation((args: any) => {
      if (args && args.count) {
        // Return a chain that resolves to count: 0 when awaited
        // Since we can't easily guess which method is last, we make all methods return a Promise-like object?
        // No, simpler to just return a Promise that resolves to [{count:0}] immediately?
        // No, because .from() is called on it.

        const countChain = {
          from: vi.fn(),
          where: vi.fn(),
        };
        const countResult = Promise.resolve([{ count: 0 }]);

        countChain.from.mockReturnValue(countChain);
        countChain.where.mockReturnValue(countResult); // Assuming it ends at where()
        return countChain;
      }
      return mockChain;
    });
  });

  describe('getExtensionPointsOverviewResolver', () => {
    it('should return overview data', async () => {
      const result = await getExtensionPointsOverviewResolver(
        {},
        {},
        mockCtx as any,
      );
      expect(result.extensionPoints).toBeDefined();
      expect(result.extensionPoints.length).toBeGreaterThan(0);
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        getExtensionPointsOverviewResolver({}, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('getPluginMapRequestsResolver', () => {
    it('should fetch requests with pagination', async () => {
      mockCtx.drizzleClient.select
        .mockReturnValue({
          from: vi.fn().mockReturnValue({
            where: vi.fn().mockReturnValue({
              orderBy: vi.fn().mockReturnValue({
                limit: vi.fn().mockReturnValue({
                  offset: vi.fn().mockResolvedValue([{ id: '1' }]),
                }),
              }),
            }),
          }),
        })

        .mockReturnValueOnce({
          from: vi.fn().mockReturnValue({
            where: vi.fn().mockReturnValue({
              orderBy: vi.fn().mockReturnValue({
                limit: vi.fn().mockReturnValue({
                  offset: vi.fn().mockResolvedValue([{ id: '1' }]),
                }),
              }),
            }),
          }),
        })
        .mockReturnValueOnce({
          from: vi.fn().mockReturnValue({
            where: vi.fn().mockResolvedValue([{ count: 1 }]), // Ends at where()
          }),
        });

      const args = {
        input: {
          extensionPoint: 'RA1',
          limit: 10,
          userId: 'user-1',
          userRole: 'admin',
          organizationId: 'org-1',
        },
      };

      const result = await getPluginMapRequestsResolver(
        null,
        args,
        mockCtx as any,
      );
      expect(result.requests.length).toBe(1);
      expect(result.totalCount).toBe(1);
    });

    it('should handle organizationId: null', async () => {
      const result = await getPluginMapRequestsResolver(
        null,
        { input: { organizationId: null } },
        mockCtx as any,
      );
      expect(result.requests).toBeDefined();
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        getPluginMapRequestsResolver({}, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle invalid input', async () => {
      const args = {
        input: {
          userId: 123, // Invalid type for string
        },
      };
      await expect(
        getPluginMapRequestsResolver(null, args as any, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.select.mockImplementation(() => {
        throw new Error('DB Error');
      });
      await expect(
        getPluginMapRequestsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('getPluginMapPollsResolver', () => {
    it('should fetch polls with filters', async () => {
      const args = {
        input: {
          userRole: 'user',
          organizationId: 'org-1',
        },
      };

      const result = await getPluginMapPollsResolver(
        null,
        args,
        mockCtx as any,
      );
      expect(result.polls).toBeDefined();
      expect(result.totalCount).toBeDefined();
    });

    it('should handle organizationId: null', async () => {
      const result = await getPluginMapPollsResolver(
        null,
        { input: { organizationId: null } },
        mockCtx as any,
      );
      expect(result.polls).toBeDefined();
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        getPluginMapPollsResolver({}, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle invalid input', async () => {
      const args = {
        input: {
          userRole: 123, // Invalid type for string
        },
      };
      await expect(
        getPluginMapPollsResolver(null, args as any, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.select.mockImplementation(() => {
        throw new Error('DB Error');
      });
      await expect(
        getPluginMapPollsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle extensionPoint filter', async () => {
      const args = {
        input: {
          extensionPoint: 'RA1',
        },
      };
      const result = await getPluginMapPollsResolver(
        null,
        args,
        mockCtx as any,
      );
      expect(result.polls).toBeDefined();
    });
  });
});
