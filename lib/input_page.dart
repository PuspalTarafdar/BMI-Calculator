// ignore_for_file: prefer_const_constructors
// ignore: unnecessary_import
import 'package:bmi_cacl/results.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'calculator.dart';

const bottomcontainerheight = 80.0;
const cardcolor = Color.fromARGB(255, 9, 57, 57);
const inactiveCardColor = Color.fromARGB(255, 4, 34, 34);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//1-female,2-male
  void updateColor(Gender selectedgender) {
    if (selectedgender == Gender.female) {
      if (femalecardColor == inactiveCardColor) {
        femalecardColor = cardcolor;
        malecardColor = inactiveCardColor;
      } else {
        femalecardColor = inactiveCardColor;
      }
    }
    if (selectedgender == Gender.male) {
      if (malecardColor == inactiveCardColor) {
        malecardColor = cardcolor;
        femalecardColor = inactiveCardColor;
      } else {
        malecardColor = inactiveCardColor;
      }
    }
  }

  void _incrementcounter() {
    setState(() {
      weight++;
    });
  }

  void _decrementcounter() {
    setState(() {
      weight--;
    });
  }

  void _ageincrementcounter() {
    setState(() {
      age++;
    });
  }

  void _agedecrementcounter() {
    setState(() {
      age--;
    });
  }

  Color femalecardColor = inactiveCardColor;
  Color malecardColor = inactiveCardColor;

  int height = 170;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femalecardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 90.0,
                            color: Color.fromARGB(255, 227, 65, 255),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: malecardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 90.0,
                            color: Color(0xFFFF6363),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: cardcolor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color.fromARGB(255, 0, 255, 162),
                    overlayColor: Color.fromARGB(51, 1, 171, 117),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 220.0,
                    inactiveColor: Colors.grey,
                    onChanged: (double newvalue) {
                      setState(
                        () {
                          height = newvalue.round();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: cardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: _decrementcounter,
                              backgroundColor: Color.fromARGB(255, 25, 87, 87),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: _incrementcounter,
                              backgroundColor: Color.fromARGB(255, 25, 87, 87),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: _agedecrementcounter,
                              backgroundColor: Color.fromARGB(255, 25, 87, 87),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: _ageincrementcounter,
                              backgroundColor: Color.fromARGB(255, 25, 87, 87),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getresults(),
                    resultInterpretation: calc.resultinterpretation(),
                  )));
            },
            child: Container(
              color: Color.fromARGB(255, 6, 68, 41),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 12.0),
              width: double.infinity,
              height: bottomcontainerheight,
              child: Center(
                child: Text('CALCULATE',
                style: TextStyle(
                  fontSize:25.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableCard extends StatelessWidget {
  ReusableCard({Key? key, required this.colour, required this.cardChild})
      : super(key: key);

  Color colour;
  Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(30)),
      child: cardChild,
    );
  }
}

// ignore: must_be_immutable
class RoundiconButton extends StatelessWidget {
  const RoundiconButton({Key? key, required this.icon, required this.onpressed})
      : super(key: key);

  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onpressed;
      },
      elevation: 2.0,
      shape: CircleBorder(),
      fillColor: Color.fromARGB(255, 25, 87, 87),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
