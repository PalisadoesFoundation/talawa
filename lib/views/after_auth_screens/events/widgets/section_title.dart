import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

/// Widget for section titles.
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  /// The title text.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppLocalizations.of(context)!.strictTranslate(title),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
