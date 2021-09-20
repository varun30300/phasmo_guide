import 'package:flutter/material.dart';
import 'package:phasmo_guide/components/narrowDown.dart';
import 'package:phasmo_guide/components/questionButton.dart';
import 'package:phasmo_guide/components/sideObj.dart';
import 'package:phasmo_guide/components/timer.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Phasmophobia.png',
                      width: screenWidth * .4,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TimerComponent(),
                SizedBox(height: 40),
                NarrowDown(),
                SizedBox(height: 15),
                SideObj(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    QuestionButton(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Maps"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        primary: Color(0xFFAC3131),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("End Game"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        primary: Color(0xFFAC3131),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
