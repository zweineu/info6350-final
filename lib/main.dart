import 'package:flutter/material.dart';
import 'gender_selection.dart';
import 'lets_go_buttion.dart';
import 'number_input_with_increment_decrement.dart';
import 'height_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
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
            LetsGoButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class HeightCard extends StatelessWidget {
  const HeightCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: HeightSlider(),
      ),
    );
  }
}

class WeightCard extends StatelessWidget {
  const WeightCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: NumberInputWithIncrementDecrement(label: 'Weight'),
      ),
    );
  }
}

class AgeCard extends StatelessWidget {
  const AgeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: NumberInputWithIncrementDecrement(label: 'Age'),
      ),
    );
  }
}

class BodyMeasurementCard extends StatelessWidget {
  const BodyMeasurementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: HeightSlider(),
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
                      child: const NumberInputWithIncrementDecrement(
                          label: 'Weight'),
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
                        child: const NumberInputWithIncrementDecrement(
                            label: 'Age')),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
