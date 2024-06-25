// create a note
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/note_database.dart';
import '../models/note_model.dart';

class NoteFunctions {
  static createNote(BuildContext context, TextEditingController textController) {
    showDialog(
      context: context,
      builder: (context) {
        textController.text = '';

        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.createNote),
          content: TextField(
            autofocus: true,
            controller: textController,
            minLines: 3,
            maxLines: null,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // add to db
                context.read<NoteDatabase>().addNote(textController.text);

                // clear controller
                textController.clear();

                // pop dialog box
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.create),
            ),
          ],
        );
      },
    );
  }

  // read notes
  static readNotes(BuildContext context) {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  static updateNote(BuildContext context, Note note, {required TextEditingController textController}) {
    showDialog(
      context: context,
      builder: (context) {
        textController.text = note.text;
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.updateNote),
          content: TextField(
            autofocus: true,
            controller: textController,
            minLines: 3,
            maxLines: null,
          ),
          actions: [
            // update button in db
            TextButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNote(note.id, textController.text);

                // clear controller
                textController.clear();

                // pop dialog box
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.update),
            )
          ],
        );
      },
    );
  }

  // delete a note
  static deleteNote(BuildContext context, int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }
}
