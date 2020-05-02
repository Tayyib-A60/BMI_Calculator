import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({ @required this.buttonText, @required this.func });

  final String buttonText;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        child: Center(child: Text(buttonText,
          style: kCalculateTextStyle,
        ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}