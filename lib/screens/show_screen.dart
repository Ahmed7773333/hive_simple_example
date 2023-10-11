import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/note.dart';

import '../note_page.dart';
import 'add_note.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  Box<Note> notesBox = Hive.box<Note>('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddNote(),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text(
          'Show',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notesBox.length,
        itemBuilder: (BuildContext context, int index) => OpenContainer(
          closedElevation: 0,
          openElevation: 0,
          closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          transitionDuration: const Duration(milliseconds: 500),
          closedColor: Colors.transparent,
          openColor: Colors.transparent,
          closedBuilder: (BuildContext context, void Function() action) =>
              ListTile(
            title: Text(notesBox.getAt(index)?.title ?? 'no title found'),
            subtitle:
                Text(notesBox.getAt(index)?.details ?? 'no details found'),
            trailing: InkWell(
              onTap: () async {
                setState(() {
                  notesBox.deleteAt(index);
                });
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          openBuilder: (BuildContext context, void Function() action) =>
              NotePage(index: index),
          onClosed: (close) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
