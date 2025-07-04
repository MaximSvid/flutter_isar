import 'package:isar/isar.dart';
part 'note.g.dart';

/// This file defines the Note model for the Isar database.
/// It includes fields for the note's ID, title, description, count, and creation timestamp.
/// The model is annotated with `@collection` to indicate that it is a collection in the Isar database.

@collection // Annotation to indicate that this class is a collection in the Isar database
class Note {
  Id id = Isar.autoIncrement; // Auto-incrementing ID for the note
  String? title; // Title of the note
  String? description; // Description of the note
  int? count; // Optional count field for the note
  DateTime? createdAt; // Timestamp when the note was created
}
