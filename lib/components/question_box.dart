import 'package:flutter/material.dart';

class QuestionBox extends StatefulWidget {
  final String questionTitle;

  const QuestionBox({
    super.key,
    required this.questionTitle,
  });

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            widget.questionTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
