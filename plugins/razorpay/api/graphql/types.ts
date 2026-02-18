import { builder } from '~/src/graphql/builder';

// RazorpayConfig type
export const RazorpayConfigRef = builder.objectRef<{
  keyId?: string;
  keySecret?: string;
  webhookSecret?: string;
  isEnabled: boolean;
  testMode: boolean;
  currency: string;
  description: string;
}>('RazorpayConfig');

RazorpayConfigRef.implement({
  fields: (t) => ({
    keyId: t.exposeString('keyId', { nullable: true }),
    keySecret: t.exposeString('keySecret', { nullable: true }),
    webhookSecret: t.exposeString('webhookSecret', { nullable: true }),
    isEnabled: t.exposeBoolean('isEnabled'),
    testMode: t.exposeBoolean('testMode'),
    currency: t.exposeString('currency'),
    description: t.exposeString('description'),
  }),
});

// RazorpayTransaction type
export const RazorpayTransactionRef = builder.objectRef<{
  id: string;
  paymentId?: string;
  orderId?: string;
  amount?: number;
  currency: string;
  status: string;
  donorName?: string;
  donorEmail?: string;
  method?: string;
  bank?: string;
  wallet?: string;
  vpa?: string;
  email?: string;
  contact?: string;
  fee?: number;
  tax?: number;
  errorCode?: string;
  errorDescription?: string;
  refundStatus?: string;
  capturedAt?: Date;
  createdAt: Date;
  updatedAt: Date;
}>('RazorpayTransaction');

RazorpayTransactionRef.implement({
  fields: (t) => ({
    id: t.exposeID('id'),
    paymentId: t.exposeString('paymentId', { nullable: true }),
    orderId: t.exposeString('orderId', { nullable: true }),
    amount: t.exposeFloat('amount', { nullable: true }),
    currency: t.exposeString('currency'),
    status: t.exposeString('status'),
    donorName: t.exposeString('donorName', { nullable: true }),
    donorEmail: t.exposeString('donorEmail', { nullable: true }),
    method: t.exposeString('method', { nullable: true }),
    bank: t.exposeString('bank', { nullable: true }),
    wallet: t.exposeString('wallet', { nullable: true }),
    vpa: t.exposeString('vpa', { nullable: true }),
    email: t.exposeString('email', { nullable: true }),
    contact: t.exposeString('contact', { nullable: true }),
    fee: t.exposeFloat('fee', { nullable: true }),
    tax: t.exposeFloat('tax', { nullable: true }),
    errorCode: t.exposeString('errorCode', { nullable: true }),
    errorDescription: t.exposeString('errorDescription', { nullable: true }),
    refundStatus: t.exposeString('refundStatus', { nullable: true }),
    capturedAt: t.expose('capturedAt', { type: 'DateTime', nullable: true }),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
    updatedAt: t.expose('updatedAt', { type: 'DateTime' }),
  }),
});

// RazorpayTransactionStats type
export const RazorpayTransactionStatsRef = builder.objectRef<{
  totalTransactions: number;
  totalAmount: number;
  currency: string;
  successfulTransactions: number;
  failedTransactions: number;
  averageTransactionAmount: number;
}>('RazorpayTransactionStats');

RazorpayTransactionStatsRef.implement({
  fields: (t) => ({
    totalTransactions: t.exposeInt('totalTransactions'),
    totalAmount: t.exposeFloat('totalAmount'),
    currency: t.exposeString('currency'),
    successfulTransactions: t.exposeInt('successfulTransactions'),
    failedTransactions: t.exposeInt('failedTransactions'),
    averageTransactionAmount: t.exposeFloat('averageTransactionAmount'),
  }),
});

// RazorpayOrder type
export const RazorpayOrderRef = builder.objectRef<{
  id: string;
  razorpayOrderId?: string;
  organizationId?: string;
  userId?: string;
  amount?: number;
  currency: string;
  status: string;
  donorName?: string;
  donorEmail?: string;
  donorPhone?: string;
  description?: string;
  createdAt: Date;
  updatedAt: Date;
}>('RazorpayOrder');

RazorpayOrderRef.implement({
  fields: (t) => ({
    id: t.exposeID('id'),
    razorpayOrderId: t.exposeString('razorpayOrderId', { nullable: true }),
    organizationId: t.exposeString('organizationId', { nullable: true }),
    userId: t.exposeString('userId', { nullable: true }),
    amount: t.exposeFloat('amount', { nullable: true }),
    currency: t.exposeString('currency'),
    status: t.exposeString('status'),
    donorName: t.exposeString('donorName', { nullable: true }),
    donorEmail: t.exposeString('donorEmail', { nullable: true }),
    donorPhone: t.exposeString('donorPhone', { nullable: true }),
    description: t.exposeString('description', { nullable: true }),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
    updatedAt: t.expose('updatedAt', { type: 'DateTime' }),
  }),
});

// RazorpayTransactionResult type (must be defined before RazorpayPaymentResult)
export const RazorpayTransactionResultRef = builder.objectRef<{
  paymentId?: string;
  status: string;
  amount?: number;
  currency: string;
}>('RazorpayTransactionResult');

RazorpayTransactionResultRef.implement({
  fields: (t) => ({
    paymentId: t.exposeString('paymentId', { nullable: true }),
    status: t.exposeString('status'),
    amount: t.exposeFloat('amount', { nullable: true }),
    currency: t.exposeString('currency'),
  }),
});

// RazorpayPaymentResult type
export const RazorpayPaymentResultRef = builder.objectRef<{
  success: boolean;
  message: string;
  orderId?: string;
  paymentId?: string;
  amount?: number;
  currency?: string;
  transaction?: {
    paymentId?: string;
    status: string;
    amount?: number;
    currency: string;
  } | null;
}>('RazorpayPaymentResult');

RazorpayPaymentResultRef.implement({
  fields: (t) => ({
    success: t.exposeBoolean('success'),
    message: t.exposeString('message'),
    orderId: t.exposeString('orderId', { nullable: true }),
    paymentId: t.exposeString('paymentId', { nullable: true }),
    amount: t.exposeFloat('amount', { nullable: true }),
    currency: t.exposeString('currency', { nullable: true }),
    transaction: t.field({
      type: RazorpayTransactionResultRef,
      nullable: true,
      resolve: (parent) => parent.transaction,
    }),
  }),
});

// RazorpayTestResult type
export const RazorpayTestResultRef = builder.objectRef<{
  success: boolean;
  message: string;
}>('RazorpayTestResult');

RazorpayTestResultRef.implement({
  fields: (t) => ({
    success: t.exposeBoolean('success'),
    message: t.exposeString('message'),
  }),
});
