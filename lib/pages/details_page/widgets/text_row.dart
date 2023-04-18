import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String label;
  final String text;

  const TextRow({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              flex: 2,
              child: text.isEmpty
                  ? Text(
                      "Non disponibile",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Text(
                      text,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
            ),
          ],
        ),
      );
}
