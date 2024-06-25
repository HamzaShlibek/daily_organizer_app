import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toolkit_app/models/note_model.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize Database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // list of notes
  final List<Note> currentNotes = [];

  // Create - a note and save to db
  Future<void> addNote(String textFromUser) async {
    
    // create new note object
    final newNote = Note()..text = textFromUser;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from db
    fetchNotes();
  }

  // Read - notes from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // Update - a note in db
  Future<void> updateNote(int id, String newText) async {
    final existingNotes = await isar.notes.get(id);
    if (existingNotes != null) {
      existingNotes.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNotes));
      await fetchNotes();
    }
  }

  // Delete - a note from db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
