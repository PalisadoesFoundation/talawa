import { vi } from 'vitest';
import type { GraphQLContext } from '~/src/graphql/context';

/**
 * Mock poll data factory
 */
export const createMockPoll = (overrides: Record<string, any> = {}) => {
  return {
    id: 'poll-123',
    pollNumber: 1,
    userId: 'user-123',
    userRole: 'admin',
    organizationId: 'org-123',
    extensionPoint: 'RA1',
    createdAt: new Date(),
    ...overrides,
  };
};

/**
 * Mock database client for testing
 */
export const createMockDatabaseClient = () => {
  const mockDb: any = {};

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

  mockDb.execute = vi.fn().mockResolvedValue([]);
  mockDb.returning = vi.fn().mockResolvedValue([createMockPoll()]);
  mockDb.transaction = vi.fn((callback) => callback(mockDb));

  return mockDb;
};

/**
 * Mock GraphQL context for Plugin Map
 */
export const createMockPluginMapContext = (
  overrides: Partial<GraphQLContext> = {},
): GraphQLContext => {
  const mockDb = createMockDatabaseClient();

  return {
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
    db: mockDb as any,
    currentClient: {
      isAuthenticated: true,
      scopes: ['api:access'],
    },
    drizzleClient: mockDb as any,
    log: {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    },
    ...overrides,
  } as unknown as GraphQLContext;
};
