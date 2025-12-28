import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<NoteModel>(kNotesBox).listenable(),
        builder: (context, box, child) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: box.length,
            itemBuilder: (context, index) {
              var note = box.getAt(index)!;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(note: note),
              );
            },
          );
        },
      ),
    );
  }
}
