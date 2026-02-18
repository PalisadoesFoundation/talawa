import { vi } from 'vitest';

export const mockOrders = {
  create: vi.fn(),
  fetch: vi.fn(),
  all: vi.fn(),
  fetchPayments: vi.fn(),
};

export const mockPayments = {
  fetch: vi.fn(),
  capture: vi.fn(),
  refund: vi.fn(),
};

export const mockRefunds = {
  create: vi.fn(),
};

const MockRazorpay = vi.fn(function () {
  return {
    orders: mockOrders,
    payments: mockPayments,
    refunds: mockRefunds,
  };
});

export const validateWebhookSignature = vi.fn().mockReturnValue(true);

export default MockRazorpay;
