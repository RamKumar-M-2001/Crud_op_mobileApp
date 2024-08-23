import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:master_go_replication/onboard/auth_methods.dart';
// import 'package:master_go_replication/home/home_screen.dart';
import 'package:master_go_replication/onboard/auth/auth_methods.dart';
import 'package:master_go_replication/onboard/auth/crud/home_screen.dart';
import 'package:master_go_replication/onboard/signin.dart';
// import 'package:master_go_replication/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isPassHidden1 = true;
  bool isPassHinden2 = true;

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        title: const Text("Sign Up"),
        centerTitle: true,
        actions: const [Icon(Icons.menu)],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/o5.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'Enter UserName',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Enter password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassHidden1 = !isPassHidden1;
                          });
                        },
                        icon: isPassHidden1
                            ? Icon(
                                Icons.visibility_off,
                                color: HexColor('#B0B0C3'),
                              )
                            : Icon(Icons.visibility,
                                color: HexColor('#B0B0C3')))),
                obscureText: isPassHidden1,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    labelText: 'Confirm password',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassHinden2 = !isPassHinden2;
                          });
                        },
                        icon: isPassHinden2
                            ? Icon(
                                Icons.visibility_off,
                                color: HexColor('#B0B0C3'),
                              )
                            : Icon(Icons.visibility,
                                color: HexColor('#B0B0C3')))),
                obscureText: isPassHinden2,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AuthMethods()
                        .signUpUser(_emailController.text,
                            _userNameController.text, _passwordController.text)
                        .then((value) {
                      Fluttertoast.showToast(msg: "signup successful");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    });
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'or',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signin())),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
