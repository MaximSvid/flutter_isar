import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This screen serves as the home screen of the application.
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the details screen when the button is pressed
          context.go('/details');
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}