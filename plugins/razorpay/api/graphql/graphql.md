# Razorpay Plugin GraphQL API Documentation

This document provides a comprehensive collection of GraphQL queries and mutations for the Razorpay payment gateway plugin. All operations can be tested in GraphiQL.

## Table of Contents

- [Types](#types)
- [Queries](#queries)
- [Mutations](#mutations)
- [Examples](#examples)

## Types

### RazorpayConfig

```graphql
type RazorpayConfig {
  keyId: String!
  keySecret: String!
  webhookSecret: String!
  isEnabled: Boolean!
  testMode: Boolean!
  currency: String!
  description: String!
}
```

### RazorpayConfigInput

```graphql
input RazorpayConfigInput {
  keyId: String!
  keySecret: String!
  webhookSecret: String!
  isEnabled: Boolean!
  testMode: Boolean!
  currency: String!
  description: String!
}
```

### RazorpayTransaction

```graphql
type RazorpayTransaction {
  id: ID!
  paymentId: String!
  orderId: String!
  amount: Int!
  currency: String!
  status: String!
  description: String!
  donorName: String
  donorEmail: String
  donorPhone: String
  anonymous: Boolean!
  organizationId: String!
  organizationName: String!
  createdAt: String!
  updatedAt: String!
}
```

### RazorpayOrder

```graphql
type RazorpayOrder {
  id: ID!
  orderId: String!
  amount: Int!
  currency: String!
  description: String!
  organizationId: String!
  status: String!
  createdAt: String!
  updatedAt: String!
}
```

### TransactionSummary

```graphql
type TransactionSummary {
  totalAmount: Int!
  totalTransactions: Int!
  successfulTransactions: Int!
  failedTransactions: Int!
  pendingTransactions: Int!
  averageAmount: Int!
  currency: String!
}
```

### Pagination

```graphql
type Pagination {
  totalCount: Int!
  hasMore: Boolean!
  currentPage: Int!
  totalPages: Int!
}
```

### OrganizationTransactionsResponse

```graphql
type OrganizationTransactionsResponse {
  transactions: [RazorpayTransaction!]!
  summary: TransactionSummary!
  pagination: Pagination!
}
```

### UserTransactionsResponse

```graphql
type UserTransactionsResponse {
  transactions: [RazorpayTransaction!]!
  summary: TransactionSummary!
  pagination: Pagination!
}
```

### MonthlyStats

```graphql
type MonthlyStats {
  month: String!
  amount: Int!
  count: Int!
}
```

### DailyStats

```graphql
type DailyStats {
  date: String!
  amount: Int!
  count: Int!
}
```

### TopDonor

```graphql
type TopDonor {
  donorName: String!
  totalAmount: Int!
  transactionCount: Int!
}
```

### OrganizationStats

```graphql
type OrganizationStats {
  organizationName: String!
  totalAmount: Int!
  transactionCount: Int!
}
```

### RecentActivity

```graphql
type RecentActivity {
  date: String!
  amount: Int!
  organizationName: String!
  status: String!
}
```

### OrganizationTransactionStats

```graphql
type OrganizationTransactionStats {
  dailyStats: [DailyStats!]!
  monthlyStats: [MonthlyStats!]!
  topDonors: [TopDonor!]!
}
```

### UserTransactionStats

```graphql
type UserTransactionStats {
  monthlyStats: [MonthlyStats!]!
  organizationStats: [OrganizationStats!]!
  recentActivity: [RecentActivity!]!
}
```

### PaymentOrderResponse

```graphql
type PaymentOrderResponse {
  success: Boolean!
  message: String!
  order: RazorpayOrder
}
```

### PaymentInitiationResponse

```graphql
type PaymentInitiationResponse {
  success: Boolean!
  message: String!
  paymentData: PaymentData
}
```

### PaymentData

```graphql
type PaymentData {
  key: String!
  amount: Int!
  currency: String!
  name: String!
  description: String!
  orderId: String!
  prefill: PaymentPrefill
  theme: PaymentTheme
}
```

### PaymentPrefill

```graphql
type PaymentPrefill {
  name: String
  email: String
  contact: String
}
```

### PaymentTheme

```graphql
type PaymentTheme {
  color: String!
}
```

### PaymentVerificationResponse

```graphql
type PaymentVerificationResponse {
  success: Boolean!
  message: String!
  transaction: RazorpayTransaction
}
```

## Queries

### 1. Get Razorpay Configuration

```graphql
query GetRazorpayConfig {
  razorpay_getRazorpayConfig {
    keyId
    keySecret
    webhookSecret
    isEnabled
    testMode
    currency
    description
  }
}
```

### 2. Get Organization Transactions

```graphql
query GetOrganizationTransactions(
  $orgId: ID!
  $limit: Int
  $offset: Int
  $status: String
  $dateFrom: String
  $dateTo: String
) {
  razorpay_getOrganizationTransactions(
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
      orderId
      amount
      currency
      status
      description
      donorName
      donorEmail
      donorPhone
      anonymous
      organizationId
      organizationName
      createdAt
      updatedAt
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

### 3. Get User Transactions

```graphql
query GetUserTransactions(
  $limit: Int
  $offset: Int
  $status: String
  $dateFrom: String
  $dateTo: String
) {
  razorpay_getUserTransactions(
    limit: $limit
    offset: $offset
    status: $status
    dateFrom: $dateFrom
    dateTo: $dateTo
  ) {
    transactions {
      id
      paymentId
      orderId
      amount
      currency
      status
      description
      donorName
      donorEmail
      donorPhone
      anonymous
      organizationId
      organizationName
      createdAt
      updatedAt
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

### 4. Get Organization Transaction Statistics

```graphql
query GetOrganizationTransactionStats($orgId: ID!, $period: String!) {
  razorpay_getOrganizationTransactionStats(orgId: $orgId, period: $period) {
    dailyStats {
      date
      amount
      count
    }
    monthlyStats {
      month
      amount
      count
    }
    topDonors {
      donorName
      totalAmount
      transactionCount
    }
  }
}
```

### 5. Get User Transaction Statistics

```graphql
query GetUserTransactionStats($period: String!) {
  razorpay_getUserTransactionStats(period: $period) {
    monthlyStats {
      month
      amount
      count
    }
    organizationStats {
      organizationName
      totalAmount
      transactionCount
    }
    recentActivity {
      date
      amount
      organizationName
      status
    }
  }
}
```

## Mutations

### 1. Update Razorpay Configuration

```graphql
mutation UpdateRazorpayConfig($input: RazorpayConfigInput!) {
  razorpay_updateRazorpayConfig(input: $input) {
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
```

### 2. Create Payment Order

```graphql
mutation CreatePaymentOrder($input: PaymentOrderInput!) {
  razorpay_createPaymentOrder(input: $input) {
    success
    message
    order {
      id
      orderId
      amount
      currency
      description
      organizationId
      status
      createdAt
      updatedAt
    }
  }
}
```

### 3. Initiate Payment

```graphql
mutation InitiatePayment($input: PaymentInitiationInput!) {
  razorpay_initiatePayment(input: $input) {
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
      theme {
        color
      }
    }
  }
}
```

### 4. Verify Payment

```graphql
mutation VerifyPayment($input: PaymentVerificationInput!) {
  razorpay_verifyPayment(input: $input) {
    success
    message
    transaction {
      id
      paymentId
      orderId
      amount
      currency
      status
      description
      donorName
      donorEmail
      donorPhone
      anonymous
      organizationId
      organizationName
      createdAt
      updatedAt
    }
  }
}
```

## Examples

### Example 1: Get Configuration

```graphql
query {
  razorpay_getRazorpayConfig {
    keyId
    isEnabled
    testMode
    currency
    description
  }
}
```

### Example 2: Get Organization Transactions with Filters

```graphql
query {
  razorpay_getOrganizationTransactions(
    orgId: "org123"
    limit: 20
    offset: 0
    status: "captured"
    dateFrom: "2024-01-01"
    dateTo: "2024-12-31"
  ) {
    transactions {
      id
      paymentId
      amount
      currency
      status
      donorName
      donorEmail
      createdAt
    }
    summary {
      totalAmount
      totalTransactions
      successfulTransactions
    }
    pagination {
      totalCount
      hasMore
    }
  }
}
```

### Example 3: Update Configuration

```graphql
mutation {
  razorpay_updateRazorpayConfig(
    input: {
      keyId: "rzp_test_1234567890"
      keySecret: "secret_key_here"
      webhookSecret: "webhook_secret_here"
      isEnabled: true
      testMode: true
      currency: "INR"
      description: "Donation to organization"
    }
  ) {
    success
    message
    config {
      keyId
      isEnabled
      testMode
      currency
    }
  }
}
```

### Example 4: Create Payment Order

```graphql
mutation {
  razorpay_createPaymentOrder(
    input: {
      amount: 100000
      currency: "INR"
      description: "Donation to organization"
      donorName: "John Doe"
      donorEmail: "john@example.com"
      donorPhone: "+919876543210"
      anonymous: false
      organizationId: "org123"
    }
  ) {
    success
    message
    order {
      id
      orderId
      amount
      currency
      status
    }
  }
}
```

### Example 5: Get User Transaction Statistics

```graphql
query {
  razorpay_getUserTransactionStats(period: "30d") {
    monthlyStats {
      month
      amount
      count
    }
    organizationStats {
      organizationName
      totalAmount
      transactionCount
    }
    recentActivity {
      date
      amount
      organizationName
      status
    }
  }
}
```

## Variables for Queries

### Organization Transactions Variables

```json
{
  "orgId": "org123",
  "limit": 20,
  "offset": 0,
  "status": "captured",
  "dateFrom": "2024-01-01",
  "dateTo": "2024-12-31"
}
```

### User Transactions Variables

```json
{
  "limit": 20,
  "offset": 0,
  "status": "captured",
  "dateFrom": "2024-01-01",
  "dateTo": "2024-12-31"
}
```

### Update Configuration Variables

```json
{
  "input": {
    "keyId": "rzp_test_1234567890",
    "keySecret": "secret_key_here",
    "webhookSecret": "webhook_secret_here",
    "isEnabled": true,
    "testMode": true,
    "currency": "INR",
    "description": "Donation to organization"
  }
}
```

### Create Payment Order Variables

```json
{
  "input": {
    "amount": 100000,
    "currency": "INR",
    "description": "Donation to organization",
    "donorName": "John Doe",
    "donorEmail": "john@example.com",
    "donorPhone": "+919876543210",
    "anonymous": false,
    "organizationId": "org123"
  }
}
```

## Notes

1. **Amount**: All amounts are in paise (smallest currency unit). For example, ₹100 = 10000 paise.
2. **Authentication**: Most operations require authentication. Ensure you're logged in when testing.
3. **Organization ID**: Required for organization-specific operations.
4. **Status Values**: Common status values include "captured", "pending", "failed", "cancelled".
5. **Period Values**: For statistics, use "7d", "30d", "90d", "1y" for different time periods.
6. **Pagination**: Use `limit` and `offset` for pagination. `limit` defaults to 20, `offset` defaults to 0.
7. **Date Format**: Use ISO 8601 format (YYYY-MM-DD) for date filters.

## Error Handling

All operations return a `success` boolean and `message` string. Check these fields to handle errors appropriately.

```graphql
{
  "success": false,
  "message": "Invalid API key provided"
}
```

## Webhook Endpoint

The webhook endpoint for Razorpay is available at:

```
POST /api/plugins/razorpay/webhook
```

The webhook expects Razorpay's standard webhook payload and verifies the signature using the configured webhook secret.
