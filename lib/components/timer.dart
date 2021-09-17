import 'dart:async';

import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  @override
  _TimerComponentState createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  var isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  void addTime() {
    final addSecond = 1;
    setState(() {
      final seconds = duration.inSeconds + addSecond;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void resetTimer() {
    setState(() => timer?.cancel());
    setState(() {
      duration = Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTime(),
          isRunning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //reset button
                    ElevatedButton(
                      onPressed: () {
                        resetTimer();
                        setState(() {
                          isRunning = false;
                        });
                      },
                      child: Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        primary: Color(0xFFAC3131),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    )
                  ],
                )
              // start timer
              : ElevatedButton(
                  onPressed: () {
                    startTimer();
                    setState(() {
                      isRunning = true;
                    });
                  },
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    primary: Color(0xFFAC3131),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours);
    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        letterSpacing: 6,
        fontSize: 40,
        color: Color(0xFFD6D6D6),
      ),
    );
  }
}
