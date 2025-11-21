import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

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
                  AppLocalizations.of(context)!
                      .strictTranslate('Server URL'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                if (urlController.text.isNotEmpty)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
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
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .strictTranslate('Enter Server URL'),
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
                  onPressed: () => onUpdateUrl(urlController.text),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.strictTranslate('Save'),
                  ),
                ),
              ),
            ],
          )
        else
          // Show current URL when collapsed
          if (urlController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                urlController.text,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      ],
    );
  }
}
