// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = HiveTypes.note;

  @override
  Note read(BinaryReader reader) {
    return Note(
      title: reader.read() as String,
      details: reader.read() as String,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..write(obj.title)
      ..write(obj.details);
  }
}
