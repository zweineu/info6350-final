import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BMICalculatorResults extends StatelessWidget {
  final double bmiValue;
  final int height;

  const BMICalculatorResults({Key? key, required this.bmiValue, required this.height})
      : super(key: key);

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

  double getWeightRangeMin(int height) {
    return 18.5 * height / 100 * height / 100;
  }

  double getWeightRangeMax(int height) {
    return 25 * height / 100 * height / 100;
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategory = getBMICategory(bmiValue);
    double weightRangeMin = getWeightRangeMin(height);
    double weightRangeMax = getWeightRangeMax(height);
    String buttonText = FirebaseAuth.instance.currentUser == null? 'Login':'History';
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Your BMI Result')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: bmiValue / 50,
            center:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmiValue.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    const SizedBox(height: 8),
                    Text(bmiCategory, style: const TextStyle(fontSize: 24, color: Colors.blue)),
                  ],
                ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
          ),
          // const Text("Your BMI is",
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          // You might use a package like `percent_indicator` to draw circular progress bar
          // Text(bmiValue.toStringAsFixed(1),
          //     style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Your BMI is ${bmiValue.toStringAsFixed(1)}, indicating your weight is in the $bmiCategory category for adults of your height."
              "\n\nFor your height, a normal weight range would be from ${weightRangeMin.round()} to ${weightRangeMax.round()} kilograms."
              "\n\nMaintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(FirebaseAuth.instance.currentUser == null){
                  Navigator.pushReplacementNamed(context, '/login');
                }
                else
                  {
                    Navigator.pushReplacementNamed(context, '/history');
                  }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              child: Text(buttonText, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
