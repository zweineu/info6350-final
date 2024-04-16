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
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.blue[100],
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
        thumbColor: Colors.blue,
        overlayColor: Colors.blue.withAlpha(32),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: Colors.blue,
        inactiveTickMarkColor: Colors.blue[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.blue,
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      child: Slider(
        value: height,
        min: 112.0,
        max: 220.0,
        divisions: 108,
        label: '$height',
        onChanged: (double newValue) {
          setState(() {
            height = newValue;
          });
        },
      ),
    );
  }
}
