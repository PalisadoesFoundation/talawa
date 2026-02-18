# Razorpay Payment Gateway Plugin

A mobile app plugin for Talawa that enables donation payments and transaction management through Razorpay.

## Features

### 1. **Donate (Razorpay)**
- Make donations to the current organization
- Support for multiple currencies (INR, USD, EUR, GBP)
- Quick amount selection buttons
- Pre-filled donor information from user profile
- Optional personal message with donations
- Real-time payment summary

### 2. **My Transactions**
- View payment transaction history
- Filter by organization
- Transaction details including:
  - Payment ID
  - Amount and currency
  - Status (captured, authorized, failed, refunded)
  - Payment method (card, netbanking, UPI, wallet)
  - Timestamps
- Pull-to-refresh functionality
- Detailed transaction view on tap

## Architecture

### Files Structure
```
razorpay/
├── index.dart          # Plugin entry point
├── manifest.dart       # Plugin metadata
├── routes.dart         # Route constants
├── pages.dart          # UI pages (Donation & Transactions)
├── injectors.dart      # G1 menu injectors
└── README.md          # This file
```

### Extension Points

**G1 (Menu Page):**
- Donate (Razorpay) button - Opens donation form
- My Transactions button - Shows payment history

Both buttons are grouped in a single Card for better UX.

## Routes

| Route | Description |
|-------|-------------|
| `/plugins/razorpay/donation` | Donation form page |
| `/plugins/razorpay/transactions` | Transaction history page |

## GraphQL Integration

### Queries

**Get User Transactions:**
```graphql
query GetUserTransactions($userId: String!, $orgId: String!, $limit: Int) {
  razorpay_getUserTransactions(userId: $userId, orgId: $orgId, limit: $limit) {
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
```

### Mutations

**Create Payment Order:** (To be implemented)
```graphql
mutation CreatePaymentOrder($input: RazorpayOrderInput!) {
  razorpay_createPaymentOrder(input: $input) {
    id
    razorpayOrderId
    amount
    currency
    status
  }
}
```

**Verify Payment:** (To be implemented)
```graphql
mutation VerifyPayment($input: RazorpayVerificationInput!) {
  razorpay_verifyPayment(input: $input) {
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

## Configuration

The plugin requires Razorpay to be configured on the backend with:
- API Key ID
- API Secret Key
- Webhook Secret

All configuration is managed through the admin web interface. The mobile app only needs to:
1. Fetch activated status from database
2. Initialize the plugin if active
3. Make payment requests to configured backend

## Database Schema

The plugin expects the following in the database:

**plugins table:**
```
id: String
pluginId: 'razorpay'  # Must match manifest.id
isActivated: Boolean   # Must be true
isInstalled: Boolean   # Must be true
```

## Dependencies

- `flutter/material.dart` - UI framework
- `graphql_flutter` - GraphQL client
- `intl` - Number and date formatting
- `razorpay_flutter: ^1.3.7` - Razorpay payment SDK
- Talawa core services:
  - `locator` - Service locator
  - `UserConfig` - User and org data
  - `NavigationService` - Route navigation
  - `GraphqlConfig` - GraphQL client configuration

## Razorpay Integration Flow

### 1. **Configuration Check**
```dart
query GetRazorpayConfig {
  razorpay_getRazorpayConfig {
    keyId
    isEnabled
    testMode
    currency
    description
  }
}
```

### 2. **Create Payment Order**
```dart
mutation CreatePaymentOrder($input: RazorpayOrderInput!) {
  razorpay_createPaymentOrder(input: $input) {
    id
    razorpayOrderId
    amount
    currency
    status
    description
  }
}
```

### 3. **Open Razorpay Checkout**
- Initialize Razorpay SDK with API key
- Open payment modal with order details
- Handle payment success/failure callbacks

### 4. **Verify Payment**
```dart
mutation VerifyPayment($input: RazorpayVerificationInput!) {
  razorpay_verifyPayment(input: $input) {
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

### 5. **Show Success Screen**
- Display confirmation message
- Option to make another donation
- Navigate to transaction history

## Implementation Status

### ✅ Completed
- Plugin structure and scaffolding
- Menu injectors (G1)
- Donation form UI
- Transaction list UI
- GraphQL query integration
- Currency formatting
- Status indicators
- **Razorpay SDK integration**
- **Payment order creation**
- **Payment verification**
- **Success/Error handling**
- **Payment callbacks**

### 🚧 Pending
- Receipt download
- Refund handling
- Advanced error retry logic
- Recurring donations
- Donation campaigns

## Usage Example

When the plugin is activated in the database, it automatically appears in the menu with two buttons:

1. **Donate (Razorpay)** - Users can:
   - Select donation amount (with quick buttons)
   - Choose currency
   - Fill donor information
   - Add optional message
   - Complete payment via Razorpay

2. **My Transactions** - Users can:
   - View all their transactions
   - See payment status
   - Check transaction details
   - Pull to refresh list

## Testing

The plugin can be tested by:
1. Ensuring `razorpay` plugin is in database with `isActivated: true`
2. Navigating to Menu page
3. Verifying both buttons appear
4. Testing navigation to both pages
5. Verifying UI renders correctly

## Future Enhancements

- Recurring donations
- Donation campaigns
- Tax receipt generation
- Payment reminders
- Offline payment recording
- Multiple payment methods
- Donor analytics

## License

Same as Talawa project.
