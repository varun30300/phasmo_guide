import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  TextStyle mapNotSelected = TextStyle(
    fontSize: 15,
    color: Color(0xFFAC3131),
  );
  TextStyle mapSelected = TextStyle(
    fontSize: 15,
    color: Color(0xFFAC3131),
  );

  var currMap = "Tanglewood";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = 0.9;
    double imageHeight = 0.5;
    var mapsData = {
      "Tanglewood": {
        "Basement": Image.asset('maps/tanglewood/Basement.png',
            width: screenWidth * imageWidth, height: screenWidth * imageHeight),
        "Ground Floor": Image.asset(
          'maps/tanglewood/GroundFloor.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
      },
      "Ridgeview": {
        "1st Floor": Image.asset(
          'maps/ridgewood/1stFloor.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
        "Basement": Image.asset(
          'maps/ridgewood/Basement.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
        "Ground Floor": Image.asset(
          'maps/ridgewood/GroundFloor.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
      },
      "Grafton": {
        "1st Floor": Image.asset(
          'maps/grafton/1stFloor.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
        "Ground Floor": Image.asset(
          'maps/grafton/GroundFloor.png',
          width: screenWidth * imageWidth,
          height: screenWidth * imageHeight,
        ),
      },
      "Bleasdale": {},
      "Edgefield": {},
      "Willow": {},
      "Brownstone": {},
      "Prison": {},
      "Asylum": {},
    };
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Wrap(
                  children: [
                    mapButton('Bleasdale'),
                    mapButton('Edgefield'),
                    mapButton('Grafton'),
                    mapButton('Ridgeview'),
                    mapButton('Tanglewood'),
                    mapButton('Willow'),
                    mapButton('Brownstone'),
                    mapButton('Prison'),
                    mapButton('Asylum'),
                  ],
                ),
                Text(
                  currMap,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Row(
                    children: mapsData[currMap]!.keys.map((e) {
                      return Text(
                        e,
                        style: TextStyle(color: Colors.white),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mapButton(String mapName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            currMap = mapName;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: currMap == mapName ? Color(0xFFAC3131) : Color(0xFF1A1A1A),
            border: Border.all(
              color: Color(0xFFAC3131),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mapName,
              style: TextStyle(
                fontSize: 15,
                color:
                    currMap == mapName ? Color(0xFF1A1A1A) : Color(0xFFAC3131),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
