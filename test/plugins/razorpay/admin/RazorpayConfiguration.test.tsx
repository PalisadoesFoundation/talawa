/**
 * @vitest-environment jsdom
 */
/**
 * Unit Tests for RazorpayConfiguration Component
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { MockedResponse } from '@apollo/client/testing';
import RazorpayConfiguration from '../../../../plugins/razorpay/admin/pages/RazorpayConfiguration';
import {
  renderWithProviders,
  createMockRazorpayConfig,
  createRazorpayConfigQueryMock,
  createUpdateConfigMutationMock,
  createTestSetupMutationMock,
  UPDATE_RAZORPAY_CONFIG,
} from './testUtils';

import { toast } from 'react-toastify';

// Mock Config Data
const mockConfig = createMockRazorpayConfig();

// Mock react-toastify
vi.mock('react-toastify', () => ({
  toast: {
    success: vi.fn(),
    error: vi.fn(),
    info: vi.fn(),
  },
}));

// Standard Mocks
const standardMocks: MockedResponse[] = [
  createRazorpayConfigQueryMock(mockConfig),
  createUpdateConfigMutationMock(mockConfig),
  createTestSetupMutationMock(true),
];

describe('RazorpayConfiguration', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  describe('Rendering', () => {
    it('should render configuration form correctly', async () => {
      renderWithProviders(<RazorpayConfiguration />, {
        mocks: standardMocks,
      });

      expect(screen.getByText('Loading...')).toBeInTheDocument();

      await waitFor(() => {
        expect(
          screen.getByRole('heading', { name: /Razorpay Configuration/i }),
        ).toBeInTheDocument();
      });

      expect(screen.getByPlaceholderText('Enter Razorpay Key ID')).toHaveValue(
        mockConfig.keyId,
      );
      expect(screen.getByPlaceholderText('Enter your key secret')).toHaveValue(
        mockConfig.keySecret,
      );
      expect(screen.getByText('Enabled')).toBeInTheDocument();
    });

    it('should toggle secret visibility', async () => {
      const user = userEvent.setup();
      renderWithProviders(<RazorpayConfiguration />, {
        mocks: standardMocks,
      });

      // Wait for component to load first
      await waitFor(() => {
        expect(
          screen.getByPlaceholderText('Enter your key secret'),
        ).toBeInTheDocument();
      });

      // Verify password type initially
      expect(
        screen.getByPlaceholderText('Enter your key secret'),
      ).toHaveAttribute('type', 'password');

      const toggleBtns = screen.getAllByRole('button', {
        name: /Show secret/i,
      });
      const toggleBtn = toggleBtns[0];
      await user.click(toggleBtn);

      await waitFor(() => {
        expect(
          screen.getByPlaceholderText('Enter your key secret'),
        ).toHaveAttribute('type', 'text');
      });

      const hideBtns = screen.getAllByRole('button', {
        name: /Hide secret/i,
      });
      const hideBtn = hideBtns[0];
      await user.click(hideBtn);
      await waitFor(() => {
        expect(
          screen.getByPlaceholderText('Enter your key secret'),
        ).toHaveAttribute('type', 'password');
      });
    });
  });

  describe('Actions', () => {
    it('should handle save action', async () => {
      const user = userEvent.setup();

      const saveMutationMock = vi.fn(() => ({
        data: {
          razorpay_updateRazorpayConfig: {
            ...mockConfig,
            __typename: 'RazorpayConfig',
          },
        },
      }));

      const mocksWithSpy: MockedResponse[] = [
        standardMocks[0], // GET_RAZORPAY_CONFIG
        {
          request: {
            query: UPDATE_RAZORPAY_CONFIG,
            variables: {
              input: {
                keyId: mockConfig.keyId,
                keySecret: mockConfig.keySecret,
                webhookSecret: mockConfig.webhookSecret,
                isEnabled: true,
                testMode: true,
                currency: 'INR',
                description: 'Donation to organization',
              },
            },
          },
          result: saveMutationMock,
        },
        standardMocks[2], // TEST_RAZORPAY_SETUP
      ];

      renderWithProviders(<RazorpayConfiguration />, {
        mocks: mocksWithSpy,
      });

      await waitFor(() => {
        expect(
          screen.getByRole('button', { name: /Save Configuration/i }),
        ).toBeInTheDocument();
      });

      const saveBtn = screen.getByRole('button', {
        name: /Save Configuration/i,
      });
      await user.click(saveBtn);

      await waitFor(() => {
        expect(saveMutationMock).toHaveBeenCalled();
      });

      await waitFor(() => {
        expect(toast.success).toHaveBeenCalledWith(
          'Razorpay configuration saved successfully!',
        );
      });
    });

    it('should handle test setup action', async () => {
      const user = userEvent.setup();
      renderWithProviders(<RazorpayConfiguration />, {
        mocks: standardMocks,
      });

      // Wait for component to load first
      await waitFor(() => {
        expect(
          screen.getByRole('button', { name: /Test with Dummy Payment/i }),
        ).toBeInTheDocument();
      });

      const testBtn = screen.getByRole('button', {
        name: /Test with Dummy Payment/i,
      });
      await user.click(testBtn);

      await waitFor(() => {
        expect(toast.success).toHaveBeenCalledWith(
          expect.stringContaining('Setup test successful'),
        );
      });
    });
  });
});
