import 'package:flutter_datenbank_isar/model/note.dart';
import 'package:isar/isar.dart';

/// A repository for managing notes.
class NoteRepository {
  final Isar isar;

  NoteRepository(this.isar);

  // Alle Notizen abrufen
  Future<List<Note>> getAllNotes() async {
    return await isar.notes.where().findAll();
  }

  // Eine neue Notiz hinzufügen
  Future<void> addNote(Note note) async {
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
  }

  // Eine Notiz aktualisieren
  Future<void> updateNote(Note note) async {
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
  }

  // Eine Notiz löschen
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() async {
      await isar.notes.delete(id);
    });
  }
}
