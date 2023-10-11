import 'package:hive/hive.dart';
import 'package:hive_example/note.dart';

void registerAdapters() {
	Hive.registerAdapter(NoteAdapter());
}
