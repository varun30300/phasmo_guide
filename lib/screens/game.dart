import 'package:flutter/material.dart';
import 'package:phasmo_guide/components/narrowDown.dart';
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
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.censtarter,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/ham.png"),
                ),
                SizedBox(
                  width: 75,
                ),
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
          ],
        ),
      ),
    );
  }
}
