import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({@required this.icon, this.text, this.labelTextStyle });

  final IconData icon;
  final String text;
  final TextStyle labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text( text, style: labelTextStyle
        )
      ],
    );
  }
}