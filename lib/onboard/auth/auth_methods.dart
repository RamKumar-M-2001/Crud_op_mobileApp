import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signUpUser(
      String email, String userName, String password) async {
    if (email.isNotEmpty && userName.isNotEmpty && password.isNotEmpty) {
      UserCredential cred = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });

      await firestore
          .collection("users")
          .doc(cred.user?.uid)
          .set({"userName": userName, "email": email, "uid": cred.user!.uid});
    }
  }

  Future<void> signinuser(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) ;
  }

  Future<void> signoutuser() async {
    await auth.signOut();
  }

  Future<void> forgotpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
