import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_go_replication/onboard/auth/home/api/api_service.dart';
import 'package:master_go_replication/onboard/auth/home/api/model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<usermodel>> futureuser;
  @override
  void initState() {
    futureuser = ApiService().fatchusers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User"),
        ),
        body: FutureBuilder(
            future: futureuser,
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshots.data!.length,
                  itemBuilder: (context, Index) {
                    usermodel user = snapshots.data![Index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Text(user.id.toString()),
                    );
                  });
            }));
    ;
  }
}
