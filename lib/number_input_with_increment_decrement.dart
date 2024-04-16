import 'package:flutter/material.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
  final String label;

  const NumberInputWithIncrementDecrement({Key? key, required this.label}) : super(key: key);

  @override
  _NumberInputWithIncrementDecrementState createState() => _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState extends State<NumberInputWithIncrementDecrement> {
  int value = 20; // Default value for weight/age

  void _increment() {
    setState(() {
      value++;
    });
  }

  void _decrement() {
    setState(() {
      if (value > 0) value--;
    });
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
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.blue),
              onPressed: _decrement,
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.blue),
              onPressed: _increment,
            ),
          ],
        ),
      ],
    );
  }
}