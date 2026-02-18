import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

// Create a separate i18n instance for testing to avoid conflicts
const i18nForTests = i18n.createInstance();

// Initialize synchronously for tests
i18nForTests.use(initReactI18next).init({
  lng: 'en',
  fallbackLng: 'en',
  debug: false,
  initImmediate: false, // Important: makes init synchronous
  resources: {
    en: {
      'plugin-map': {
        global: {
          title: 'Extension Points - Global Routes',
          description:
            'This page demonstrates the RU2 (Global User Routes) extension point. All authenticated users can access this route globally.',
          testRequestSystem: 'Test Request System',
          clickBelow:
            'Click the button below to log a test request for this extension point:',
          requestButton: 'Log Test Request',
          requestHistory: 'Request History',
        },
        dashboard: {
          title: 'Extension Points - Admin Dashboard',
          description:
            'This page demonstrates the RA2 (Admin Dashboard Routes) extension point. Only administrators can access this route globally.',
          testRequestSystem: 'Test Request System',
          clickBelow:
            'Click the button below to log a test request for this extension point:',
          requestButton: 'Log Test Request',
          requestHistory: 'Request History',
        },
        user: {
          title: 'Extension Points - User Organization Routes',
          description:
            'This page demonstrates the RU1 (User Organization Routes) extension point. Organization members can access this route within their organization.',
          testRequestSystem: 'Test Request System',
          clickBelow:
            'Click the button below to log a test request for this extension point:',
          requestButton: 'Log Test Request',
          requestHistory: 'Request History',
          redirectError:
            'Organization ID is required to access this page. Redirecting to home...',
        },
        organization: {
          title: 'Extension Points - Organization Admin Routes',
          description:
            'This page demonstrates the RA1 (Admin Organization Routes) extension point. Organization administrators can access this route within their organization.',
          testRequestSystem: 'Test Request System',
          clickBelow:
            'Click the button below to log a test request for this extension point:',
          requestButton: 'Log Test Request',
          requestHistory: 'Request History',
          redirectError:
            'Organization ID is required to access this page. Redirecting to home...',
        },
        table: {
          pollNumber: 'Poll Number',
          userId: 'User ID',
          userRole: 'User Role',
          orgId: 'Organization ID',
          extensionPoint: 'Extension Point',
          createdAt: 'Created At',
          totalRequests: 'Total Requests: {{count}}',
        },
        info: {
          extensionId: 'Extension ID',
          type: 'Type',
          globalRoute: 'Global Route',
          adminDashboard: 'Admin Dashboard',
          userOrgRoute: 'User Org Route',
          orgRoute: 'Org Admin Route',
          accessLevel: 'Access Level',
          allAuthUsers: 'All Authenticated Users',
          adminsOnly: 'Admins Only (Global)',
          adminOnly: 'Admin Only',
          orgUsers: 'Organization Users',
          organization: 'Organization',
          note: 'Note:',
          cardTitle: 'Extension Point Information',
          globalDesc:
            'This route is accessible to all authenticated users globally, regardless of organization membership.',
          dashboardDesc:
            'This route is accessible to administrators in the global admin dashboard.',
          orgUserDesc:
            'This route is organization-specific and accessible to users who are members of the organization.',
          orgAdminDesc:
            'This route is organization-specific and accessible only to administrators of this organization.',
        },
        messages: {
          success:
            'Successfully logged request #{{pollNumber}} for extension point {{extensionPoint}}!',
          error: 'Failed to log request. Please try again.',
        },
        injector: {
          title: 'Plugin Map G1 Extension Point',
          description:
            'This is a demonstration of the G1 (Global Widget) extension point',
          extensionPoint: 'Extension Point: {{id}}',
          supportText: "Plugin supports the '{{id}}' extension point",
          badge: 'Plugin Map Extension Point Indicator',
        },
      },
      razorpay: {
        transactions: {
          table: {
            id: 'Transaction ID',
            amount: 'Amount',
            status: 'Status',
            method: 'Payment Method',
            date: 'Date',
            actions: 'Actions',
          },
          loading: 'Loading Razorpay transactions...',
          errorLoading: 'Error loading transactions:',
          userTitle: 'Razorpay Transactions',
          userSubtitle: 'Your payment transactions processed through Razorpay',
          receiptButton: 'Receipt',
          viewButton: 'View',
          viewDetailsAriaLabel: 'View transaction details',
          downloadReceiptAriaLabel: 'Download receipt for transaction',
        },
      },
    },
  },
  interpolation: {
    escapeValue: false,
  },
});

export default i18nForTests;
