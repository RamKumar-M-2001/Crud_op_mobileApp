import 'package:hive/hive.dart';

class HiveNotesMeth {
  final Box<String> notesBox = Hive.box<String>("notesBox");

  createNote(String note) {
    notesBox.add(note);
  }

  List<String> getNotes() {
    return notesBox.values.toList();
  }

  updateNote(int index, String updatednote) {
    notesBox.putAt(index, updatednote);
  }

  deleteNote(int index) {
    notesBox.deleteAt(index);
  }
}
