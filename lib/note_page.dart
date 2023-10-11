import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/note.dart';
import 'package:hive_example/widgets/button.dart';
import 'package:hive_example/widgets/text_field.dart';

class NotePage extends StatefulWidget {
  final int index;
  const NotePage({Key? key, required this.index}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final formKey = GlobalKey<FormState>();
  final String titleHint = 'Title';
  final String detailHint = 'Details';
  late Box<Note> notesBox;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notesBox = Hive.box<Note>('notes');
    if (widget.index < notesBox.length) {
      titleController.text = notesBox.getAt(widget.index)?.title ?? '';
      detailsController.text = notesBox.getAt(widget.index)?.details ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'note number ${widget.index}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(controller: titleController, hint: titleHint),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(controller: detailsController, hint: detailHint),
            const SizedBox(
              height: 50,
            ),
            CustomElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  updateNotes(titleController.text, detailsController.text);
                  Navigator.pop(context);
                }
              },
              data: 'update',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  void updateNotes(String title, String details) {
    Note note = Note(title: title, details: details);
    notesBox.putAt(widget.index, note);
  }
}
