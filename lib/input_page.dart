import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator.dart';

//you cannot create enum inside the classes
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // final dateTime = DateTime.now();
  // var formatter = new DateFormat('yyyy-MM-dd');
  // String formattedDate = formatter.format(dateTime);
  // print(formattedDate);

  // final now = new DateTime.now();
  // String formatter = DateFormat('yMd').format(now);

  // getCurrentDate() {
  //   return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  // }
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  //double BMI = 20;


  //for the buttons in the weight section
  void incrementCounter() {
    setState(() {
      weight++;
    });
  }

  void decrementCounter() {
    setState(() {
      weight--;
    });
  }

  // void updateColor(Gender gender) {
  // if (selectedGender == Gender.male) {
  //   if (maleCardColor == inactiveCardColor) {
  //     maleCardColor = activeCardColor;
  //     femaleCardColor = inactiveCardColor;
  //   } else {
  //     maleCardColor = inactiveCardColor;
  //   }
  // }
  // if (selectedGender == Gender.female) {
  //   if (femaleCardColor == inactiveCardColor) {
  //     femaleCardColor = activeCardColor;
  //     maleCardColor = inactiveCardColor;
  //   } else {
  //     femaleCardColor = inactiveCardColor;
  //   }
  // }

  //}

  // void main(){
  //   int myAge = 24;
  //
  //   bool canBuyAlcohol = myAge > 21 ? true : false;
  // }

  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            width: 200,
            color: Colors.black38,
            margin: EdgeInsets.all(10),
            child: Text(
              datetime,
              style: TextStyle(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(Gender.male);
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                //   child: ReusableCard(
                //     onPress: (){
                //       selectedGender = Gender.male;
                //     },
                //     color: selectedGender == Gender.male ? activeCardColor: inactiveCardColor,
                //     cardChild: IconContent(
                //       icon: FontAwesomeIcons.mars,
                //       label: "MALE",
                //     ),
                //   ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //this help that cm comes down
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        )),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Colors.deepOrangeAccent,
                      inactiveColor: Colors.white30,
                      thumbColor: Colors.orange,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //this help that cm comes down
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              ' kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(backgroundColor: Colors.deepOrangeAccent, onPressed: decrementCounter,
                            child: Icon(Icons.minimize),),

                            // RoundIconButton(icon: FontAwesomeIcons.minus,
                            // onPressed: () {
                            //   setState(() {
                            //     weight--;
                            //   });
                            // },),

                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(backgroundColor: Colors.deepOrangeAccent, onPressed: incrementCounter,
                              child: Icon(Icons.add),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(backgroundColor: Colors.deepOrangeAccent, onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                              child: Icon(Icons.minimize),),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(backgroundColor: Colors.deepOrangeAccent, onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                              child: Icon(Icons.add),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){

            //create an object from calculator class
            Calculator calt = Calculator(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultPage(bmiResult: calt.CalculatorBMI(), resultText: calt.getResult(), interpretation: calt.getInterpretation(),);
                },),);
              }, Title: 'Calculate',),
        ],
      ),

      //drawer in the app
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
                child: Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  'Messages',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   foregroundColor: Colors.blue,
      //   hoverColor: Colors.green,
      //   focusColor: Colors.brown,
      //   splashColor: Colors.orange,
      //   onPressed: () {
      //
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.Title});

  //instead of function we use VoidCallback ( is just shorthand for void Function() so you could also define it as final void Function() )
  final VoidCallback onTap;
  final String Title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        color: Colors.deepOrangeAccent,
        margin: EdgeInsets.only(top: 10,),
        child: Center(
          child: Text(
            Title,
            style: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
}


//customize the floatingActionButton
// class RoundIconButton extends StatelessWidget {
//
//   RoundIconButton({required this.icon, required this.onPressed});
//   final IconData icon;
//   final Function onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       child: Icon(icon),
//       elevation: 6, //shadow when the button get hovered
//       onPressed: onPressed,
//       constraints: BoxConstraints.tightFor(
//         width:56,
//       height:56,
//     ),
//       shape: CircleBorder(), //RoudedRectangleBorder, ellipse, oval or any custom shape
//       fillColor: Colors.deepOrangeAccent,
//     );
//   }
// }

