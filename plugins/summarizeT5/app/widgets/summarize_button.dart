import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Summarize Button Widget
/// 
/// Displays a button that generates AI summaries for post captions using T5 model.
class SummarizeButton extends StatefulWidget {
  const SummarizeButton({
    super.key,
    required this.caption,
    this.postId,
  });

  final String caption;
  final String? postId;

  @override
  State<SummarizeButton> createState() => _SummarizeButtonState();
}

class _SummarizeButtonState extends State<SummarizeButton> {
  bool _loading = false;
  String? _summary;
  String? _error;

  /// GraphQL mutation for text summarization
  static const String summarizeMutation = '''
    mutation Summarize(\$input: SummarizeInput!) {
      summarize_t5_summarizeText(input: \$input) {
        summary
        originalLength
        summaryLength
        postId
      }
    }
  ''';

  /// Make a direct HTTP GraphQL request with extended timeout for AI processing
  /// This avoids the stream timeout issue when AI takes time to generate summaries
  Future<Map<String, dynamic>> _directGraphQLRequest({
    required String query,
    required Map<String, dynamic> variables,
  }) async {
    final token = GraphqlConfig.token;
    final orgURI = GraphqlConfig.orgURI;
    
    print('[SummarizeT5] Making direct HTTP GraphQL request to: $orgURI');
    
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
      const Duration(seconds: 60), // 60 seconds for AI processing
      onTimeout: () {
        throw Exception('AI summarization timed out after 60 seconds. The text might be too long.');
      },
    );
    
    print('[SummarizeT5] HTTP Response status: ${response.statusCode}');
    
    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
    
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    
    if (responseData.containsKey('errors')) {
      final errors = responseData['errors'] as List;
      throw Exception(errors.first['message'] ?? 'Unknown error');
    }
    
    return responseData['data'] as Map<String, dynamic>;
  }

  Future<void> _handleSummarize() async {
    if (widget.caption.trim().isEmpty) {
      setState(() {
        _error = 'No text content to summarize';
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      _summary = null;
    });

    try {
      print('[SummarizeT5] Starting summarization request...');
      
      // Use direct HTTP request to bypass GraphQL client stream timeout
      final data = await _directGraphQLRequest(
        query: summarizeMutation,
        variables: {
          'input': {
            'text': widget.caption,
            'postId': widget.postId,
          },
        },
      );

      final summaryData = data['summarize_t5_summarizeText'];
      if (summaryData == null || summaryData['summary'] == null) {
        throw Exception('Empty summary returned');
      }

      print('[SummarizeT5] Summary generated successfully');
      
      setState(() {
        _summary = summaryData['summary'] as String;
        _loading = false;
      });
    } catch (e) {
      print('[SummarizeT5] Error: $e');
      setState(() {
        _error = e.toString().contains('Exception:') 
            ? e.toString().split('Exception:').last.trim()
            : e.toString().replaceAll('Exception: ', '');
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show button if no summary yet
          if (_summary == null && !_loading)
            OutlinedButton.icon(
              onPressed: _handleSummarize,
              icon: const Icon(Icons.smart_toy, size: 16),
              label: const Text(
                'Summarize',
                style: TextStyle(fontSize: 12),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.primaryColor,
                side: BorderSide(color: theme.primaryColor),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),

          // Loading indicator
          if (_loading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Generating summary...',
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

          // Error message
          if (_error != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, size: 14, color: Colors.red.shade700),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Summary display
          if (_summary != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey.shade700
                      : Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 14,
                        color: theme.primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Summary:',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _summary!,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
