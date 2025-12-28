import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(controller: titleController, hint: 'title'),
          const SizedBox(height: 16),
          CustomTextField(
            controller: contentController,
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          CustomButton(onPressed: addNote),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void addNote() {
    if (formKey.currentState!.validate()) {
      final note = NoteModel(
        title: titleController.text,
        subTitle: contentController.text,
        data: contentController.text,
        color: 0XFFFFCC80, // Default color
      );

      final notesBox = Hive.box<NoteModel>(kNotesBox);
      notesBox.add(note);

      // Clear the text fields and close the modal
      titleController.clear();
      contentController.clear();
      Navigator.pop(context);
    }
  }
}
