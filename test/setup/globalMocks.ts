// These mocks allow plugin tests to run standalone in talawa-plugin repo
import { vi, type Mock } from 'vitest';

// Debug log removed

// Mock ResizeObserver
global.ResizeObserver = class ResizeObserver {
  observe() {}
  unobserve() {}
  disconnect() {}
};

interface MockBuilder {
  queryType: Mock;
  mutationType: Mock;
  objectRef: Mock;
  objectType: Mock;
  inputType: Mock;
  inputRef: Mock;
  field: Mock;
  fields: Mock;
  queryField: Mock;
  mutationField: Mock;
}

// Mock GraphQL Builder
export const mockBuilder: MockBuilder = {
  queryType: vi.fn(() => mockBuilder),
  mutationType: vi.fn(() => mockBuilder),
  objectRef: vi.fn(() => ({
    implement: vi.fn(() => mockBuilder),
  })),
  objectType: vi.fn(() => mockBuilder),
  inputType: vi.fn((_name, config) => {
    if (config?.fields && typeof config.fields === 'function') {
      config.fields({
        field: vi.fn(() => mockBuilder),
        arg: vi.fn(() => mockBuilder),
        boolean: vi.fn(() => mockBuilder),
        string: vi.fn(() => mockBuilder),
        int: vi.fn(() => mockBuilder),
        id: vi.fn(() => mockBuilder),
      });
    }
    return mockBuilder;
  }),
  inputRef: vi.fn(() => ({
    implement: vi.fn((config) => {
      if (config?.fields && typeof config.fields === 'function') {
        config.fields({
          field: vi.fn(() => mockBuilder),
          arg: vi.fn(() => mockBuilder),
          boolean: vi.fn(() => mockBuilder),
          string: vi.fn(() => mockBuilder),
          int: vi.fn(() => mockBuilder),
          id: vi.fn(() => mockBuilder),
        });
      }
      return mockBuilder;
    }),
  })),
  field: vi.fn(() => mockBuilder),
  fields: vi.fn(() => mockBuilder),
  queryField: vi.fn((_name, cb) => {
    if (typeof cb === 'function')
      cb({
        field: vi.fn(() => mockBuilder),
        arg: vi.fn((config) => {
          if (config?.type && typeof config.type === 'function') {
            try {
              config.type();
            } catch (err: any) {
              console.error('Error in inputType config callback:', err);
              // Ignore callback failure but log it
            }
          }
          return mockBuilder;
        }),
        boolean: vi.fn(() => mockBuilder),
        string: vi.fn(() => mockBuilder),
        int: vi.fn(() => mockBuilder),
        id: vi.fn(() => mockBuilder),
      });
    return mockBuilder;
  }),
  mutationField: vi.fn((_name, cb) => {
    if (typeof cb === 'function')
      cb({
        field: vi.fn(() => mockBuilder),
        arg: vi.fn((config) => {
          if (config?.type && typeof config.type === 'function') {
            try {
              config.type();
            } catch (err: any) {
              console.error('Error in inputType config callback:', err);
              // Ignore callback failure but log it
            }
          }
          return mockBuilder;
        }),
        boolean: vi.fn(() => mockBuilder),
        string: vi.fn(() => mockBuilder),
        int: vi.fn(() => mockBuilder),
        id: vi.fn(() => mockBuilder),
      });
    return mockBuilder;
  }),
};

vi.mock('~/src/graphql/builder', () => ({
  builder: mockBuilder,
}));

// Mock TalawaGraphQLError
export class MockTalawaGraphQLError extends Error {
  extensions: {
    code: string;
    [key: string]: any;
  };

  constructor(
    public error: {
      message?: string;
      extensions: { code: string; [key: string]: any };
    },
  ) {
    super(error.message || 'An error occurred');
    this.name = 'TalawaGraphQLError';
    this.message = error.message || 'An error occurred';
    this.extensions = error.extensions;
  }
}

vi.mock('~/src/utilities/TalawaGraphQLError', () => ({
  TalawaGraphQLError: MockTalawaGraphQLError,
}));

// Mock GraphQL Context (basic structure)
export const createMockGraphQLContext = (overrides: any = {}) => {
  const insertMock = vi.fn().mockReturnThis();
  const updateMock = vi.fn().mockReturnThis();

  // Setup chaining for insert().values() and update().set()
  insertMock.mockReturnValue({
    values: vi.fn().mockResolvedValue({}),
  });

  updateMock.mockReturnValue({
    set: vi.fn().mockReturnValue({
      where: vi.fn().mockResolvedValue({}),
    }),
  });

  return {
    user: {
      id: 'user-123',
      email: 'test@example.com',
      firstName: 'Test',
      lastName: 'User',
      isSuperAdmin: false,
      ...overrides.user,
    },
    userId: overrides.userId || 'user-123',
    currentClient: {
      isAuthenticated: true,
      ...overrides.currentClient,
    },
    organization: {
      id: 'org-123',
      name: 'Test Org',
      ...overrides.organization,
    },
    drizzleClient: {
      select: vi.fn().mockReturnThis(),
      from: vi.fn().mockReturnThis(),
      where: vi.fn().mockReturnThis(),
      limit: vi.fn(),
      insert: insertMock,
      values: vi.fn(), // Keep this for direct calls if any
      update: updateMock,
      set: vi.fn(), // Keep this for direct calls if any
      returning: vi.fn(),
      ...overrides.drizzleClient,
    },
    log: {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
      ...overrides.log,
    },
    isAdmin: overrides.isAdmin ?? false,
    ...overrides,
  };
};

vi.mock('~/src/graphql/context', () => ({
  GraphQLContext: createMockGraphQLContext(),
}));
