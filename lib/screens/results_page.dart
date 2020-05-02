import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/reusabe_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({ @required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text( 'BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  textAlign: TextAlign.center,
                  style: kYourResultTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'Re-Calculate',
            func: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      )
    );
  }
}
