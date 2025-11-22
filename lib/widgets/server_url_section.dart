import 'package:flutter/material.dart';
import 'package:talawa/utils/validators.dart';

/// A reusable widget for displaying and managing server URL configuration.
///
/// This widget provides a collapsible UI for:
/// - Displaying the current server URL
/// - Expanding/collapsing the URL input field
/// - Validating and updating the URL
/// - Showing visual feedback (checkmark when URL is set)
///
/// Used in both login and signup screens to avoid code duplication.
class ServerUrlSection extends StatelessWidget {
  /// Creates a ServerUrlSection widget.
  ///
  /// **params**:
  /// * `urlController`: TextEditingController for the URL input field
  /// * `showUrlField`: Whether to show the expanded URL input field
  /// * `urlFocus`: FocusNode for the URL input field
  /// * `onToggle`: Callback when the expand/collapse button is pressed
  /// * `onUpdateUrl`: Async callback to validate and update the URL
  const ServerUrlSection({
    required this.urlController,
    required this.showUrlField,
    required this.urlFocus,
    required this.onToggle,
    required this.onUpdateUrl,
    super.key,
  });

  /// Text controller for the URL input field.
  final TextEditingController urlController;

  /// Whether the URL input field is currently shown.
  final bool showUrlField;

  /// Focus node for the URL input field.
  final FocusNode urlFocus;

  /// Callback when the expand/collapse toggle is pressed.
  final VoidCallback onToggle;

  /// Callback to validate and update the server URL.
  final Future<bool> Function(String) onUpdateUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row with "Server URL" label and toggle button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Server URL',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: urlController,
                  builder: (context, value, child) {
                    if (value.text.isNotEmpty) {
                      return const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                showUrlField ? Icons.keyboard_arrow_up : Icons.edit,
                size: 20,
              ),
              onPressed: onToggle,
            ),
          ],
        ),

        // Collapsible URL input field
        if (showUrlField)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: urlController,
                focusNode: urlFocus,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
                autofillHints: const <String>[AutofillHints.url],
                enableSuggestions: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null; // Allow empty - will use default server
                  }
                  return Validator.validateURL(value.trim());
                },
                decoration: InputDecoration(
                  hintText: 'Enter Server URL',
                  helperText: 'Leave empty to use default server',
                  helperMaxLines: 2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await onUpdateUrl(urlController.text);
                    } catch (e) {
                      // Error is already handled by the service showing snackbar
                      print('Error updating URL: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                  ),
                ),
              ),
            ],
          )
        else
          // Show current URL when collapsed
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: urlController,
            builder: (context, value, child) {
              if (value.text.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    value.text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
      ],
    );
  }
}
