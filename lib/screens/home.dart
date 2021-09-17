import 'package:flutter/material.dart';
import 'package:phasmo_guide/screens/game.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Phasmophobia.png',
              width: screenWidth * .8,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Game()),
                );
              },
              child: Text('Start Game'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                primary: Color(0xFFAC3131),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
