import 'package:flutter/material.dart ';
import '../models/note.dart';

class NoteProvider with ChangeNotifier {
  final List<Note> _notes = [];
  List<Note> get notes => _notes;

  void addNote(String title, String content) {
    final newNote =
        Note(id: DateTime.now().toString(), title: title, content: content);
    _notes.add(newNote);
    notifyListeners();
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void updateNote(String id, String title, String content) {
    final editedNote = _notes.indexWhere((note) => note.id == id);

    if (editedNote != -1) {
      _notes[editedNote] = Note(id: id, title: title, content: content);
    }
    notifyListeners();
  }
}
