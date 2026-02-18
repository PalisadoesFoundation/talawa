import { describe, it, expect, vi, beforeEach } from 'vitest';
import {
  logPluginMapRequestResolver,
  clearPluginMapRequestsResolver,
  logPluginMapPollResolver,
  clearPluginMapPollsResolver,
} from '../../../plugins/pluginMap/api/graphql/mutations';
import { TalawaGraphQLError } from '~/src/utilities/TalawaGraphQLError';

import { createMockPluginMapContext } from './utils/testUtils';

let mockCtx: any;

describe('Plugin Map GraphQL Mutations', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    mockCtx = createMockPluginMapContext({
      currentClient: {
        isAuthenticated: true,
        scopes: [],
        user: { id: 'user-1', role: 'admin' },
      } as any,
      userId: 'user-1',
      user: { id: 'user-1', role: 'admin' } as any,
      organizationId: 'org-1',
    });

    // Explicitly setup the drizzle mocks since createMockPluginMapContext provides basic mocks
    // but this test relies on chain behavior defined below.
    const mockDb = mockCtx.drizzleClient;

    // Simpler but robust chaining
    const mockChain = {
      values: vi.fn().mockReturnThis(),
      returning: vi.fn().mockResolvedValue([{ id: 'mock-id', pollNumber: 1 }]),
      where: vi.fn().mockResolvedValue({ rowCount: 5 }),
      from: vi.fn().mockReturnThis(),
      select: vi.fn().mockReturnThis(),
      limit: vi.fn().mockReturnThis(),
      offset: vi.fn().mockReturnThis(),
      orderBy: vi.fn().mockReturnThis(),
    };

    // Chainable methods
    mockDb.insert.mockReturnValue(mockChain);
    mockDb.delete.mockReturnValue(mockChain);
    mockDb.select.mockReturnValue(mockChain);
    mockDb.transaction = vi.fn((callback) => callback(mockDb));

    // For the count check specifically
    // Note: select().from() chain needs to return [{ count: 5 }] or similar when queried
    mockChain.from.mockImplementation((_table) => {
      return Promise.resolve([{ maxPollNumber: 0, count: 5 }]);
    });
  });

  describe('logPluginMapRequestResolver', () => {
    it('should log a request successfully', async () => {
      const result = await logPluginMapRequestResolver(
        null,
        { input: { userId: '1', userRole: 'admin', extensionPoint: 'RA1' } },
        mockCtx as any,
      );
      expect(result.id).toBe('mock-id');
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        logPluginMapRequestResolver(
          null,
          { input: { userId: '1', userRole: 'admin', extensionPoint: 'RA1' } },
          mockCtx as any,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle invalid input', async () => {
      const args = { input: { userId: 123 } };
      await expect(
        logPluginMapRequestResolver(null, args as any, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.transaction.mockRejectedValue(
        new Error('DB Error'),
      );
      await expect(
        logPluginMapRequestResolver(
          null,
          { input: { userId: '1', userRole: 'admin', extensionPoint: 'RA1' } },
          mockCtx as any,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('logPluginMapPollResolver', () => {
    it('should log a poll successfully', async () => {
      const result = await logPluginMapPollResolver(
        null,
        { input: { userId: '1', userRole: 'user', extensionPoint: 'RU1' } },
        mockCtx as any,
      );
      expect(result.id).toBe('mock-id');
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        logPluginMapPollResolver(
          null,
          { input: { userId: '1', userRole: 'user', extensionPoint: 'RU1' } },
          mockCtx as any,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle invalid input', async () => {
      const args = { input: { userId: 123 } };
      await expect(
        logPluginMapPollResolver(null, args as any, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.transaction.mockRejectedValue(
        new Error('DB Error'),
      );
      await expect(
        logPluginMapPollResolver(
          null,
          { input: { userId: '1', userRole: 'user', extensionPoint: 'RU1' } },
          mockCtx as any,
        ),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('clearPluginMapRequestsResolver', () => {
    it('should clear requests successfully', async () => {
      const result = await clearPluginMapRequestsResolver(
        null,
        {},
        mockCtx as any,
      );
      expect(result.success).toBe(true);
      expect(result.clearedCount).toBe(5);
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        clearPluginMapRequestsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should throw error when unauthorized (not admin)', async () => {
      mockCtx.currentClient.user.role = 'user';
      await expect(
        clearPluginMapRequestsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow('Unauthorized');
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.delete.mockImplementation(() => {
        throw new Error('DB Error');
      });
      await expect(
        clearPluginMapRequestsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });

  describe('clearPluginMapPollsResolver', () => {
    it('should clear polls successfully', async () => {
      const result = await clearPluginMapPollsResolver(
        null,
        {},
        mockCtx as any,
      );
      expect(result.success).toBe(true);
    });

    it('should throw error when unauthenticated', async () => {
      mockCtx.currentClient.isAuthenticated = false;
      await expect(
        clearPluginMapPollsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });

    it('should throw error when unauthorized (not admin)', async () => {
      mockCtx.currentClient.user.role = 'user';
      await expect(
        clearPluginMapPollsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow('Unauthorized');
    });

    it('should handle database error', async () => {
      mockCtx.drizzleClient.delete.mockImplementation(() => {
        throw new Error('DB Error');
      });
      await expect(
        clearPluginMapPollsResolver(null, {}, mockCtx as any),
      ).rejects.toThrow(TalawaGraphQLError);
    });
  });
});
