import React, { ReactNode } from 'react';
import { MockedResponse } from '@apollo/client/testing';
import { MockedProvider } from '@apollo/client/testing/react';
import * as RRD from 'react-router-dom';
const { MemoryRouter, Routes, Route } = RRD;
import { render, RenderOptions, act } from '@testing-library/react';
import { InMemoryCache } from '@apollo/client';
import type { DocumentNode } from 'graphql';
import { I18nextProvider } from 'react-i18next';
import i18n from '../../../../utils/i18nForTests';

/**
 * Test wrapper that provides Apollo MockedProvider and MemoryRouter
 */
const TestWrapper: React.FC<{
  children: ReactNode;
  mocks: MockedResponse[];
  initialEntries?: string[];
  path?: string;
}> = ({ children, mocks, initialEntries = ['/'], path = '/' }) => {
  // Apollo v4 always adds __typename; mocks must include __typename fields
  const cache = new InMemoryCache();

  return (
    <I18nextProvider i18n={i18n}>
      <MockedProvider mocks={mocks} cache={cache}>
        <MemoryRouter initialEntries={initialEntries}>
          <Routes>
            <Route path={path} element={children} />
          </Routes>
        </MemoryRouter>
      </MockedProvider>
    </I18nextProvider>
  );
};

/**
 * Custom render function that wraps components with test providers
 */
export const renderWithProviders = (
  ui: React.ReactElement,
  options: {
    mocks?: MockedResponse[];
    initialEntries?: string[];
    path?: string;
  } & Omit<RenderOptions, 'wrapper'> = {},
) => {
  const { mocks = [], initialEntries, path, ...renderOptions } = options;

  const Wrapper = ({ children }: { children: ReactNode }) => (
    <TestWrapper mocks={mocks} initialEntries={initialEntries} path={path}>
      {children}
    </TestWrapper>
  );

  return render(ui, { wrapper: Wrapper, ...renderOptions });
};

// GraphQL Query Definitions (matching the actual components)
import {
  GET_CURRENT_USER,
  GET_ORGANIZATION_INFO,
  GET_RAZORPAY_CONFIG,
  GET_RAZORPAY_CONFIG_PUBLIC,
  CREATE_PAYMENT_ORDER,
  VERIFY_PAYMENT,
  UPDATE_RAZORPAY_CONFIG,
  TEST_RAZORPAY_SETUP,
  GET_USER_TRANSACTIONS,
  GET_USER_TRANSACTION_STATS,
  GET_ORG_TRANSACTIONS,
  GET_ORG_TRANSACTION_STATS,
} from '../../../../plugins/razorpay/admin/graphql/queries';

export {
  GET_CURRENT_USER,
  GET_ORGANIZATION_INFO,
  GET_RAZORPAY_CONFIG,
  GET_RAZORPAY_CONFIG_PUBLIC,
  CREATE_PAYMENT_ORDER,
  VERIFY_PAYMENT,
  UPDATE_RAZORPAY_CONFIG,
  TEST_RAZORPAY_SETUP,
  GET_USER_TRANSACTIONS,
  GET_USER_TRANSACTION_STATS,
  GET_ORG_TRANSACTIONS,
  GET_ORG_TRANSACTION_STATS,
};

