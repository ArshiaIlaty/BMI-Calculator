
import 'dart:math';

class Calculator {

  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;

  //we define this property for get BMI visible for method or function of getResult
  double _BMI = 20;

  String CalculatorBMI(){
    //BMI = (weight/ ((height*height)/10000)).toDouble();
    double _BMI = weight/ pow(height/100, 2);
    //to round up oour large double
    return _BMI.toStringAsFixed(2);
  }

  String getResult(){
    if(_BMI >= 25){
      return "Overweight";
    }
    else if(_BMI > 18.5){
      return "Normal";
    }
    else {
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_BMI >= 25){
      return "Your BMI result is too high, You should eat less. You have to care to your body";
    }
    else if(_BMI > 18.5){
      return "Normal. Keep on good work";
    }
    else {
      return "Your BMI result is too low, You should eat more. You have to care to your body";
    }
  }
}
