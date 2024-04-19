import 'dart:async';

import 'package:flutter/material.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
  final String label;
  final int defaultValue;
  final Function(int) onChanged;

  const NumberInputWithIncrementDecrement(
      {Key? key,
      required this.label,
      required this.defaultValue,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumberInputWithIncrementDecrement> createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  late int value; // Default value for weight/age
  Timer? timer;

  @override
  void initState() {
    super.initState();
    value = widget.defaultValue;
  }

  void _increment() {
    setState(() {
      value++;
    });
    widget.onChanged(value);
  }

  void _decrement() {
    setState(() {
      if (value > 0) value--;
    });
    widget.onChanged(value);
  }

  void startTimer(void Function() updateValue) {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      updateValue();
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 8), // Spacing from the top (padding
        Text(
          widget.label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8), // Spacing between title and number
        Text(
          '$value',
          style: const TextStyle(fontSize: 62, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8), // Spacing between number and buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onLongPressStart: (details) => startTimer(_decrement),
              onLongPressEnd: (details) => stopTimer(),
              child: IconButton(
                icon: const Icon(Icons.remove, color: Colors.blue),
                onPressed: _decrement,
              ),
            ),
            GestureDetector(
              onLongPressStart: (details) => startTimer(_increment),
              onLongPressEnd: (details) => stopTimer(),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.blue),
                onPressed: _increment,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
