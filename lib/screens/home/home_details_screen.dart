
import 'package:flutter/material.dart';

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