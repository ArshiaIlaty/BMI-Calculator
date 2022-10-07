import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});
  //for passing BMI result from input_page, we have to create this property
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Your Result",
                style: kResultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      resultText,
                      style: kResultStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      bmiResult,
                      style: kBMINumberStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.deepOrangeAccent,
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BottomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    Title: "RE-CALCULATE")),
          ),
        ],
      ),
    );
  }
}

// setState(() {
// BMI = (weight + age).toDouble();
// print(BMI);
// });

// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context){
// return ResultPage();
// },),);
// },
