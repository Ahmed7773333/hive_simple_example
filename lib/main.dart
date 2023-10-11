import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/note.dart';
import 'package:hive_example/screens/show_screen.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(const HiveExample());
}

class HiveExample extends StatelessWidget {
  const HiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShowScreen(),
    );
  }
}
