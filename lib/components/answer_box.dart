import 'package:flutter/material.dart';

class AnswerBox extends StatefulWidget {
  final String answer;
  final Function() onAnswer;

  const AnswerBox({
    super.key,
    required this.onAnswer,
    required this.answer,
  });

  @override
  State<AnswerBox> createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onAnswer,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              widget.answer,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
