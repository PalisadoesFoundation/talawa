import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

/// Widget for public/private event indicator.
class PublicPrivateChip extends StatelessWidget {
  const PublicPrivateChip({super.key, required this.isPublic});

  /// Whether the event is public.
  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPublic ? Icons.lock_open : Icons.lock,
          size: 14,
          color: isPublic
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 4),
        Text(
          AppLocalizations.of(context)!
              .strictTranslate(isPublic ? 'public' : 'private'),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
