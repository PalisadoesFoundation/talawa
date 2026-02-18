/**
 * @vitest-environment jsdom
 */
/**
 * Unit Tests for RazorpayOrganizationTransactionsInjector Component
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor } from '@testing-library/react';
import { MockedResponse } from '@apollo/client/testing';
import RazorpayOrganizationTransactionsInjector from '../../../../plugins/razorpay/admin/injector/RazorpayOrganizationTransactionsInjector';
import {
  renderWithProviders,
  createMockTransaction,
  createMockTransactionStats,
  GET_ORG_TRANSACTIONS,
  GET_ORG_TRANSACTION_STATS,
} from './testUtils';

const mockTransactions = [
  createMockTransaction({ id: '1', paymentId: 'pay_org1' }),
];
const mockStats = createMockTransactionStats();

const standardMocks: MockedResponse[] = [
  {
    request: {
      query: GET_ORG_TRANSACTIONS,
      variables: { orgId: 'test-org-id', limit: 10 },
    },
    result: {
      data: { razorpay_getOrganizationTransactions: mockTransactions },
    },
  },
  {
    request: {
      query: GET_ORG_TRANSACTION_STATS,
      variables: { orgId: 'test-org-id' },
    },
    result: { data: { razorpay_getOrganizationTransactionStats: mockStats } },
  },
];

describe('RazorpayOrganizationTransactionsInjector', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  describe('Loading State', () => {
    it('should show loading state', async () => {
      renderWithProviders(<RazorpayOrganizationTransactionsInjector />, {
        mocks: standardMocks,
        initialEntries: ['/org/test-org-id'],
        path: '/org/:orgId',
      });

      expect(screen.getByText('transactions.loadingOrg')).toBeInTheDocument();
    });
  });

  describe('Error Handling', () => {
    it('should handle errors gracefully', async () => {
      const errorMocks = [
        {
          request: {
            query: GET_ORG_TRANSACTIONS,
            variables: { orgId: 'test-org-id', limit: 10 },
          },
          error: new Error('Failed to fetch'),
        },
        {
          request: {
            query: GET_ORG_TRANSACTION_STATS,
            variables: { orgId: 'test-org-id' },
          },
          error: new Error('Failed to fetch stats'),
        },
      ];

      renderWithProviders(<RazorpayOrganizationTransactionsInjector />, {
        mocks: errorMocks,
        initialEntries: ['/org/test-org-id'],
        path: '/org/:orgId',
      });

      await waitFor(() => {
        expect(
          screen.getByText(/transactions.error.loadOrgFailed/),
        ).toBeInTheDocument();
      });
    });
  });

  it('should render transactions and stats', async () => {
    renderWithProviders(<RazorpayOrganizationTransactionsInjector />, {
      mocks: standardMocks,
      initialEntries: ['/org/test-org-id'],
      path: '/org/:orgId',
    });

    expect(
      await screen.findByText('transactions.orgTitle'),
    ).toBeInTheDocument();

    expect(screen.getByText('pay_org1')).toBeInTheDocument();
    expect(
      screen.getByText('transactions.stats.totalTransactions'),
    ).toBeInTheDocument();
  });
});
