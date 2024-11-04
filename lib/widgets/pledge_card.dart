import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_pledges.dart';

/// a_line_ending_with_end_punctuation.
class PledgeCard extends StatelessWidget {
  const PledgeCard({
    super.key,
    required this.pledge,
    required this.onUpdate,
    required this.onDelete,
  });

  /// a_line_ending_with_end_punctuation.
  final Pledge pledge;

  /// a_line_ending_with_end_punctuation.
  final VoidCallback onUpdate;

  /// a_line_ending_with_end_punctuation.
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 21, 99, 25),
              Colors.green.shade300,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pledge Group',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 36, 36),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pledgers',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 0,
                    children: [
                      ...pledge.pledgers!.take(3).map(
                            (pledger) => Chip(
                              avatar: CircleAvatar(
                                backgroundImage: pledger.image != null
                                    ? NetworkImage(pledger.image!)
                                    : null,
                                backgroundColor: pledger.image == null
                                    ? Colors.blue
                                    : Colors.transparent,
                                child: pledger.image == null
                                    ? const Icon(
                                        Icons.person_3,
                                        size: 18,
                                      )
                                    : null,
                              ),
                              label: Text(
                                '${pledger.firstName!} ${pledger.lastName!}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                      if (pledge.pledgers!.length > 3)
                        Chip(
                          label: Text(
                            '+${pledge.pledgers!.length - 3} more',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pledged',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '\$${pledge.amount?.toStringAsFixed(2) ?? 'N/A'}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Donated',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '\$0.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _formatDate(pledge.startDate),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'End Date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _formatDate(pledge.endDate),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.edit),
                        label: const Text('Update'),
                        onPressed: onUpdate,
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                        onPressed: onDelete,
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `date`: define_the_param
  ///
  /// **returns**:
  /// * `String`: define_the_return
  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('MMM d, y').format(date);
  }
}
