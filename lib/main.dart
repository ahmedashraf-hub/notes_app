import 'package:flutter/material.dart';
import 'package:notes_app/views/eidt_note_view.dart';
import 'package:notes_app/views/home_veiw.dart';

void main() {
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
        HomeVeiw.id: (context) => HomeVeiw(),
        EidtNoteView.id: (context) => EidtNoteView(),
      },
      initialRoute: HomeVeiw.id,
    );
  }
}
