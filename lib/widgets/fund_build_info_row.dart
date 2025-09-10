import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

/// A widget that displays a row of information with an icon, label, and value.
class FundBuildInfoRow extends StatelessWidget {
  const FundBuildInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  /// The icon to display in the row.
  final IconData icon;

  /// The label for the information.
  final String label;

  /// The value of the information.
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: SizeConfig.screenHeight! * 0.025,
          color: Colors.white70,
        ),
        SizedBox(width: SizeConfig.screenWidth! * 0.02),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
