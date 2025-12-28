import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_button_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String id = 'HomeVeiw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteButtonSheet();
            },
          );
        },
        backgroundColor: Colors.greenAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
