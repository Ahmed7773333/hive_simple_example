import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/note.dart';
import 'package:hive_example/widgets/button.dart';
import 'package:hive_example/widgets/text_field.dart';

// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final String titleHint = 'Title';
  final String detailHint = 'Details';
  Box<Note> notesBox = Hive.box<Note>('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                addNotes(titleController.text, detailsController.text);
                Navigator.pop(context);
              },
              data: 'Save',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  void addNotes(String title, String details) {
    Note note = Note(title: title, details: details);
    notesBox.add(note);
  }
}
