import {
  pgTable,
  text,
  timestamp,
  uuid,
  integer,
  boolean,
  index,
} from 'drizzle-orm/pg-core';

// Razorpay Configuration table - stores payment gateway settings
export const configTable = pgTable(
  'razorpay_config',
  {
    id: uuid('id').primaryKey().defaultRandom(),
    keyId: text('key_id'), // Razorpay Key ID - optional for initial setup
    keySecret: text('key_secret'), // Razorpay Key Secret (encrypted) - optional for initial setup
    webhookSecret: text('webhook_secret'), // Webhook secret for signature verification
    isEnabled: boolean('is_enabled').default(false), // Whether payments are enabled
    testMode: boolean('test_mode').default(true), // Test mode flag
    currency: text('currency').default('INR'), // Default currency
    description: text('description').default('Donation to organization'), // Default payment description
    organizationId: uuid('organization_id').notNull().unique(), // Organization this config belongs to
    createdAt: timestamp('created_at').defaultNow(),
    updatedAt: timestamp('updated_at').defaultNow(),
  },
  (table) => {
    return {
      orgIdIdx: index('razorpay_config_org_id_idx').on(table.organizationId),
    };
  },
);

// Razorpay Orders table - stores payment orders
export const ordersTable = pgTable('razorpay_orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  razorpayOrderId: text('razorpay_order_id').unique(), // Razorpay's order ID - optional until order is created
  organizationId: uuid('organization_id'), // Organization receiving the payment - optional for anonymous donations
  userId: uuid('user_id'), // User making the payment (optional for anonymous donations)
  amount: integer('amount'), // Amount in paise - optional until order is created
  currency: text('currency').default('INR'), // Currency code
  receipt: text('receipt'), // Receipt number - optional until order is created
  status: text('status').default('created'), // Order status: created, paid, failed
  description: text('description'), // Payment description
  donorName: text('donor_name'), // Donor's name
  donorEmail: text('donor_email'), // Donor's email
  donorPhone: text('donor_phone'), // Donor's phone
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
});

// Razorpay Transactions table - stores payment transactions
export const transactionsTable = pgTable('razorpay_transactions', {
  id: uuid('id').primaryKey().defaultRandom(),
  paymentId: text('payment_id').unique(), // Razorpay's payment ID - optional until payment is initiated
  orderId: uuid('order_id'), // Reference to order - optional until order is linked
  organizationId: uuid('organization_id'), // Organization receiving the payment - optional for anonymous donations
  userId: uuid('user_id'), // User making the payment (optional for anonymous donations)
  amount: integer('amount'), // Amount in paise - optional until payment is captured
  currency: text('currency').default('INR'), // Currency code
  status: text('status').default('pending'), // Payment status: pending, captured, failed, cancelled
  method: text('method'), // Payment method used
  bank: text('bank'), // Bank name (for UPI/Net Banking)
  wallet: text('wallet'), // Wallet name (for wallet payments)
  cardId: text('card_id'), // Card ID (for card payments)
  vpa: text('vpa'), // VPA (for UPI payments)
  email: text('email'), // Payer's email
  contact: text('contact'), // Payer's contact
  fee: integer('fee'), // Transaction fee
  tax: integer('tax'), // Tax amount
  errorCode: text('error_code'), // Error code if payment failed
  errorDescription: text('error_description'), // Error description if payment failed
  refundStatus: text('refund_status'), // Refund status if applicable
  capturedAt: timestamp('captured_at'), // When payment was captured
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
});
