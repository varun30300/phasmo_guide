import 'package:flutter/material.dart';

class QuestionButton extends StatefulWidget {
  const QuestionButton({Key? key}) : super(key: key);

  @override
  _QuestionButtonState createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  @override
  Widget build(BuildContext context) {
    createAlertDialog(BuildContext context) {
      var sbQuestions = [
        "Are you here?",
        "Is there anyone here?",
        "Where are you?",
        "How old/young are you?",
        "What do you want?",
        "Show yourself",
        "Give us a sign",
        "Talk to me/us",
        "Open a door",
        "Turn on/off the light",
      ];
      var ouijaQuestions = [
        "Did you murder?",
        "How old are you?",
        "How long have you been dead?",
        "How many are in this room?",
        "Are you alone?",
        "Where is your room?",
        "Are you close?",
        "Are you near?",
        "Who did you kill?",
        "Are there any spirits?",
      ];

      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Color(0xFF232222),
              content: Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Spirit Box Question",
                        style: TextStyle(
                          color: Color(0xFFAC3131),
                          fontSize: 25,
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: sbQuestions.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sbQuestions[index],
                              style: TextStyle(
                                color: Color(0xFFA5A0A0),
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: Text(
                        "Ouija Board Question",
                        style: TextStyle(
                          color: Color(0xFFAC3131),
                          fontSize: 25,
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: ouijaQuestions.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ouijaQuestions[index],
                              style: TextStyle(
                                color: Color(0xFFA5A0A0),
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFAC3131),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return ElevatedButton(
      onPressed: () {
        createAlertDialog(context);
      },
      child: Text("Questions"),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10),
        primary: Color(0xFFAC3131),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    );
  }
}
