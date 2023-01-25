import 'package:flutter/material.dart';

class TalawaErrorWidget extends StatelessWidget {
  const TalawaErrorWidget({Key? key, required this.errorMessage})
      : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 80,
          decoration: const BoxDecoration(color: Colors.red),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
