import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.text,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  final void Function() onPressedEdit;
  final void Function() onPressedDelete;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Wrap(
          children: [
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // edit button
                  IconButton(
                    onPressed: onPressedEdit,
                    icon: const Icon(Icons.edit),
                  ),

                  // delete button
                  IconButton(
                    onPressed: onPressedDelete,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
