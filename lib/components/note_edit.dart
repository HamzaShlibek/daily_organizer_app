import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';
import '../provider/note_database.dart';

class NoteEdit extends StatefulWidget {
  final int index;
  final List<Note> notes;
  final TextEditingController controller;

  const NoteEdit({
    super.key,
    required this.index,
    required this.notes,
    required this.controller,
  });

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _screenWidth = _mediaQuery.size.width;
    final _screenHeight = _mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: _screenWidth,
        height: _screenHeight,
        padding: const EdgeInsets.all(12),
        child: TextField(
          autofocus: true,
          controller: widget.controller,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NoteDatabase>().updateNote(
            widget.notes[widget.index].id,
            widget.controller.text,
          );

          widget.controller.clear();

          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
