import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:master_go_replication/firebase_options.dart';
import 'package:master_go_replication/onboard/auth/crud/hive/hive_screen.dart';
import 'package:master_go_replication/onboard/auth/crud/home_screen.dart';
import 'package:master_go_replication/onboard/auth/home/api/user_list_screen.dart';
import 'package:master_go_replication/onboard/onboard_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>("notesBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HiveScreen());
  }
}
