# Razorpay Payment Gateway API Plugin

Backend API plugin for Talawa that provides Razorpay payment gateway integration with GraphQL operations, database management, and webhook handling.

## Features

### GraphQL Operations

- **Queries**: Configuration retrieval, transaction queries, statistics
- **Mutations**: Configuration updates, payment processing, verification
- **Real-time**: Event publishing for payment status updates

### Database Management

- **Configuration Table**: Secure storage of Razorpay settings
- **Orders Table**: Payment order tracking
- **Transactions Table**: Complete transaction history

### Webhook Integration

- **Signature Verification**: HMAC-SHA256 validation
- **Event Processing**: Automatic status updates
- **Error Handling**: Comprehensive error logging

## Database Schema

### razorpay_config

```sql
CREATE TABLE razorpay_config (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  key_id TEXT NOT NULL,
  key_secret TEXT NOT NULL,
  webhook_secret TEXT,
  is_enabled BOOLEAN DEFAULT false,
  test_mode BOOLEAN DEFAULT true,
  currency TEXT DEFAULT 'INR',
  description TEXT DEFAULT 'Donation to organization',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### razorpay_orders

```sql
CREATE TABLE razorpay_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  razorpay_order_id TEXT NOT NULL UNIQUE,
  organization_id UUID NOT NULL,
  user_id UUID,
  amount INTEGER NOT NULL,
  currency TEXT NOT NULL DEFAULT 'INR',
  receipt TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'created',
  description TEXT,
  donor_name TEXT,
  donor_email TEXT,
  donor_phone TEXT,
  anonymous BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### razorpay_transactions

```sql
CREATE TABLE razorpay_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id TEXT NOT NULL UNIQUE,
  order_id UUID NOT NULL,
  organization_id UUID NOT NULL,
  user_id UUID,
  amount INTEGER NOT NULL,
  currency TEXT NOT NULL DEFAULT 'INR',
  status TEXT NOT NULL DEFAULT 'pending',
  method TEXT,
  bank TEXT,
  wallet TEXT,
  card_id TEXT,
  vpa TEXT,
  email TEXT,
  contact TEXT,
  fee INTEGER,
  tax INTEGER,
  error_code TEXT,
  error_description TEXT,
  refund_status TEXT,
  captured_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

## GraphQL Schema

### Types

```graphql
type RazorpayConfig {
  keyId: String!
  keySecret: String!
  webhookSecret: String
  isEnabled: Boolean!
  testMode: Boolean!
  currency: String!
  description: String!
}

type PaymentOrder {
  id: ID!
  amount: Int!
  currency: String!
  receipt: String!
  status: String!
  razorpayOrderId: String!
}

type Transaction {
  id: ID!
  paymentId: String!
  amount: Int!
  currency: String!
  status: String!
  description: String
  donorName: String
  donorEmail: String
  createdAt: String!
  updatedAt: String!
}

type TransactionSummary {
  totalAmount: Int!
  totalTransactions: Int!
  successfulTransactions: Int!
  failedTransactions: Int!
  pendingTransactions: Int!
  averageAmount: Float!
  currency: String!
}

type Pagination {
  totalCount: Int!
  hasMore: Boolean!
  currentPage: Int!
  totalPages: Int!
}

type OrganizationTransactions {
  transactions: [Transaction!]!
  summary: TransactionSummary!
  pagination: Pagination!
}

type UserTransactions {
  transactions: [Transaction!]!
  summary: TransactionSummary!
  pagination: Pagination!
}
```

### Queries

```graphql
query GetRazorpayConfig {
  getRazorpayConfig {
    keyId
    keySecret
    webhookSecret
    isEnabled
    testMode
    currency
    description
  }
}

query GetOrganizationTransactions(
  $orgId: ID!
  $limit: Int
  $offset: Int
  $status: String
  $dateFrom: String
  $dateTo: String
) {
  getOrganizationTransactions(
    orgId: $orgId
    limit: $limit
    offset: $offset
    status: $status
    dateFrom: $dateFrom
    dateTo: $dateTo
  ) {
    transactions {
      id
      paymentId
      amount
      currency
      status
      description
      donorName
      donorEmail
      createdAt
    }
    summary {
      totalAmount
      totalTransactions
      successfulTransactions
      failedTransactions
      pendingTransactions
      averageAmount
      currency
    }
    pagination {
      totalCount
      hasMore
      currentPage
      totalPages
    }
  }
}

query GetUserTransactions(
  $limit: Int
  $offset: Int
  $status: String
  $dateFrom: String
  $dateTo: String
) {
  getUserTransactions(
    limit: $limit
    offset: $offset
    status: $status
    dateFrom: $dateFrom
    dateTo: $dateTo
  ) {
    transactions {
      id
      paymentId
      amount
      currency
      status
      description
      organizationId
      createdAt
    }
    summary {
      totalAmount
      totalTransactions
      successfulTransactions
      failedTransactions
      pendingTransactions
      averageAmount
      currency
    }
    pagination {
      totalCount
      hasMore
      currentPage
      totalPages
    }
  }
}
```

### Mutations

```graphql
mutation UpdateRazorpayConfig($input: RazorpayConfigInput!) {
  updateRazorpayConfig(input: $input) {
    success
    message
    config {
      keyId
      keySecret
      webhookSecret
      isEnabled
      testMode
      currency
      description
    }
  }
}

