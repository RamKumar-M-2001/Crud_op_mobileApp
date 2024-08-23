// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/onboard/auth/crud/hive/hive_notes_meth.dart';
import 'package:master_go_replication/onboard/auth/crud/notes_methods.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  TextEditingController controller = TextEditingController();
  HiveNotesMeth hiveNotesMeth = HiveNotesMeth();
  void showPopUp({int? Index}) {
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
                    if (Index == null) {
                      hiveNotesMeth.createNote(controller.text);
                      setState(() {});
                    } else {
                      hiveNotesMeth.updateNote(Index, controller.text);
                      setState(() {});
                    }
                    // HiveNotesMeth.CreateNote(controller.text);
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
    List<String> notesList = hiveNotesMeth.getNotes();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hive CRUD"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showPopUp,
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                      title: Text(
                        (notesList[index]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                hiveNotesMeth.deleteNote(index);
                                setState(() {});
                                Fluttertoast.showToast(msg: "Deleted...");
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                            icon: const Icon(Icons.settings),
                            onPressed: () => showPopUp(Index: index),
                          ),
                        ],
                      )),
                );
              }),
        ));
  }
}
