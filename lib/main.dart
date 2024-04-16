import 'package:flutter/material.dart';
import 'gender_selection.dart';
import 'lets_go_buttion.dart';
import 'number_input_with_increment_decrement.dart';
import 'height_slider.dart';
import 'results_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'BMI Calculator',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'BMI Calculator'),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  double weight = 70;
  double height = 175;

  void setWeight(double value) {
    weight = value;
    notifyListeners();
  }

  void setHeight(double value) {
    height = value;
    notifyListeners();
  }
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var weight = appState.weight;
    var height = appState.height;
    void onLetsGoPressed(BuildContext context) {
      double bmiValue = calculateBMI(weight, height);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMICalculatorResults(bmiValue: bmiValue, height: appState.height.round(),),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.settings, color: Colors.blue),
        actions: const [Icon(Icons.notifications, color: Colors.blue)],
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16), // Provides space from the top
            const GenderSelection(),
            const SizedBox(height: 16),
            const BodyMeasurementCard(),
            const SizedBox(height: 20),
            LetsGoButton(onTap: () {
              onLetsGoPressed(context);
            }),
          ],
        ),
      ),
    );
  }
}

class BodyMeasurementCard extends StatelessWidget {
  const BodyMeasurementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  // This will be the height slider container
                  child: const HeightSlider(),
                ),
              ),
              const SizedBox(
                  width: 16), // Spacing between height slider and number inputs
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: NumberInputWithIncrementDecrement(
                          label: 'Weight',defaultValue: 50,onChanged: (int newWeight){
                            appState.setWeight(newWeight.toDouble());
                          },),
                    ),
                    const SizedBox(
                        height: 16), // Spacing between weight and age
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: NumberInputWithIncrementDecrement(
                            label: 'Age',defaultValue: 20,onChanged: (newAge){
                              // Handle age change
                            },)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

double calculateBMI(double weight, double height) {
  // Height in cm to meters conversion
  double heightInMeters = height / 100;
  // BMI calculation
  return weight / (heightInMeters * heightInMeters);
}
