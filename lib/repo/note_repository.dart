import 'package:flutter_datenbank_isar/model/note.dart';
import 'package:isar/isar.dart';

/// A repository for managing notes.
/// This class provides methods to interact with the Isar database for CRUD operations on notes.
/// It includes methods to retrieve all notes, add a new note, update an existing note, and delete a note by its ID.
/// Usage of this repository allows for clean separation of data access logic from the rest of the application, promoting better maintainability and testability.
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