// Mock Data Factories
export const createMockUser = (overrides = {}) => ({
  id: 'user-123',
  firstName: 'John',
  lastName: 'Doe',
  email: 'john.doe@example.com',
  __typename: 'User',
  ...overrides,
});
export const createMockOrganization = (overrides = {}) => ({
  id: 'org-123',
  name: 'Test Organization',
  description: 'A test organization for donations',
  avatarURL: 'https://example.com/avatar.png',
  __typename: 'Organization',
  ...overrides,
});
export const createMockRazorpayConfig = (overrides = {}) => ({
  keyId: 'rzp_test_abc123',
  keySecret: 'secret123',
  webhookSecret: 'webhook_secret_123',
  isEnabled: true,
  testMode: true,
  currency: 'INR',
  description: 'Donation to organization',
  __typename: 'RazorpayConfig',
  ...overrides,
});
export const createMockPaymentOrder = (overrides = {}) => ({
  id: 'order-123',
  razorpayOrderId: 'order_abc123',
  organizationId: 'org-123',
  userId: 'user-123',
  amount: 10000, // 100 INR in paise
  currency: 'INR',
  status: 'created',
  donorName: 'John Doe',
  donorEmail: 'john.doe@example.com',
  donorPhone: '+919876543210',
  description: 'Donation to Test Organization',
  createdAt: new Date().toISOString(),
  updatedAt: new Date().toISOString(),
  __typename: 'RazorpayOrder',
  ...overrides,
});
export const createMockTransaction = (overrides = {}) => ({
  id: 'txn-123',
  paymentId: 'pay_abc123',
  orderId: 'order_abc123',
  amount: 10000, // 100 INR in paise
  currency: 'INR',
  status: 'captured',
  donorName: 'John Doe',
  donorEmail: 'john.doe@example.com',
  method: 'card',
  bank: null,
  wallet: null,
  vpa: null,
  email: 'john.doe@example.com',
  contact: '+919876543210',
  fee: 236,
  tax: 36,
  errorCode: null,
  errorDescription: null,
  refundStatus: null,
  capturedAt: new Date().toISOString(),
  createdAt: new Date().toISOString(),
  updatedAt: new Date().toISOString(),
  __typename: 'RazorpayTransaction',
  ...overrides,
});
export const createMockTransactionStats = (overrides = {}) => ({
  totalTransactions: 10,
  totalAmount: 100000, // 1000 INR in paise
  currency: 'INR',
  successfulTransactions: 8,
  failedTransactions: 1,
  averageTransactionAmount: 10000, // 100000 / 10
  __typename: 'RazorpayTransactionStats',
  ...overrides,
}); // Mock Response Factories for GraphQL
export const createUserQueryMock = (user = createMockUser()) => ({
  request: {
    query: GET_CURRENT_USER,
  },
  result: {
    data: {
      me: user,
    },
  },
});
export const createOrganizationQueryMock = (
  orgId: string,
  organization = createMockOrganization(),
) => ({
  request: {
    query: GET_ORGANIZATION_INFO,
    variables: { orgId },
  },
  result: {
    data: {
      organization,
    },
  },
});
export const createRazorpayConfigQueryMock = (
  config = createMockRazorpayConfig(),
) => ({
  request: {
    query: GET_RAZORPAY_CONFIG,
  },
  result: {
    data: {
      razorpay_getRazorpayConfig: config,
    },
  },
});
export const createRazorpayConfigPublicQueryMock = (
  config = createMockRazorpayConfig(),
) => ({
  request: {
    query: GET_RAZORPAY_CONFIG_PUBLIC,
    variables: {},
  },
  result: {
    data: {
      razorpay_getRazorpayConfig: {
        ...config,
        __typename: 'RazorpayConfig',
      },
    },
  },
});
export const createPaymentOrderMutationMock = (
  order = createMockPaymentOrder(),
) => ({
  request: {
    query: CREATE_PAYMENT_ORDER,
  },
  result: {
    data: {
      razorpay_createPaymentOrder: order,
    },
  },
});
export const createVerifyPaymentMutationMock = (success = true) => ({
  request: {
    query: VERIFY_PAYMENT,
  },
  result: {
    data: {
      razorpay_verifyPayment: {
        success,
        message: success
          ? 'Payment verified successfully'
          : 'Verification failed',
        transaction: success
          ? {
              paymentId: 'pay_abc123',
              status: 'captured',
              amount: 10000,
              currency: 'INR',
            }
          : null,
      },
    },
  },
});
export const createUpdateConfigMutationMock = (
  config = createMockRazorpayConfig(),
) => ({
  request: {
    query: UPDATE_RAZORPAY_CONFIG,
  },
  result: {
    data: {
      razorpay_updateRazorpayConfig: config,
    },
  },
});
export const createTestSetupMutationMock = (success = true) => ({
  request: {
    query: TEST_RAZORPAY_SETUP,
  },
  result: {
    data: {
      razorpay_testRazorpaySetup: {
        success,
        message: success
          ? 'Setup test successful'
          : 'Setup test failed: Invalid credentials',
      },
    },
  },
});
export const createUserTransactionsQueryMock = (
  userId: string,
  transactions = [createMockTransaction()],
) => ({
  request: {
    query: GET_USER_TRANSACTIONS,
    variables: {
      userId,
      limit: 100,
    },
  },
  result: {
    data: {
      razorpay_getUserTransactions: transactions,
    },
  },
});
export const createUserTransactionStatsQueryMock = (
  userId: string,
  stats = createMockTransactionStats(),
) => ({
  request: {
    query: GET_USER_TRANSACTION_STATS,
    variables: {
      userId,
    },
  },
  result: {
    data: {
      razorpay_getUserTransactionStats: stats,
    },
  },
});
export const createOrgTransactionsQueryMock = (
  orgId: string,
  transactions = [createMockTransaction()],
) => ({
  request: {
    query: GET_ORG_TRANSACTIONS,
    variables: {
      orgId,
      limit: 10,
    },
  },
  result: {
    data: {
      razorpay_getOrganizationTransactions: transactions,
    },
  },
});
export const createOrgTransactionStatsQueryMock = (
  orgId: string,
  stats = createMockTransactionStats(),
) => ({
  request: {
    query: GET_ORG_TRANSACTION_STATS,
    variables: {
      orgId,
    },
  },
  result: {
    data: {
      razorpay_getOrganizationTransactionStats: stats,
    },
  },
});

// Error Mock Factories
export const createErrorMock = (
  query: DocumentNode,
  variablesOrMessage?: Record<string, unknown> | string,
  errorMessage = 'An error occurred',
) => {
  const variables =
    typeof variablesOrMessage === 'object'
      ? (variablesOrMessage as Record<string, unknown>)
      : undefined;
  const message =
    typeof variablesOrMessage === 'string' ? variablesOrMessage : errorMessage;

  return {
    request: {
      query,
      variables,
    },
    error: new Error(message),
  };
};

/**
 * Flushes pending promises by yielding to the microtask/macrotask queue.
 * Note: This only yields control to allow pending async operations to complete,
 * it does not poll for or wait on actual loading state indicators.
 */
export const flushPromises = async () => {
  await act(async () => {
    await new Promise((resolve) => setTimeout(resolve, 0));
  });
};
