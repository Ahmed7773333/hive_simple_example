import 'package:hive/hive.dart';
import 'package:hive_example/hive_helper/hive_types.dart';
import 'package:hive_example/hive_helper/hive_adapters.dart';
import 'package:hive_example/hive_helper/fields/note_fields.dart';

part 'note.g.dart';

@HiveType(typeId: HiveTypes.note, adapterName: HiveAdapters.note)
class Note extends HiveObject {
  @HiveField(NoteFields.title)
  String title;
  @HiveField(NoteFields.details)
  String details;
  Note({required this.title, required this.details});
}


// import 'package:hive/hive.dart';

// class Note extends HiveObject {
//   String title;
//   String details;
//   Note({required this.title, required this.details});
// }
