import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BMICalculatorResults(bmiValue: 20.4,)));
}

class BMICalculatorResults extends StatelessWidget {
  final double bmiValue;

  BMICalculatorResults({Key? key, required this.bmiValue}) : super(key: key);

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategory = getBMICategory(bmiValue);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Back"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Your BMI is", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          // You might use a package like `percent_indicator` to draw circular progress bar
          Text(bmiValue.toStringAsFixed(1), style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          Text(bmiCategory, style: TextStyle(fontSize: 24, color: Colors.blue)),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Your BMI is ${bmiValue.toStringAsFixed(1)}, indicating your weight is in the $bmiCategory category for adults of your height."
              "\n\nFor your height, a normal weight range would be from 53.5 to 72 kilograms."
              "\n\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle "Find Out More" action
            },
            child: Text("Find Out More", style: TextStyle(fontSize: 16)),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
