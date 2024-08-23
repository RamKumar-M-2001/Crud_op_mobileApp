import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/onboard/auth/auth_methods.dart';
import 'package:master_go_replication/onboard/signin.dart';
// import 'package:master_go_replication/signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: const Text("Forgot password"),
        centerTitle: true,
        actions: const [Icon(Icons.menu)],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/o5.png", // Replace with your image asset path
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    AuthMethods()
                        .forgotpassword(emailController.text)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Reset password link sent successfully");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()),
                          (route) => false);
                    });
                  }
                },
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("#20C3AF"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
