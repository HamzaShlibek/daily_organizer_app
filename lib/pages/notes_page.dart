import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/route_with_transition.dart';
import 'search_bar_page.dart';
import '../provider/note_database.dart';
import '../models/note_model.dart';
import '../components/note_widget.dart';
import '../components/note_functions.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  // text controller to access what the user typed
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // on app startup, fetch existing notes
    NoteFunctions.readNotes(context);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Consumer<NoteDatabase>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.notes),
            centerTitle: true,
            actions: [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: Card(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        createRoute(
                          widget: const SearchBarPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: ListView.separated(
            itemCount: currentNotes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = currentNotes[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: NoteWidget(
                  text: note.text,
                  onPressedEdit: () => NoteFunctions.updateNote(
                    context,
                    note,
                    textController: textController,
                  ),
                  onPressedDelete: () =>
                      NoteFunctions.deleteNote(context, note.id),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 8),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => NoteFunctions.createNote(context, textController),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
