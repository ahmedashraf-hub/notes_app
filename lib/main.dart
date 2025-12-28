import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/eidt_note_view.dart';
import 'package:notes_app/views/home_veiw.dart'; // Note: File name has typo but class is renamed to HomeView

void main() async {
  await Hive.initFlutter();

  // Register the adapter before opening the box
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(NotesAPP());
}

class NotesAPP extends StatelessWidget {
  const NotesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => HomeView(),
        EidtNoteView.id: (context) => EidtNoteView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
