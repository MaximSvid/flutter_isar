import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/model/note.dart';
import 'package:flutter_datenbank_isar/navigation/go_router.dart';
import 'package:flutter_datenbank_isar/repo/note_repository.dart';
import 'package:flutter_datenbank_isar/view_model/home_view_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

/// Main entry point of the Flutter application.
/// This function initializes the Isar database, sets up the repository and view model,
/// and runs the application with the provided router configuration.
/// It uses ChangeNotifierProvider to provide the HomeViewModel to the widget tree,
/// allowing widgets to listen for changes in the view model's state.
/// The application is built using MaterialApp.router, which allows for declarative routing
/// using the GoRouter package.
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  // 1. Isar initialisieren
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [NoteSchema], // Schemas für die Isar-Datenbank
    directory: dir.path, // Verzeichnis für die Isar-Datenbank
    inspector: true, // Aktiviert den Isar-Inspektor

  // 2. Repositrory und ViewModel initialisieren
  );
  final noteRepository = NoteRepository(isar);
  final homeViewModel = HomeViewModel(noteRepository);
  runApp(
    ChangeNotifierProvider(
      create: (context) => homeViewModel,
      child: const MyApp(),
      )
  );
}
// 3. MyApp Klasse
/// This class represents the main application widget.
/// It uses MaterialApp.router to set up the application's routing configuration
/// using the GoRouter package. The application has a title, a primary color theme,
/// and disables the debug banner.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Datenbank Isar',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
