import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardScreen4 extends StatelessWidget {
  const OnboardScreen4({super.key});

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
                  "Create \n order ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: HexColor("#525464"),
                      fontSize: 50),
                ),
                Image.asset("assets/images/o4.png"),
                const Text("It's easy, just click on the plus"),
                const Text(""),
                ElevatedButton(
                  onPressed: () {
                    print("what up");
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(82, 82),
                      shape: CircleBorder(),
                      backgroundColor: HexColor("#20C3AF")
                      // color:
                      ),
                  child: Icon(
                    Icons.add,
                    size: 34,
                    color: Colors.white,
                  ),
                  // backgroundColor: Colors.blue,
                )
                // InkWell(
                //   onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                // builder: (context) => const OnboardScreen4())),
                //   child: Container(
                //     height: 40,
                //     width: 120,
                //     color: HexColor("#20C3AF"),
                //     child: Center(
                //       child: Text(
                //         "Next",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
