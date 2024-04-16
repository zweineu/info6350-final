import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key});

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double height = 150.0; // Default height in centimeters

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8), // Spacing from the top
        const Text(
          'Height',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
                flex: 2,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Slider(
                    value: height,
                    min: 100.0,
                    max: 220.0,
                    divisions: 120,
                    thumbColor: Colors.blue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                )),
            Expanded(
                flex: 3,
                child: Text(
                  '${height.toStringAsFixed(1)} cm',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ))
      ],
    );
  }
}
