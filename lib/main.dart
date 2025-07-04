import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/model/note.dart';
import 'package:flutter_datenbank_isar/navigation/go_router.dart';
import 'package:flutter_datenbank_isar/repo/note_repository.dart';
import 'package:flutter_datenbank_isar/view_model/home_view_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
/// This is the main entry point of the Flutter application.
/// It initializes the app and sets up the routing configuration.
/// The app uses the GoRouter package for navigation and routing.
/// The main widget is `MyApp`, which is a stateless widget that builds the
/// `MaterialApp.router` with the defined router configuration.
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//       title: 'Flutter Datenbank Isar',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  // 1. Isar initialisieren
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [NoteSchema], // Schemas für die Isar-Datenbank
    directory: dir.path, // Verzeichnis für die Isar-Datenbank

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
