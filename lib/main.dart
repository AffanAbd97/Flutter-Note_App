import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providers/note_provider.dart';
import 'package:test_flutter/screens/create_screen.dart';
import 'package:test_flutter/screens/edit_screen.dart';
import 'package:test_flutter/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create': (context) => CreateScreen(),
          '/edit': (context) => const EditScreen(),
        },
      ),
    );
  }
}
