import 'package:bmi_calculator/constants/genderType.dart';
import 'package:bmi_calculator/functionality/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusabe_card.dart';
import '../constants/genderType.dart';
import 'package:bmi_calculator/constants/constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      colour: selectedGender == GenderType.Male? kActiveCardColor : kInactiveCardColor,
                      updateColor: (){
                        setState(() {
                            selectedGender = GenderType.Male;
                        });
                      },
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                        labelTextStyle: kLabelTextStyle,
                      ),
                  ),
                ),
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == GenderType.Female? kActiveCardColor : kInactiveCardColor,
                  updateColor: (){
                    setState(() {
                      selectedGender = GenderType.Female;
                    });
                  },
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',),
                ),
              )
              ],
            ),
            ),
          Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
              ),),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),),
              ),
              Expanded(
                child: ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            func: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(bmiResult: calculatorBrain.calculateBmi(), resultText: calculatorBrain.getResult(), interpretation: calculatorBrain.getInterpretation(),)
                  )
              );
            },
          )
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}





