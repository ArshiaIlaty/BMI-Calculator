import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //required this.onPress
  ReusableCard({required this.color, required this.cardChild});

  final Color color;
  final Widget cardChild;
  //you can pass the Function as a type
  //final Function onPress;

  //constructor
  // const ReusableCard({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color,
      ),
    );
  }
}
