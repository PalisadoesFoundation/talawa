import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:gql/language.dart' as lang;
import 'dart:convert';

/// Razorpay Donation Page
/// 
/// Allows users to make donations to the current organization
class RazorpayDonationPage extends StatefulWidget {
  const RazorpayDonationPage({super.key});

  @override
  State<RazorpayDonationPage> createState() => _RazorpayDonationPageState();
}

class _RazorpayDonationPageState extends State<RazorpayDonationPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  
  String _selectedCurrency = 'INR';
  final List<int> _quickAmounts = [100, 500, 1000, 2000, 5000];
  bool _isProcessing = false;
  bool _showSuccessScreen = false;
  late Razorpay _razorpay;
  
  @override
  void initState() {
    super.initState();
    print('[Razorpay] Initializing Razorpay SDK in initState');
    
    try {
      // Initialize Razorpay
      _razorpay = Razorpay();
      print('[Razorpay] Razorpay instance created');
      
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      print('[Razorpay] Payment success handler registered');
      
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      print('[Razorpay] Payment error handler registered');
      
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      print('[Razorpay] External wallet handler registered');
      
      print('[Razorpay] All event handlers registered successfully');
    } catch (e) {
      print('[Razorpay] Error during initialization: $e');
    }
    
    // Pre-fill user data
    final userConfig = locator<UserConfig>();
    final user = userConfig.currentUser;
    if (user != null) {
      _nameController.text = '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim();
      _emailController.text = user.email ?? '';
      print('[Razorpay] User data pre-filled: ${_nameController.text}, ${_emailController.text}');
    }
  }
  
  @override
  void dispose() {
    print('[Razorpay] Disposing Razorpay instance');
    try {
      _razorpay.clear();
      print('[Razorpay] Razorpay cleared successfully');
    } catch (e) {
      print('[Razorpay] Error clearing Razorpay: $e');
    }
    
    _amountController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('[Razorpay] Payment Success callback triggered');
    print('[Razorpay] Payment ID: ${response.paymentId}');
    print('[Razorpay] Order ID: ${response.orderId}');
    print('[Razorpay] Signature: ${response.signature}');
    
    // Verify payment on backend using custom client with extended timeout
    final client = _createPaymentClient();
    
    const String verifyPaymentMutation = '''
      mutation VerifyPayment(\$input: RazorpayVerificationInput!) {
        razorpay_verifyPayment(input: \$input) {
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
    ''';
    
    try {
      print('[Razorpay] Verifying payment on backend...');
      
      final result = await client.mutate(
        MutationOptions(
          document: gql(verifyPaymentMutation),
          variables: {
            'input': {
              'razorpayPaymentId': response.paymentId,
              'razorpayOrderId': response.orderId,
              'razorpaySignature': response.signature,
              'paymentData': json.encode({
                'razorpay_payment_id': response.paymentId,
                'razorpay_order_id': response.orderId,
                'razorpay_signature': response.signature,
              }),
            },
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      
      if (result.hasException) {
        print('[Razorpay] Verification exception: ${result.exception}');
        
        // Check if it's a timeout error
        if (result.exception.toString().contains('timed out') || 
            result.exception.toString().contains('TimeoutException')) {
          throw Exception('Payment verification timed out. Your payment may have been successful. Please check your transaction history.');
        }
        
        throw Exception(result.exception.toString());
      }
      
      final success = result.data?['razorpay_verifyPayment']?['success'] ?? false;
      print('[Razorpay] Verification result: $success');
      
      if (success) {
        setState(() {
          _showSuccessScreen = true;
          _isProcessing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Payment successful! Thank you for your donation.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
        );
      } else {
        final message = result.data?['razorpay_verifyPayment']?['message'] ?? 'Payment verification failed';
        print('[Razorpay] Verification failed: $message');
        throw Exception(message);
      }
    } catch (e) {
      print('[Razorpay] Payment verification error: $e');
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment verification failed: ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 7),
        ),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error callback triggered');
    print('Code: ${response.code}');
    print('Message: ${response.message}');
    print('Error data: ${response.error}');
    
    setState(() => _isProcessing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment failed: ${response.message ?? "Unknown error"}'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet callback triggered');
    print('Wallet Name: ${response.walletName}');
    
    setState(() => _isProcessing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('External wallet selected: ${response.walletName}'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  /// Make a direct HTTP GraphQL request bypassing the graphql_flutter client
  /// This avoids the stream timeout issue
  Future<Map<String, dynamic>> _directGraphQLRequest({
    required String query,
    required Map<String, dynamic> variables,
  }) async {
    final token = GraphqlConfig.token;
    final orgURI = GraphqlConfig.orgURI;
    
    print('[Razorpay] Making direct HTTP GraphQL request to: $orgURI');
    
    final response = await http.post(
      Uri.parse(orgURI!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'query': query,
        'variables': variables,
      }),
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw Exception('Request timed out after 30 seconds');
      },
    );
    
    print('[Razorpay] HTTP Response status: ${response.statusCode}');
    
    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
    
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    
    print('[Razorpay] Response data keys: ${responseData.keys.join(", ")}');
    
    if (responseData.containsKey('errors')) {
      final errors = responseData['errors'] as List;
      throw Exception('GraphQL Error: ${errors.first['message']}');
    }
    
    return responseData['data'] as Map<String, dynamic>;
  }

  /// Create a GraphQL client with extended timeout for payment operations
  GraphQLClient _createPaymentClient() {
    final token = GraphqlConfig.token;
    final orgURI = GraphqlConfig.orgURI;
    
    print('[Razorpay] Creating payment client with 30s timeout for: $orgURI');
    
    // Create HTTP client with longer timeout
    final timeoutClient = TimeoutHttpClient(
      http.Client(),
      const Duration(seconds: 30),
    );
    
    // Create HttpLink with custom client
    final httpLink = HttpLink(
      orgURI!,
      httpClient: timeoutClient,
    );
    
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final Link link = authLink.concat(httpLink);
    
    print('[Razorpay] Payment client created successfully');
    
    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
      alwaysRebroadcast: false,
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        mutate: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    );
  }

  Future<void> _initiatePayment() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isProcessing = true);
    
    final userConfig = locator<UserConfig>();
    final graphqlConfig = locator<GraphqlConfig>();
    final orgId = userConfig.currentOrg.id;
    final userId = userConfig.currentUser.id;
    
    // Step 1: Get Razorpay config
    const String getRazorpayConfigQuery = '''
      query GetRazorpayConfig {
        razorpay_getRazorpayConfig {
          keyId
          isEnabled
          testMode
          currency
          description
        }
      }
    ''';
    
    try {
      print('[Razorpay] Fetching Razorpay config...');
      
      // Use custom client with extended timeout
      final client = _createPaymentClient();
      
      final configResult = await client.query(
        QueryOptions(
          document: gql(getRazorpayConfigQuery),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );
      
      if (configResult.hasException) {
        print('[Razorpay] Config fetch exception: ${configResult.exception}');
        
        // Check if it's a timeout error
        if (configResult.exception.toString().contains('timed out') || 
            configResult.exception.toString().contains('TimeoutException')) {
          throw Exception('Connection timed out. Please check your internet connection and try again.');
        }
        
        throw Exception('Failed to fetch Razorpay config: ${configResult.exception}');
      }
      
      final config = configResult.data?['razorpay_getRazorpayConfig'];
      final keyId = config?['keyId'] as String?;
      final isEnabled = config?['isEnabled'] as bool? ?? false;
      
      print('[Razorpay] Config fetched - KeyId exists: ${keyId != null}, Enabled: $isEnabled');
      
      if (keyId == null || keyId.isEmpty || !isEnabled) {
        throw Exception('Razorpay is not configured or enabled. Please contact the administrator.');
      }
      
      // Step 2: Create payment order using direct HTTP request
      const String createOrderMutation = '''
        mutation CreatePaymentOrder(\$input: RazorpayOrderInput!) {
          razorpay_createPaymentOrder(input: \$input) {
            id
            razorpayOrderId
            amount
            currency
            status
            description
          }
        }
      ''';
      
      final amount = (double.parse(_amountController.text) * 100).toInt(); // Convert to paise
      
      print('[Razorpay] Creating order - Amount: $amount, Currency: $_selectedCurrency');
      
      // Use direct HTTP request to bypass GraphQL client stream timeout
      final orderData = await _directGraphQLRequest(
        query: createOrderMutation,
        variables: {
          'input': {
            'organizationId': orgId,
            'userId': userId,
            'amount': amount,
            'currency': _selectedCurrency,
            'description': _messageController.text.isNotEmpty 
                ? _messageController.text 
                : 'Donation to ${userConfig.currentOrg.name}',
            'donorName': _nameController.text,
            'donorEmail': _emailController.text,
            'donorPhone': _phoneController.text,
          },
        },
      );
      
      final order = orderData['razorpay_createPaymentOrder'] as Map<String, dynamic>?;
      if (order == null) {
        throw Exception('Invalid order response: missing razorpay_createPaymentOrder');
      }
      
      final razorpayOrderId = order['razorpayOrderId'] as String?;
      final orderAmount = order['amount'] as int?;
      
      print('[Razorpay] Order created - OrderId: $razorpayOrderId, Amount: $orderAmount');
      
      if (razorpayOrderId == null || orderAmount == null) {
        throw Exception('Invalid order response: missing razorpayOrderId or amount');
      }
      
      // Step 3: Open Razorpay payment modal
      print('[Razorpay] Preparing to open payment modal...');
      
      final options = {
        'key': keyId,
        'amount': orderAmount,
        'currency': _selectedCurrency,
        'name': userConfig.currentOrg.name ?? 'Organization',
        'description': order?['description'] ?? 'Donation',
        'order_id': razorpayOrderId,
        'prefill': {
          'name': _nameController.text,
          'email': _emailController.text,
          'contact': _phoneController.text.isNotEmpty ? _phoneController.text : '',
        },
        'theme': {
          'color': '#31A05F',
        },
      };
      
      print('[Razorpay] Payment options prepared: ${options.keys.join(", ")}');
      print('[Razorpay] Opening Razorpay payment gateway...');
      
      try {
        _razorpay.open(options);
        print('[Razorpay] Payment modal opened successfully');
      } catch (e, stackTrace) {
        print('[Razorpay] Error opening payment modal: $e');
        print('[Razorpay] Stack trace: $stackTrace');
        throw Exception('Failed to open payment gateway: $e');
      }
      
    } catch (e, stackTrace) {
      print('[Razorpay] Payment initiation error: $e');
      print('[Razorpay] Stack trace: $stackTrace');
      
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  String _getCurrencySymbol(String currency) {
    const symbols = {
      'INR': '₹',
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
    };
    return symbols[currency] ?? currency;
  }

  String _formatAmount(double amount, String currency) {
    final formatter = NumberFormat.currency(
      symbol: _getCurrencySymbol(currency),
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final userConfig = locator<UserConfig>();
    final orgId = userConfig.currentOrg.id;

    // Show success screen
    if (_showSuccessScreen) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Donation Successful'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                const SizedBox(height: 24),
                Text(
                  'Thank You!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Your donation has been processed successfully.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'You will receive a confirmation email shortly.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showSuccessScreen = false;
                      _amountController.clear();
                      _phoneController.clear();
                      _messageController.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('Make Another Donation'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/plugins/razorpay/transactions');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('View My Transactions'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Donation'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Organization Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      if (userConfig.currentOrg.image != null)
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(userConfig.currentOrg.image!),
                        ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userConfig.currentOrg.name ?? 'Organization',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            if (userConfig.currentOrg.description != null)
                              Text(
                                userConfig.currentOrg.description!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Amount Section
              Text(
                'Donation Amount',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        prefixText: _getCurrencySymbol(_selectedCurrency),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        final amount = double.tryParse(value);
                        if (amount == null || amount <= 0) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCurrency,
                      decoration: const InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(),
                      ),
                      items: ['INR', 'USD', 'EUR', 'GBP']
                          .map((currency) => DropdownMenuItem(
                                value: currency,
                                child: Text('$currency (${_getCurrencySymbol(currency)})'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCurrency = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Quick Amount Buttons
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _quickAmounts.map((amount) {
                  return OutlinedButton(
                    onPressed: () {
                      _amountController.text = amount.toString();
                    },
                    child: Text(_formatAmount(amount.toDouble(), _selectedCurrency)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Donor Information
              Text(
                'Your Information',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _messageController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Message (Optional)',
                  hintText: 'Add a personal message with your donation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Payment Summary
              if (_amountController.text.isNotEmpty)
                Card(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[850]
                      : Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Summary',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Donation Amount:',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey[300]
                                    : Colors.grey[800],
                              ),
                            ),
                            Text(
                              _formatAmount(
                                double.tryParse(_amountController.text) ?? 0,
                                _selectedCurrency,
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Processing Fee:',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey[300]
                                    : Colors.grey[800],
                              ),
                            ),
                            Text(
                              _formatAmount(0, _selectedCurrency),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              _formatAmount(
                                double.tryParse(_amountController.text) ?? 0,
                                _selectedCurrency,
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              // Donate Button
              ElevatedButton(
                onPressed: _isProcessing ? null : _initiatePayment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: _isProcessing
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Processing...',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      )
                    : Text(
                        'Donate ${_amountController.text.isNotEmpty ? _formatAmount(double.tryParse(_amountController.text) ?? 0, _selectedCurrency) : ""}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
              ),
              const SizedBox(height: 16),

              // Security Notice
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.lock, color: Colors.blue),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Secure Payment',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Your payment information is encrypted and secure. We use Razorpay, a trusted payment gateway.',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Razorpay User Transactions Page
/// 
/// Displays payment transactions made by the user in the current organization
class RazorpayTransactionsPage extends StatelessWidget {
  const RazorpayTransactionsPage({super.key});

  String _getTransactionsQuery() {
    return '''
      query GetUserTransactions(\$userId: String!, \$orgId: String!, \$limit: Int) {
        razorpay_getUserTransactions(userId: \$userId, orgId: \$orgId, limit: \$limit) {
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
    ''';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'captured':
        return Colors.green;
      case 'authorized':
        return Colors.blue;
      case 'failed':
        return Colors.red;
      case 'refunded':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatAmount(int amountInPaise, String currency) {
    final amount = amountInPaise / 100;
    final symbols = {
      'INR': '₹',
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
    };
    final symbol = symbols[currency] ?? currency;
    return '$symbol ${amount.toStringAsFixed(2)}';
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final userConfig = locator<UserConfig>();
    final userId = userConfig.currentUser.id;
    final orgId = userConfig.currentOrg.id;
    final graphqlConfig = locator<GraphqlConfig>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Transactions'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GraphQLProvider(
        client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
        child: Query(
          options: QueryOptions(
            document: gql(_getTransactionsQuery()),
            variables: {
              'userId': userId,
              'orgId': orgId,
              'limit': 50,
            },
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading transactions',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      result.exception.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => refetch?.call(),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final transactions = result.data?['razorpay_getUserTransactions'] as List? ?? [];

          if (transactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No transactions yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your payment transactions will appear here',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final status = transaction['status'] as String? ?? 'unknown';
                final amount = transaction['amount'] as int? ?? 0;
                final currency = transaction['currency'] as String? ?? 'INR';
                final method = transaction['method'] as String? ?? 'N/A';
                final createdAt = transaction['createdAt'] as String? ?? '';
                final paymentId = transaction['paymentId'] as String? ?? '';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      // TODO: Show transaction details dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Transaction Details'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildDetailRow('Payment ID', paymentId),
                                _buildDetailRow('Amount', _formatAmount(amount, currency)),
                                _buildDetailRow('Status', status.toUpperCase()),
                                _buildDetailRow('Method', method),
                                _buildDetailRow('Date', _formatDate(createdAt)),
                                if (transaction['bank'] != null)
                                  _buildDetailRow('Bank', transaction['bank']),
                                if (transaction['wallet'] != null)
                                  _buildDetailRow('Wallet', transaction['wallet']),
                                if (transaction['errorDescription'] != null)
                                  _buildDetailRow('Error', transaction['errorDescription']),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  _formatAmount(amount, currency),
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(status).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  status.toUpperCase(),
                                  style: TextStyle(
                                    color: _getStatusColor(status),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.payment, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                method,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                _formatDate(createdAt),
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          if (paymentId.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              'ID: $paymentId',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[500],
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

/// Custom HTTP client that wraps requests with a timeout
class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner;
  final Duration timeout;

  TimeoutHttpClient(this._inner, this.timeout);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    print('[TimeoutHttpClient] Sending request to: ${request.url}');
    print('[TimeoutHttpClient] Timeout set to: ${timeout.inSeconds} seconds');
    
    try {
      final response = await _inner.send(request).timeout(
        timeout,
        onTimeout: () {
          print('[TimeoutHttpClient] Request timed out after ${timeout.inSeconds} seconds');
          throw http.ClientException(
            'Request timed out after ${timeout.inSeconds} seconds',
            request.url,
          );
        },
      );
      
      print('[TimeoutHttpClient] Request completed successfully in time');
      return response;
    } catch (e) {
      print('[TimeoutHttpClient] Request failed: $e');
      rethrow;
    }
  }

  @override
  void close() {
    _inner.close();
  }
}
