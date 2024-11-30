import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App Flutter"),
        centerTitle: true,
      ),
      body: noteProvider.notes.isEmpty
          ? const Center(child: Text('No Notes!!!'))
          : ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                final note = noteProvider.notes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit', arguments: note);
                  },
                  child: NoteCard(note: note),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
          child: const Icon(Icons.add)),
    );
  }
}
