/**
 * @vitest-environment jsdom
 */
/**
 * Unit Tests for UserTransactions Component
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor } from '@testing-library/react';

import { MockedResponse } from '@apollo/client/testing';
import UserTransactions from '../../../../plugins/razorpay/admin/pages/UserTransactions';
import {
  renderWithProviders,
  createMockTransaction,
  createMockTransactionStats,
  GET_USER_TRANSACTIONS,
  GET_USER_TRANSACTION_STATS,
} from './testUtils';

// Mock useLocalStorage to provide user ID
// Note: This is now handled by the path alias to __mocks__/useLocalstorage.ts,
// but we can override it here if needed for specific tests using vi.mock('utils/useLocalstorage')

const mockTransactions = [
  createMockTransaction({
    id: 'txn-1',
    paymentId: 'pay_abc123',
    status: 'captured',
    amount: 10000,
    donorName: 'John Doe',
    method: 'card',
  }),
  createMockTransaction({
    id: 'txn-2',
    paymentId: 'pay_def456',
    status: 'failed',
    amount: 5000,
    donorName: 'Jane Smith',
    method: 'upi',
  }),
];

const mockStats = createMockTransactionStats({
  totalTransactions: 2,
  totalAmount: 15000,
});

const standardMocks: MockedResponse[] = [
  {
    request: {
      query: GET_USER_TRANSACTIONS,
      variables: { userId: 'test-user-id', limit: 100 },
    },
    result: {
      data: { razorpay_getUserTransactions: mockTransactions },
    },
  },
  {
    request: {
      query: GET_USER_TRANSACTION_STATS,
      variables: { userId: 'test-user-id' },
    },
    result: {
      data: { razorpay_getUserTransactionStats: mockStats },
    },
  },
];

// Helper function to render UserTransactions with standard mocks and routing
const renderUserTransactions = (mocks = standardMocks) => {
  renderWithProviders(<UserTransactions />, {
    mocks,
    initialEntries: ['/user/razorpay/my-transactions'],
    path: '/user/razorpay/my-transactions',
  });
};

describe('UserTransactions', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  describe('Loading State', () => {
    it('should show loading state while fetching transactions', () => {
      renderUserTransactions();

      // Verify loading state
      expect(screen.getByText('Loading...')).toBeInTheDocument();
    });
  });

  describe('Rendering', () => {
    it('should render transactions page with title', async () => {
      renderWithProviders(<UserTransactions />, {
        mocks: standardMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(screen.getByText('transactions.title')).toBeInTheDocument();
      });
    });

    it('should display transaction data correctly', async () => {
      renderWithProviders(<UserTransactions />, {
        mocks: standardMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(screen.getByText('pay_abc123')).toBeInTheDocument();
      });

      expect(screen.getByText('INR 100.00')).toBeInTheDocument();
      expect(screen.getByText('CAPTURED')).toBeInTheDocument();
    });
  });

  describe('Filter Controls', () => {
    it('should display search input', async () => {
      renderWithProviders(<UserTransactions />, {
        mocks: standardMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(
          screen.getByPlaceholderText('transactions.search'),
        ).toBeInTheDocument();
      });
    });

    it('should render status filter control', async () => {
      renderWithProviders(<UserTransactions />, {
        mocks: standardMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(screen.getByText('pay_abc123')).toBeInTheDocument();
      });

      // Verification of filter presence (smoke test)
      expect(
        screen.getAllByLabelText('transactions.filters.statusLabel')[0],
      ).toBeInTheDocument();
    });
  });

  describe('Action Buttons', () => {
    it('should render View button for each transaction', async () => {
      renderWithProviders(<UserTransactions />, {
        mocks: standardMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(screen.getByText('pay_abc123')).toBeInTheDocument();
      });

      const viewButtons = screen.getAllByText(/View/i);
      expect(viewButtons.length).toBeGreaterThanOrEqual(2);
    });
  });

  describe('Error Handling', () => {
    it('should show error message when transactions fail to load', async () => {
      const errorMocks: MockedResponse[] = [
        {
          request: {
            query: GET_USER_TRANSACTIONS,
            variables: { userId: 'test-user-id', limit: 100 },
          },
          error: new Error('Network error'),
        },
        {
          request: {
            query: GET_USER_TRANSACTION_STATS,
            variables: { userId: 'test-user-id' },
          },
          result: { data: { razorpay_getUserTransactionStats: mockStats } },
        },
      ];

      renderWithProviders(<UserTransactions />, {
        mocks: errorMocks,
        initialEntries: ['/user/razorpay/my-transactions'],
        path: '/user/razorpay/my-transactions',
      });

      await waitFor(() => {
        expect(
          screen.getByText(/transactions.error.loadFailed/i),
        ).toBeInTheDocument();
      });
    });
  });
});
