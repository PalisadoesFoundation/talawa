import { expect } from 'vitest';

// Helper to sanitize transaction for GraphQL response expectation
export const expectTransaction = (t: {
  id: string;
  paymentId: string;
  amount: number;
  currency?: string | null;
  status?: string | null;
  donorName?: string | null;
  donorEmail?: string | null;
  method?: string | null;
  bank?: string | null;
  wallet?: string | null;
  vpa?: string | null;
  email?: string | null;
  contact?: string | null;
  fee?: number | null;
  tax?: number | null;
  errorCode?: string | null;
  errorDescription?: string | null;
  refundStatus?: string | null;
  capturedAt?: Date | string | null;
  createdAt?: Date | string | null;
  updatedAt?: Date | string | null;
}) => ({
  id: t.id,
  paymentId: t.paymentId,
  amount: t.amount,
  currency: t.currency || 'INR',
  status: t.status || 'pending',
  // Optional fields from DB are null, Resolver passes them through.
  // Joined fields are undefined if missing in DB mock.
  donorName: t.donorName,
  donorEmail: t.donorEmail,
  method: t.method,
  bank: t.bank,
  wallet: t.wallet,
  vpa: t.vpa,
  email: t.email,
  contact: t.contact,
  fee: t.fee,
  tax: t.tax,
  errorCode: t.errorCode,
  errorDescription: t.errorDescription,
  refundStatus: t.refundStatus,
  capturedAt: t.capturedAt,
  createdAt: t.createdAt ?? expect.anything(),
  updatedAt: t.updatedAt ?? expect.anything(),
});

// Helper for config
export const expectConfig = (c: {
  keyId?: string | null;
  keySecret?: string | null;
  webhookSecret?: string | null;
  isEnabled: boolean;
  testMode: boolean;
  currency?: string | null;
  description?: string | null;
}) => ({
  keyId: c.keyId ?? undefined,
  keySecret: c.keySecret ?? undefined,
  webhookSecret: c.webhookSecret ?? undefined,
  isEnabled: c.isEnabled,
  testMode: c.testMode,
  currency: c.currency ?? 'INR',
  description: c.description ?? 'Donation to organization',
});
