import 'package:flutter/material.dart';
import 'package:phasmo_guide/gameData.dart';

class NarrowDown extends StatefulWidget {
  const NarrowDown({Key? key}) : super(key: key);

  @override
  _NarrowDownState createState() => _NarrowDownState();
}

class _NarrowDownState extends State<NarrowDown> {
  var currentFilter = [];
  var updatedList = [];
  bool isVisible = false;
  var selectedGhostInfo = "";
  String selectedGhostEvidence1 = "";
  String selectedGhostEvidence2 = "";
  String selectedGhostEvidence3 = "";
  String selectedGhostStr = "";
  String selectedGhostWeak = "";
  TextStyle internalUseOnly = TextStyle(
    color: Color(0xFFA5A0A0),
    fontSize: 15,
  );
  var isSelected = {
    "SB": false,
    'GO': false,
    'DP': false,
    'FP': false,
    'GR': false,
    'FT': false,
    'EM': false,
  };
  var isDisabled = {
    "SB": false,
    'GO': false,
    'DP': false,
    'FP': false,
    'GR': false,
    'FT': false,
    'EM': false,
  };

  @override
  void initState() {
    super.initState();
    var temp = [];
    temp.addAll(allGhosts);
    setState(() {
      updatedList = temp;
    });
  }

  checkDisabledEquip() {
    isDisabled.keys.forEach((element) {
      if ((updatedList
          .any((item) => evidenceSpecific[element]!.contains(item)))) {
        isDisabled[element] = false;
      } else {
        setState(() {
          isDisabled[element] = true;
        });
      }
    });
    print(isDisabled);
  }

  updateList() {
    var tempGhosts = [];
    tempGhosts.addAll(allGhosts);
    currentFilter.forEach((element) {
      tempGhosts
          .removeWhere((item) => !evidenceSpecific[element]!.contains(item));
    });
    setState(() {
      updatedList = tempGhosts;
    });
    checkDisabledEquip();
  }

  canAddMoreFilter() {
    if (currentFilter.length == 3) return false;
    return true;
  }

  addFilter(String filter) {
    if (canAddMoreFilter()) {
      if (currentFilter.contains(filter)) {
        setState(() {
          isSelected[filter] = false;
        });
        currentFilter.remove(filter);
        updateList();
      } else {
        setState(() {
          isSelected[filter] = true;
        });
        currentFilter.add(filter);
        updateList();
      }
    } else {
      if (currentFilter.contains(filter)) {
        setState(() {
          isSelected[filter] = false;
        });
        currentFilter.remove(filter);
        updateList();
      } else
        print("Cannot add more filter");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      isDisabled["SB"] ?? true ? null : addFilter("SB");
                    },
                    child: evidenceButton(
                        "SB", isSelected["SB"], isDisabled["SB"]),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      isDisabled["GO"] ?? true ? null : addFilter("GO");
                    },
                    child: evidenceButton(
                        "GO", isSelected["GO"], isDisabled["GO"]),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      isDisabled["DP"] ?? true ? null : addFilter("DP");
                    },
                    child: evidenceButton(
                        "DP", isSelected["DP"], isDisabled["DP"]),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      isDisabled["FP"] ?? true ? null : addFilter("FP");
                    },
                    child: evidenceButton(
                        "FP", isSelected["FP"], isDisabled["FP"]),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      isDisabled["GR"] ?? true ? null : addFilter("GR");
                    },
                    child: evidenceButton(
                        "GR", isSelected["GR"], isDisabled["GR"]),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      isDisabled["FT"] ?? true ? null : addFilter("FT");
                    },
                    child: evidenceButton(
                        "FT", isSelected["FT"], isDisabled["FT"]),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      isDisabled["EM"] ?? true ? null : addFilter("EM");
                    },
                    child: evidenceButton(
                        "EM", isSelected["EM"], isDisabled["EM"]),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  shrinkWrap: true,
                  itemCount: allGhosts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.0,
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return (updatedList.contains(allGhosts[index])
                        ? GestureDetector(
                            onTapDown: (tapDownDetails) {
                              setState(() {
                                isVisible = true;
                                selectedGhostInfo = allGhosts[index];
                                selectedGhostEvidence1 =
                                    (abtGhosts[selectedGhostInfo]!['evidence1'])
                                        .toString();
                                selectedGhostEvidence2 =
                                    (abtGhosts[selectedGhostInfo]!['evidence2'])
                                        .toString();
                                selectedGhostEvidence3 =
                                    (abtGhosts[selectedGhostInfo]!['evidence3'])
                                        .toString();
                                selectedGhostStr =
                                    (abtGhosts[selectedGhostInfo]!['strength'])
                                        .toString();
                                selectedGhostWeak =
                                    (abtGhosts[selectedGhostInfo]!['weakness'])
                                        .toString();
                              });
                            },
                            onTapUp: (tapUpDetails) {
                              setState(() {
                                isVisible = false;
                                selectedGhostInfo = "";
                              });
                            },
                            onVerticalDragStart: (dragStartDetails) {
                              setState(() {
                                isVisible = false;
                                selectedGhostInfo = "";
                              });
                            },
                            onHorizontalDragStart: (dragStartDetails) {
                              setState(() {
                                isVisible = false;
                                selectedGhostInfo = "";
                              });
                            },
                            child: Container(
                              color: selectedGhostInfo == allGhosts[index]
                                  ? Color(0xFFAC3131)
                                  : Color(0xFF232222),
                              child: Center(
                                child: Text(
                                  allGhosts[index],
                                  style: TextStyle(
                                    color: Color(0xFFD6D6D6),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              allGhosts[index],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ));
                  })
            ],
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Color(0xFF232222),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        selectedGhostEvidence1,
                        style: TextStyle(
                          color: Color(0xFFAC3131),
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        selectedGhostEvidence2,
                        style: TextStyle(
                          color: Color(0xFFAC3131),
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        selectedGhostEvidence3,
                        style: TextStyle(
                          color: Color(0xFFAC3131),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Strength : " + selectedGhostStr,
                    style: internalUseOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Weakness : " + selectedGhostWeak,
                    style: internalUseOnly,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget evidenceButton(String buttonName, bool? isSelected, bool? isDisabled) {
    double side = 60;
    return Container(
      width: side,
      height: side,
      decoration: BoxDecoration(
        color: isSelected ?? true ? Color(0xFFAC3131) : Color(0xFF1A1A1A),
        border: Border.all(
          width: 4,
          color: isDisabled ?? false ? Color(0xFFA5A0A0) : Color(0xFFAC3131),
        ),
      ),
      child: Center(
        child: Text(
          '$buttonName',
          style: TextStyle(
            fontSize: 20,
            color: isDisabled ?? false
                ? Color(0xFFA5A0A0)
                : isSelected ?? true
                    ? Color(0xFF1A1A1A)
                    : Color(0xFFAC3131),
          ),
        ),
      ),
    );
  }
}
