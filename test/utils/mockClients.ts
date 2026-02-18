import { vi } from 'vitest';

// Define minimal interfaces for Fastify types to avoid hard dependency if not present
export interface MockFastifyRequest {
  id: string;
  params: Record<string, any>;
  query: Record<string, any>;
  body: any;
  headers: Record<string, string>;
  ip: string;
  log: any;
  user?: any;
  [key: string]: any;
}

export interface MockFastifyReply {
  code: (statusCode: number) => MockFastifyReply;
  status: (statusCode: number) => MockFastifyReply;
  send: (payload?: any) => MockFastifyReply;
  header: (key: string, value: string) => MockFastifyReply;
  redirect: (url: string) => void;
  [key: string]: any;
}

export interface MockGraphQLClient {
  query: any;
  mutate: any;
}

export interface MockPaymentGateway {
  processPayment: any;
  createRefund: any;
  verifyWebhook: any;
}

/**
 * Creates a mock Fastify request.
 */
export const createMockFastifyRequest = (
  overrides: Partial<MockFastifyRequest> = {},
): MockFastifyRequest => {
  return {
    id: 'req-123',
    params: {},
    query: {},
    body: {},
    headers: {},
    ip: '127.0.0.1',
    log: {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    },
    ...overrides,
  };
};

/**
 * Creates a mock Fastify reply.
 */
export const createMockFastifyReply = (): MockFastifyReply => {
  const codeMock = vi.fn().mockReturnThis();
  const reply: MockFastifyReply = {
    code: codeMock,
    status: codeMock,
    send: vi.fn().mockReturnThis(),
    header: vi.fn().mockReturnThis(),
    redirect: vi.fn(),
  };
  return reply;
};

/**
 * Creates a mock GraphQL client.
 */
export const createMockGraphQLClient = (
  overrides: Partial<MockGraphQLClient> = {},
): MockGraphQLClient => {
  return {
    query: vi.fn().mockResolvedValue({ data: {} }),
    mutate: vi.fn().mockResolvedValue({ data: {} }),
    ...overrides,
  };
};

/**
 * Creates a mock payment gateway (generic).
 */
export const createMockPaymentGateway = (
  overrides: Partial<MockPaymentGateway> = {},
): MockPaymentGateway => {
  return {
    processPayment: vi.fn().mockResolvedValue({ success: true, id: 'pay-123' }),
    createRefund: vi.fn().mockResolvedValue({ success: true, id: 'ref-123' }),
    verifyWebhook: vi.fn().mockReturnValue(true),
    ...overrides,
  };
};
