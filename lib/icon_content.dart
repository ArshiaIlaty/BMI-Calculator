import 'package:flutter/material.dart';
import 'constants.dart';
// in order to change it easily whenever we want


class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 85,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}