import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:login_auth_two_purple/neo_utils/neo_button.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../neo_utils/neo_button_two.dart';

class HomeSreeen extends StatefulWidget {
  @override
  State<HomeSreeen> createState() => _HomeSreeenState();
}

class _HomeSreeenState extends State<HomeSreeen> {
  var upperDisplayText = "464";
  var displayText = "1234";
  var nextNum = false;
  var num1 = 0;
  var num2 = 0;

  List buttonTexts = [
    "1",
    "2",
    "3",
    "SPACE",
    "4",
    "5",
    "6",
    "DEL",
    "7",
    "8",
    "9",
    "CLR",
    "0",
    "+",
    "-",
    "=",
  ];

  void buttonPressed(var addedText) {
    displayText = displayText + addedText;
  }

  void buttonPressedUpper(var addedText) {
    upperDisplayText = upperDisplayText + addedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(3),
          height: 530,
          width: 420,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                inset: false,
                blurRadius: 2,
                offset: Offset(-4, -4),
              ),
              BoxShadow(
                color: Colors.grey.shade600,
                inset: false,
                blurRadius: 2,
                offset: Offset(4, 4),
              )
            ],
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 510,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            inset: true,
                            blurRadius: 2,
                            offset: Offset(-4, -4),
                          ),
                          BoxShadow(
                            color: Colors.grey.shade600,
                            inset: true,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(upperDisplayText),
                            Spacer(),
                          ],
                        ),
                        Text(
                          "${displayText}",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    height: 90,
                    width: double.infinity,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: buttonTexts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (buttonTexts[index] != "CLR" &&
                                  buttonTexts[index] != "DEL" &&
                                  buttonTexts[index] != "SPACE" &&
                                  buttonTexts[index] != "+" &&
                                  buttonTexts[index] != "-" &&
                                  buttonTexts[index] != "=") {
                                setState(() {
                                  buttonPressed(buttonTexts[index]);
                                  buttonPressedUpper(buttonTexts[index]);
                                });
                              } else if (buttonTexts[index] == "CLR") {
                                setState(() {
                                  displayText = "";
                                  upperDisplayText = "";
                                  num1 = 0;
                                  num2 = 0;
                                });
                              } else if (buttonTexts[index] == "DEL") {
                                setState(() {
                                  List tempList = displayText.split("");
                                  tempList.removeLast();
                                  displayText = tempList.join();
                                  // upper text
                                  List tempList2 = upperDisplayText.split("");
                                  tempList2.removeLast();
                                  upperDisplayText = tempList2.join();
                                });
                              } else if (buttonTexts[index] == "SPACE") {
                                setState(() {
                                  buttonPressed(" ");
                                });
                              } else if (buttonTexts[index] == "+") {
                                setState(() {
                                  buttonPressedUpper(buttonTexts[index]);
                                  if (nextNum == false) {
                                    num1 = int.parse(displayText);
                                    nextNum = true;
                                    displayText = "";
                                  } else if (nextNum == true) {
                                    num2 = int.parse(displayText);
                                    nextNum = false;
                                    displayText = "";
                                  }
                                });
                                print("$num1  $num2");
                              } else if (buttonTexts[index] == "=") {
                                setState(() {
                                  if (nextNum == false) {
                                    num1 = int.parse(displayText);
                                    nextNum = true;
                                    displayText = "";
                                  } else if (nextNum == true) {
                                    num2 = int.parse(displayText);
                                    nextNum = false;
                                    displayText = "";
                                  }
                                  displayText = (num1 + num2).toString();
                                  buttonPressedUpper(buttonTexts[index] +
                                      (num1 + num2).toString());
                                });
                                print("$num1  $num2");
                              }
                            },
                            child: TappedNeoButton(
                              upIcon: Text(
                                "${buttonTexts[index]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              myColor: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
