// ignore_for_file: prefer_const_constructors
import 'package:bmi_cacl/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.resultInterpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  Color textcolor() {
    if (resultText == 'OVERWEIGHT' || resultText == 'UNDERWEIGHT') {
      return Color.fromARGB(255, 255, 73, 73);
    } else {
      return Color.fromARGB(255, 126, 255, 141);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: cardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                        color: textcolor(),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        color: textcolor(),
                        fontSize: 100,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child: Text(
                          resultInterpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                color: Color.fromARGB(255, 6, 68, 41),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 12.0),
                width: double.infinity,
                height: bottomcontainerheight,
                child: Center(
                  child: Text('RE-CALCULATE',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )
          ],
        ));
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