mutation CreatePaymentOrder($input: CreatePaymentOrderInput!) {
  createPaymentOrder(input: $input) {
    success
    message
    order {
      id
      amount
      currency
      receipt
      status
      razorpayOrderId
    }
  }
}

mutation InitiatePayment($input: InitiatePaymentInput!) {
  initiatePayment(input: $input) {
    success
    message
    paymentData {
      key
      amount
      currency
      name
      description
      orderId
      prefill {
        name
        email
        contact
      }
      notes {
        organizationId
        userId
      }
      theme {
        color
      }
    }
  }
}

mutation VerifyPayment($input: VerifyPaymentInput!) {
  verifyPayment(input: $input) {
    success
    message
    transaction {
      paymentId
      status
      amount
      currency
    }
  }
}
```

## Webhook Endpoint

### POST /api/plugins/razorpay/webhook

Handles Razorpay webhook events for payment status updates.

**Headers:**

```
Content-Type: application/json
X-Razorpay-Signature: <signature>
```

**Body:**

```json
{
  "entity": "event",
  "account_id": "acc_xxx",
  "event": "payment.captured",
  "contains": ["payment"],
  "payload": {
    "payment": {
      "entity": {
        "id": "pay_xxx",
        "entity": "payment",
        "amount": 50000,
        "currency": "INR",
        "status": "captured",
        "order_id": "order_xxx",
        "method": "card",
        "amount_refunded": 0,
        "refund_status": null,
        "captured": true,
        "description": "Donation",
        "card_id": null,
        "bank": null,
        "wallet": null,
        "vpa": null,
        "email": "user@example.com",
        "contact": "+919999999999",
        "notes": {
          "organizationId": "org_xxx",
          "userId": "user_xxx"
        },
        "fee": 1180,
        "tax": 180,
        "error_code": null,
        "error_description": null,
        "created_at": 1640000000
      }
    }
  }
}
```

**Response:**

```json
{
  "success": true,
  "message": "Webhook processed successfully"
}
```

## Security Features

### API Key Encryption

- All Razorpay API secrets are encrypted using SHA-256
- Keys are never returned in API responses
- Secure storage in database with hashing

### Webhook Verification

- HMAC-SHA256 signature validation
- Protection against replay attacks
- Automatic signature verification for all webhooks

### Access Control

- Admin-only configuration access
- User-specific transaction views
- Organization-scoped permissions
- Authentication required for sensitive operations

## Event System

### Published Events

```typescript
// Payment created
{
  type: "payment:created",
  paymentId: string,
  organizationId: string,
  amount: number,
  userId?: string
}

// Payment completed
{
  type: "payment:completed",
  paymentId: string,
  organizationId: string,
  amount: number,
  userId?: string
}

// Payment failed
{
  type: "payment:failed",
  paymentId: string,
  error: string
}
```

### Event Handlers

- `onPaymentCreated`: Handle new payment creation
- `onPaymentCompleted`: Handle successful payments
- `onPaymentFailed`: Handle failed payments

## Error Handling

### Common Errors

1. **Invalid API Keys**: Razorpay authentication failed
2. **Webhook Signature Mismatch**: Invalid webhook signature
3. **Order Not Found**: Payment order doesn't exist
4. **Configuration Missing**: Razorpay not configured
5. **Database Errors**: Transaction/order creation failed

### Error Responses

```json
{
  "success": false,
  "message": "Error description",
  "error": {
    "code": "ERROR_CODE",
    "details": "Additional error details"
  }
}
```

## Performance Considerations

### Database Optimization

- Indexed foreign keys for fast joins
- Pagination for large transaction lists
- Efficient summary calculations
- Connection pooling

### Caching Strategy

- Configuration caching
- Transaction summary caching
- User permission caching
- Webhook signature verification caching

## Testing

### Unit Tests

- GraphQL resolver tests
- Database operation tests
- Webhook verification tests
- Security validation tests

### Integration Tests

- End-to-end payment flow
- Webhook processing
- Error handling scenarios
- Performance benchmarks

## Deployment

### Environment Variables

```bash
RAZORPAY_KEY_ID=rzp_test_xxx
RAZORPAY_KEY_SECRET=xxx
RAZORPAY_WEBHOOK_SECRET=xxx
RAZORPAY_TEST_MODE=true
```

### Database Migration

```bash
# Run database migrations
npm run db:migrate

# Verify tables created
npm run db:verify
```

### Health Checks

- Database connectivity
- Razorpay API connectivity
- Webhook endpoint availability
- Configuration validation

## Monitoring

### Metrics

- Payment success rate
- Average transaction amount
- Webhook processing time
- Error rates by type

### Logging

- Payment lifecycle events
- Webhook processing logs
- Error details with context
- Security audit logs

## Support

### Documentation

- Complete API reference
- Integration examples
- Troubleshooting guide
- Best practices

### Development

- TypeScript support
- Comprehensive error handling
- Unit test coverage
- Performance optimization

## License

This plugin is part of the Talawa ecosystem and follows the same licensing terms as the main project.
