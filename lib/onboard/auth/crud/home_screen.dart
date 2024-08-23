// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/onboard/auth/crud/notes_methods.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  NotesMethods notesMethods = NotesMethods();
  void showPopUp({String? docId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: controller,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (docId == null) {
                      notesMethods.CreateNote(controller.text);
                    } else {
                      notesMethods.updateNote(docId, controller.text);
                    }
                    // notesMethods.CreateNote(controller.text);
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showPopUp,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: notesMethods.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, Index) {
                  DocumentSnapshot document = notesList[Index];
                  String docId = document.id;
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        data["note"],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              notesMethods.deleteNote(docId);
                              Fluttertoast.showToast(msg: "Deleted...");
                            } ,
                             icon: const Icon(Icons.delete)),
                          IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => showPopUp(docId: docId),
                      ),
                        ],
                      )
                      
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No notes"),
              );
            }
          }),
    );
  }
}
