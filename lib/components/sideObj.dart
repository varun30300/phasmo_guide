import 'package:flutter/material.dart';

class SideObj extends StatefulWidget {
  const SideObj({Key? key}) : super(key: key);

  @override
  _SideObjState createState() => _SideObjState();
}

class _SideObjState extends State<SideObj> {
  var selectedObj = [];
  var completedObj = [];
  createAlertDialog(BuildContext context) {
    var tempObj = [];
    var allObj = [
      "Have a member of your team witness a Ghost Event",
      "Capture a photo of the Ghost",
      "Find evidence of the paranormal with an EMF Reader",
      "Detect a Ghosts presence with a Motion Sensor",
      "Cleanse the area near the Ghost using Smudge Sticks",
      "Prevent the Ghost from hunting with a Crucifix",
      "Get a Ghost to walk through Salt",
      "Detect a Ghost presence with a Candle",
      "Escape the Ghost during a Hunt with no deaths",
      "Use Smudge Sticks while the Ghost is hunting a player ",
      "Get an average Sanity below 25%",
    ];

    handleObj(obj, Function _setState) {
      if (tempObj.length < 3) {
        tempObj.contains(obj) ? tempObj.remove(obj) : tempObj.add(obj);
        // print(tempObj);
        _setState();
      } else {
        if (tempObj.contains(obj)) {
          tempObj.remove(obj);
          // print(tempObj);
        }
      }
    }

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            _setState() {
              setState(() {});
            }

            return AlertDialog(
              backgroundColor: Color(0xFFA5A0A0),
              title: Text('Select Side Objectives'),
              content: SizedBox(
                height: 600,
                width: 400,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  itemCount: allObj.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              handleObj(allObj[index], _setState);
                            });
                          },
                          child: Text(
                            allObj[index],
                            style: TextStyle(
                                color: tempObj.contains(allObj[index])
                                    ? Color(0xFFAC3131)
                                    : null),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    selectedObj = tempObj;
                    // print(tempObj);
                    Navigator.pop(context);
                  },
                  child: Text("Confirm"),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(0),
      height: screenHeight * .18,
      width: screenWidth * .9,
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border.all(
          width: 4,
          color: Color(0xFFAC3131),
        ),
      ),
      child: selectedObj.length == 0
          ? Center(
              child: GestureDetector(
                onTap: () {
                  createAlertDialog(context).then((_) {
                    setState(() {});
                  });
                },
                child: Container(
                  color: Color(0xFFA5A0A0),
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Select Objectives",
                      style: TextStyle(
                        fontSize: 20,
                        // color: Color(0xFFA5A0A0),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: selectedObj.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (completedObj.contains(selectedObj[index])) {
                              setState(() {
                                completedObj.remove(selectedObj[index]);
                              });
                            } else {
                              setState(() {
                                completedObj.add(selectedObj[index]);
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              selectedObj[index],
                              style: completedObj.contains(selectedObj[index])
                                  ? TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFFA5A0A0),
                                      fontSize: 15)
                                  : TextStyle(
                                      color: Color(0xFFD6D6D6), fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
