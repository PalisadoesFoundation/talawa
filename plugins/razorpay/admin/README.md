# Razorpay Payment Gateway Plugin

A comprehensive payment gateway plugin for Talawa that integrates Razorpay for donations and payments within organizations.

## Features

### Admin Features (RA1 & RA2)

- **RA1 - Global Configuration**: Configure Razorpay API keys, webhook settings, and payment preferences
- **RA2 - Organization Transactions**: View transaction summaries and analytics for organizations

### User Features (RU1 & RU2)

- **RU1 - Donation Form**: Users can enter donation amounts and make payments through Razorpay
- **RU2 - User Transactions**: Users can view their transaction history across all organizations

## Extension Points

### Admin Extension Points

- **RA1**: `/admin/razorpay/configuration` - Global admin configuration
- **RA2**: `/admin/razorpay/:orgId/transactions` - Organization transaction management
- **DA1**: "Razorpay Configuration" drawer item for global admins
- **DA2**: "Payment Transactions" drawer item for organization admins

### User Extension Points

- **RU1**: `/user/razorpay/:orgId/donate` - Donation form for users
- **RU2**: `/user/razorpay/my-transactions` - User transaction history
- **DU1**: "Make Donation" drawer item for organization users
- **DU2**: "My Transactions" drawer item for global users

## Database Schema

### Tables

1. **razorpay_config**: Stores Razorpay configuration settings
2. **razorpay_orders**: Stores payment orders
3. **razorpay_transactions**: Stores payment transactions

### Key Fields

- Encrypted API keys for security
- Support for test and production modes
- Comprehensive transaction tracking
- Anonymous donation support

## GraphQL Operations

### Queries

- `getRazorpayConfig`: Get current Razorpay configuration
- `getOrganizationTransactions`: Get transaction summary for an organization
- `getUserTransactions`: Get user's transaction history
- `getOrganizationTransactionStats`: Get transaction statistics for an organization
- `getUserTransactionStats`: Get transaction statistics for a user

### Mutations

- `updateRazorpayConfig`: Update Razorpay configuration
- `createPaymentOrder`: Create a new payment order
- `initiatePayment`: Initiate payment with Razorpay
- `verifyPayment`: Verify payment signature and update status

## Setup Instructions

### 1. Install the Plugin

The plugin will be automatically discovered and loaded by the Talawa plugin system.

### 2. Configure Razorpay (RA1)

1. Navigate to `/admin/razorpay/configuration`
2. Enter your Razorpay API credentials:
   - Key ID (e.g., `rzp_test_...`)
   - Key Secret
   - Webhook Secret
3. Configure settings:
   - Enable/disable payments
   - Set test/production mode
   - Choose default currency
   - Set default payment description
4. Save configuration

### 3. Set Up Webhooks

1. In your Razorpay dashboard, add webhook URL:
   ```
   https://your-domain.com/api/plugins/razorpay/webhook
   ```
2. Configure webhook events:
   - `payment.captured`
   - `payment.failed`
   - `order.paid`

### 4. Test the Integration

1. Create a test organization
2. Navigate to `/user/razorpay/:orgId/donate`
3. Make a test donation using Razorpay test cards
4. Verify transaction appears in admin panel

## Security Features

### API Key Encryption

- All Razorpay API secrets are encrypted using SHA-256
- Keys are never returned in API responses
- Secure storage in database

### Payment Verification

- Webhook signature verification
- HMAC-SHA256 signature validation
- Protection against replay attacks

### Access Control

- Admin-only configuration access
- User-specific transaction views
- Organization-scoped permissions

## Payment Flow

### 1. Donation Process (RU1)

1. User visits donation form
2. Enters amount and donor information
3. System creates payment order
4. Razorpay payment modal opens
5. User completes payment
6. Webhook verifies and updates transaction
7. Success confirmation shown

### 2. Transaction Management (RA2)

1. Admin views organization transactions
2. Filters by status, date, amount
3. Views transaction summaries
4. Exports transaction data
5. Monitors payment analytics

### 3. User History (RU2)

1. User views personal transaction history
2. Filters across all organizations
3. Views donation statistics
4. Tracks payment status

## Configuration Options

### Payment Settings

- **Test Mode**: Enable for development/testing
- **Currency**: INR, USD, EUR, GBP
- **Description**: Default payment description
- **Webhook URL**: Automatic generation

### Security Settings

- **API Key Encryption**: Automatic
- **Webhook Verification**: Required
- **Signature Validation**: HMAC-SHA256

## Error Handling

### Common Issues

1. **Invalid API Keys**: Check Razorpay dashboard
2. **Webhook Failures**: Verify webhook URL and secret
3. **Payment Failures**: Check transaction logs
4. **Configuration Errors**: Validate all required fields

### Debugging

- Check plugin logs for detailed error messages
- Verify database table creation
- Test webhook connectivity
- Validate API key permissions

## API Integration

### Razorpay SDK

The plugin integrates with Razorpay's JavaScript SDK for frontend payments and Node.js SDK for backend operations.

### Webhook Handling

- Automatic signature verification
- Transaction status updates
- Error logging and notifications
- Event publishing for other plugins

## Customization

### Styling

- Customizable payment modal theme
- Organization branding support
- Responsive design for mobile devices

### Functionality

- Extensible payment methods
- Custom webhook handlers
- Additional analytics
- Integration with other plugins

## Support

### Documentation

- Complete API documentation
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

## Contributing

1. Follow the Talawa plugin development guidelines
2. Ensure all tests pass
3. Update documentation for any changes
4. Follow security best practices
5. Test thoroughly before submission

## Version History

- **v1.0.0**: Initial release with basic payment functionality
- Support for donations and transaction management
- Admin and user interfaces
- Webhook integration
- Security features
