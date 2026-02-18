/**
 * @vitest-environment jsdom
 */
/**
 * Unit Tests for RazorpayUserTransactionsInjector Component
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor } from '@testing-library/react';
import { MockedResponse } from '@apollo/client/testing';
import RazorpayUserTransactionsInjector from '../../../../plugins/razorpay/admin/injector/RazorpayUserTransactionsInjector';
import {
  renderWithProviders,
  createMockTransaction,
  createErrorMock,
} from './testUtils';
import { gql } from '@apollo/client';

// Define local GET_USER_TRANSACTIONS with orgId to match component query

const GET_USER_TXN_INJECTOR = gql`
  query GetUserTransactions($userId: String!, $orgId: String!, $limit: Int) {
    razorpay_getUserTransactions(
      userId: $userId
      orgId: $orgId
      limit: $limit
    ) {
      id
      paymentId
      amount
      currency
      status
      donorName
      donorEmail
      method
      bank
      wallet
      vpa
      email
      contact
      fee
      tax
      errorCode
      errorDescription
      refundStatus
      capturedAt
      createdAt
      updatedAt
    }
  }
`;

const GET_USER_TRANSACTIONS_STATS = gql`
  query GetUserPaymentStats($userId: ID!) {
    razorpay_getUserTransactionStats(userId: $userId) {
      totalTransactions
      totalAmount
      currency
      successfulTransactions
      failedTransactions
      averageTransactionAmount
    }
  }
`;

const mockTransactions = [
  createMockTransaction({
    id: 'txn-1',
    paymentId: 'pay_inj123',
    status: 'captured',
    amount: 10000,
  }),
];

const standardMocks: MockedResponse[] = [
  {
    request: {
      query: GET_USER_TXN_INJECTOR,
      variables: { userId: 'test-user-id', orgId: 'test-org-id', limit: 10 },
    },
    result: {
      data: { razorpay_getUserTransactions: mockTransactions },
    },
  },
  {
    request: {
      query: GET_USER_TRANSACTIONS_STATS,
      variables: { userId: 'test-user-id' },
    },
    result: {
      data: {
        razorpay_getUserTransactionStats: {
          totalTransactions: 1,
          totalAmount: 10000,
          currency: 'INR',
          successfulTransactions: 1,
          failedTransactions: 0,
          averageTransactionAmount: 10000,
        },
      },
    },
  },
];

describe('RazorpayUserTransactionsInjector', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  describe('Loading State', () => {
    it('should show loading state', async () => {
      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: standardMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      expect(
        screen.getByText(/Loading Razorpay transactions/i),
      ).toBeInTheDocument();
    });
  });

  describe('Rendering', () => {
    it('should render transaction list', async () => {
      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: standardMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      await waitFor(() => {
        expect(screen.getByText('Razorpay Transactions')).toBeInTheDocument();
      });

      expect(screen.getByText('pay_inj123')).toBeInTheDocument();
    });
  });

  describe('Error Handling', () => {
    it('should handle errors gracefully', async () => {
      const errorMocks = [
        createErrorMock(GET_USER_TXN_INJECTOR, {
          userId: 'test-user-id',
          orgId: 'test-org-id',
          limit: 10,
        }),
      ];

      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: errorMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      await waitFor(() => {
        expect(
          screen.getByText(/Error loading transactions/i),
        ).toBeInTheDocument();
      });
    });
  });

  describe('Edge Cases', () => {
    it('should show empty state when transaction list is empty', async () => {
      const emptyMocks: MockedResponse[] = [
        {
          request: {
            query: GET_USER_TXN_INJECTOR,
            variables: {
              userId: 'test-user-id',
              orgId: 'test-org-id',
              limit: 10,
            },
          },
          result: {
            data: { razorpay_getUserTransactions: [] },
          },
        },
        {
          request: {
            query: GET_USER_TRANSACTIONS_STATS,
            variables: { userId: 'test-user-id' },
          },
          result: {
            data: {
              razorpay_getUserTransactionStats: {
                totalTransactions: 0,
                totalAmount: 0,
                currency: 'INR',
                successfulTransactions: 0,
                failedTransactions: 0,
                averageTransactionAmount: 0,
                __typename: 'RazorpayTransactionStats',
              },
            },
          },
        },
      ];

      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: emptyMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      await waitFor(() => {
        expect(screen.getByText('Razorpay Transactions')).toBeInTheDocument();
      });

      // Should show empty state or no transaction rows
      expect(screen.queryByText('pay_inj123')).not.toBeInTheDocument();
    });

    it('should render gracefully with missing optional fields', async () => {
      const minimalTransaction = {
        id: 'txn-minimal',
        paymentId: 'pay_minimal',
        amount: 5000,
        currency: 'INR',
        status: 'captured',
        donorName: null,
        donorEmail: null,
        method: null,
        bank: null,
        wallet: null,
        vpa: null,
        email: null,
        contact: null,
        fee: null,
        tax: null,
        errorCode: null,
        errorDescription: null,
        refundStatus: null,
        capturedAt: null,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        __typename: 'RazorpayTransaction',
      };

      const minimalMocks: MockedResponse[] = [
        {
          request: {
            query: GET_USER_TXN_INJECTOR,
            variables: {
              userId: 'test-user-id',
              orgId: 'test-org-id',
              limit: 10,
            },
          },
          result: {
            data: { razorpay_getUserTransactions: [minimalTransaction] },
          },
        },
        {
          request: {
            query: GET_USER_TRANSACTIONS_STATS,
            variables: { userId: 'test-user-id' },
          },
          result: {
            data: {
              razorpay_getUserTransactionStats: {
                totalTransactions: 1,
                totalAmount: 5000,
                currency: 'INR',
                successfulTransactions: 1,
                failedTransactions: 0,
                averageTransactionAmount: 5000,
                __typename: 'RazorpayTransactionStats',
              },
            },
          },
        },
      ];

      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: minimalMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      await waitFor(() => {
        expect(screen.getByText('Razorpay Transactions')).toBeInTheDocument();
      });

      // Should display payment ID even with missing fields
      expect(screen.getByText('pay_minimal')).toBeInTheDocument();
    });

    it('should render transactions when stats query fails', async () => {
      const transactionsOnlyMocks: MockedResponse[] = [
        {
          request: {
            query: GET_USER_TXN_INJECTOR,
            variables: {
              userId: 'test-user-id',
              orgId: 'test-org-id',
              limit: 10,
            },
          },
          result: {
            data: { razorpay_getUserTransactions: mockTransactions },
          },
        },
        {
          request: {
            query: GET_USER_TRANSACTIONS_STATS,
            variables: { userId: 'test-user-id' },
          },
          error: new Error('Stats failed'),
        },
      ];

      renderWithProviders(<RazorpayUserTransactionsInjector />, {
        mocks: transactionsOnlyMocks,
        initialEntries: ['/org/test-org-id/user/test-user-id'],
        path: '/org/:orgId/user/:userId',
      });

      await waitFor(() => {
        expect(screen.getByText('Razorpay Transactions')).toBeInTheDocument();
      });

      // Transactions should still render even if stats fail
      expect(screen.getByText('pay_inj123')).toBeInTheDocument();
    });
  });
});
