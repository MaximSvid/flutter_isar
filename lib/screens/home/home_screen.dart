import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

/// This screen serves as the home screen of the application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body:
          viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: viewModel.notes.length,
                itemBuilder: (context, index) {
                  final note = viewModel.notes[index];
                  return ListTile(
                    title: Text(note.title ?? 'No Title'),
                    subtitle: Text(note.description ?? 'No Description'),
                    trailing: Text('Count: ${note.count ?? 0}'),
                    // onTap: () {
                    //   // Handle note tap, e.g., navigate to detail screen
                    //   context.go('/note/${note.id}');
                    // },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.addNote('New Note', 'This is a new note description', 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
