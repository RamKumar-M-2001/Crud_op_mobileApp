import 'package:cloud_firestore/cloud_firestore.dart';

class NotesMethods {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  Future<void> CreateNote(String note) async {
    await notes.add({"note": note, "timestamp": DateTime.now()});
  }

  Stream<QuerySnapshot> getNotes() {
    final noteStream = notes.orderBy("timestamp", descending: true).snapshots();
    return noteStream;
  }

  Future<void> updateNote(String docId, String updateNote) async {
    await notes
        .doc(docId)
        .update({"note": updateNote, "timestamp": DateTime.now()});
  }

  Future<void> deleteNote(String docId) async {
    await notes.doc(docId).delete();
  }
}
