import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Insured \n orders ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: HexColor("#525464"),
                      fontSize: 50),
                ),
                Image.asset("assets/images/o3.png"),
                const Text(r"We insure each order for the amount of $500"),
                const Text(""),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardScreen3())),
                  child: Container(
                    height: 40,
                    width: 120,
                    color: HexColor("#20C3AF"),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
