
import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/model/note.dart';
import 'package:flutter_datenbank_isar/repo/note_repository.dart';
/// ViewModel for managing the home screen state in a Flutter application.
/// This class extends ChangeNotifier to notify listeners about changes in the state.
/// It interacts with the NoteRepository to perform CRUD operations on notes.
class HomeViewModel extends ChangeNotifier{
    final NoteRepository _noteRepository;
    HomeViewModel(this._noteRepository){
        // Initialize the view model, e.g., load initial data
        loadNotes();
    }
// Property to hold the list of notes
    List<Note> _notes = [];
    List<Note> get notes => _notes;
// Property to indicate if notes are currently being loaded
    bool _isLoading = false;
    bool get isLoading => _isLoading;

// Method to load all notes from the repository
    Future<void> loadNotes() async {
        _isLoading = true;
        notifyListeners();
        try {
            _notes = await _noteRepository.getAllNotes();
        } catch (e) {
            // Handle error, e.g., show a message to the user
            print("Error loading notes: $e");
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

// Method to add a new note
    Future<void> addNote(String title, String description, int count) async {
        final newNote = Note()
            ..title = title
            ..description = description
            ..count = count
            ..createdAt = DateTime.now();
        try {
            await _noteRepository.addNote(newNote);
            await loadNotes(); // Reload notes after adding
        } catch (e) {
            // Handle error, e.g., show a message to the user
            print("Error adding note: $e");
        }
    }
}