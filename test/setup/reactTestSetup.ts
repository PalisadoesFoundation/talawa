import { vi } from 'vitest';
import '@testing-library/jest-dom/vitest';

// Verify environment
// Verify environment - Only run setup if window is defined (JSDOM)
if (typeof window !== 'undefined') {
  // Mock React Toastify
  vi.mock('react-toastify', async () => {
    const actual =
      await vi.importActual<typeof import('react-toastify')>('react-toastify');
    return {
      ...actual,
      toast: {
        success: vi.fn(),
        error: vi.fn(),
        info: vi.fn(),
        warning: vi.fn(),
      },
    };
  });

  // Mock Ant Design message
  vi.mock('antd', async () => {
    const actual = await vi.importActual<typeof import('antd')>('antd');
    return {
      ...actual,
      message: {
        success: vi.fn(),
        error: vi.fn(),
        info: vi.fn(),
        warning: vi.fn(),
        loading: vi.fn(() => vi.fn()), // Returns a dismissal function
      },
    };
  });

  // Mock Loader component
  vi.mock('components/Loader/Loader', () => ({
    default: () => 'Loading...',
  }));

  // Mock react-i18next
  vi.mock('react-i18next', async () => {
    const actual =
      await vi.importActual<typeof import('react-i18next')>('react-i18next');

    // Translation map for English (complete set from JSON files)
    const translations: Record<string, string> = {
      // Plugin Map translations
      'injector.title': 'Plugin Map G1 Extension Point',
      'injector.description':
        'This is a demonstration of the G1 (Global Widget) extension point',
      'injector.extensionPoint': 'Extension Point: {{id}}',
      'injector.supportText': "Plugin supports the '{{id}}' extension point",
      'injector.badge': 'Plugin Map Extension Point Indicator',

      // Razorpay - Donation
      'donation.title': 'Make a Donation',
      'donation.subtitle': 'Support {{orgName}} with your contribution',
      'donation.form.amountLabel': 'Donation Amount',
      'donation.form.amountPlaceholder': '0.00',
      'donation.form.currencyLabel': 'Currency',
      'donation.form.quickAmounts': 'Quick Amounts',
      'donation.form.donorInfoTitle': 'Your Information',
      'donation.form.fullNameLabel': 'Full Name',
      'donation.form.fullNamePlaceholder': 'Enter your full name',
      'donation.form.fullNameRequired': 'Full Name *',
      'donation.form.emailLabel': 'Email Address',
      'donation.form.emailPlaceholder': 'Enter your email',
      'donation.form.emailRequired': 'Email Address *',
      'donation.form.phoneLabel': 'Phone Number',
      'donation.form.phoneOptional': 'Phone Number (Optional)',
      'donation.form.phonePlaceholder': 'Enter your phone number',
      'donation.form.descriptionLabel': 'Message',
      'donation.form.descriptionPlaceholder': 'Add a message (optional)',
      'donation.form.submit': 'Donate Now',
      'donation.form.processing': 'Processing...',
      'donation.form.submitButton': 'Donate {{amount}}',
      'donation.form.submitButtonDefault': 'Donate',
      'donation.validation.amountRequired': 'Please enter a valid amount',
      'donation.validation.amountMinimum': 'Amount must be at least {{min}}',
      'donation.validation.nameRequired': 'Please enter your name',
      'donation.validation.emailRequired': 'Please enter your email',
      'donation.validation.emailInvalid': 'Please enter a valid email address',
      'donation.error.configNotEnabled':
        'Razorpay is not configured or enabled. Please contact the administrator.',
      'donation.error.loadUserFailed':
        'Failed to load user data. Please refresh the page.',
      'donation.error.loadOrgFailed': 'Failed to load organization information',
      'donation.error.orderFailed': 'Failed to create payment order',
      'donation.error.paymentFailed': 'Payment failed',
      'donation.error.systemUnavailable': 'Payment System Not Available',

      // Razorpay - Configuration
      'configuration.title': 'Razorpay Configuration',
      'configuration.subtitle':
        'Configure your Razorpay payment gateway settings',
      'configuration.sections.credentials': '🔑 API Credentials',
      'configuration.sections.settings': '⚙️ Settings',
      'configuration.form.keyIdLabel': 'Key ID',
      'configuration.form.keyIdPlaceholder': 'Enter Razorpay Key ID',
      'configuration.form.keySecretLabel': 'Key Secret',
      'configuration.form.keySecretPlaceholder': 'Enter your key secret',
      'configuration.form.webhookSecretLabel': 'Webhook Secret',
      'configuration.form.webhookSecretPlaceholder':
        'Enter your webhook secret',
      'configuration.form.enabledLabel': 'Enable Razorpay',
      'configuration.form.testModeLabel': 'Test Mode',
      'configuration.form.currencyLabel': 'Default Currency',
      'configuration.form.descriptionLabel': 'Default Description',
      'configuration.form.saveButton': 'Save Configuration',
      'configuration.form.saving': 'Saving...',
      'configuration.form.yes': 'Enabled',
      'configuration.form.no': 'Disabled',
      'configuration.form.testMode': 'Test Mode',
      'configuration.form.liveMode': 'Live Mode',
      'configuration.actions.test': 'Test with Dummy Payment',
      'configuration.actions.testing': 'Testing...',
      'configuration.actions.showSecret': 'Show secret',
      'configuration.actions.hideSecret': 'Hide secret',
      'configuration.help.title': '📚 Help & Resources',
      'configuration.success.saved':
        'Razorpay configuration saved successfully!',
      'configuration.success.testSetup':
        'Setup test successful! Razorpay configuration is working correctly.',
      'configuration.error.loadFailed': 'Failed to load configuration',
      'configuration.error.saveFailed': 'Failed to save configuration',

      // Razorpay - Transactions
      'transactions.table.id': 'Transaction ID',
      'transactions.table.amount': 'Amount',
      'transactions.table.status': 'Status',
      'transactions.table.method': 'Payment Method',
      'transactions.table.date': 'Date',
      'transactions.table.actions': 'Actions',
      'transactions.table.pagination':
        '{{start}}-{{end}} of {{total}} transactions',
      'transactions.messages.viewingDetails':
        'Viewing details for transaction: {{id}}',
      'transactions.messages.downloadingReceipt':
        'Downloading receipt for transaction: {{id}}',
      'transactions.userTransactions.loading':
        'Loading Razorpay transactions...',
      'transactions.userTransactions.title': 'Razorpay Transactions',
      'transactions.userTransactions.subtitle':
        'Your payment transactions processed through Razorpay',
      'transactions.userTransactions.receiptButton': 'Receipt',
      'transactions.userTransactions.viewDetailsAriaLabel':
        'View transaction details',
      'transactions.userTransactions.downloadReceiptAriaLabel':
        'Download receipt for transaction',
      'transactions.userTransactions.errorPrefix':
        'Error loading transactions:',
      'transactions.viewButton': 'View',

      // Common
      'common.loading': 'Loading...',
      'common.error': 'An error occurred',
      'common.notAvailable': 'N/A',
    };

    return {
      ...actual,
      useTranslation: () => ({
        t: (key: string, options?: Record<string, unknown>) => {
          let translation = translations[key] || key;

          // Simple interpolation support for {{variable}} syntax
          if (typeof options === 'object' && options !== null) {
            translation = Object.keys(options).reduce(
              (result, optionKey) =>
                result.replace(
                  new RegExp(`\\{\\{${optionKey}\\}\\}`, 'g'),
                  String(options[optionKey]),
                ),
              translation,
            );
          }
          return translation;
        },
        i18n: {
          changeLanguage: vi.fn(),
          language: 'en',
        },
      }),
      // Use real I18nextProvider from actual implementation
      I18nextProvider: actual.I18nextProvider,
      initReactI18next: actual.initReactI18next,
    };
  });

  // Mock useLocalstorage hook
  vi.mock('utils/useLocalstorage', () => ({
    default: () => ({
      getItem: (key: string) => {
        if (key === 'id') return 'test-user-id';
        return null;
      },
      setItem: vi.fn(),
      removeItem: vi.fn(),
    }),
  }));

  // Mock window.matchMedia for Ant Design
  Object.defineProperty(window, 'matchMedia', {
    writable: true,
    value: vi.fn().mockImplementation((query) => ({
      matches: false,
      media: query,
      onchange: null,
      addListener: vi.fn(), // deprecated
      removeListener: vi.fn(), // deprecated
      addEventListener: vi.fn(),
      removeEventListener: vi.fn(),
      dispatchEvent: vi.fn(),
    })),
  });

  // Razorpay global mock
  window.Razorpay = vi.fn().mockImplementation(() => ({
    open: vi.fn(),
    on: vi.fn(),
  }));

  // Prevent actual script loading
  const originalCreateElement = document.createElement.bind(document);
  document.createElement = (
    tagName: string,
    options?: ElementCreationOptions,
  ) => {
    if (tagName === 'script') {
      const script = originalCreateElement(
        tagName,
        options,
      ) as HTMLScriptElement;
      setTimeout(() => {
        script.onload?.(new Event('load'));
      }, 0);
      return script;
    }
    return originalCreateElement(tagName, options);
  };
}
