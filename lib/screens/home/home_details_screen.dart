
import 'package:flutter/material.dart';
/// This screen serves as the home details screen of the application.
/// It displays a simple message indicating that the user has navigated to the details screen.
/// The screen is a stateless widget, meaning it does not maintain any state.
class HomeDetailsScreen extends StatelessWidget{
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Details Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Details Screen!',
        ),
      ),
    );
  }
}