import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/navigation/go_router.dart';
/// This is the main entry point of the Flutter application.
/// It initializes the app and sets up the routing configuration.
/// The app uses the GoRouter package for navigation and routing.
/// The main widget is `MyApp`, which is a stateless widget that builds the
/// `MaterialApp.router` with the defined router configuration.
void main() {
  runApp(const MyApp());
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
