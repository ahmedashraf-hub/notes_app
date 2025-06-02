import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EidtNoteView extends StatelessWidget {
  const EidtNoteView({super.key});
  static String id = 'edit_note_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody());
  }
}
