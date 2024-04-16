import 'package:flutter/material.dart';


enum Gender { male, female }

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender? selectedGender = Gender.male; // Default selected gender

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GenderButton(
            gender: Gender.male,
            selectedGender: selectedGender,
            onGenderTapped: (gender) {
              setState(() {
                selectedGender = gender;
              });
            },
          ),
          const SizedBox(width: 16), // Spacing between buttons
          GenderButton(
            gender: Gender.female,
            selectedGender: selectedGender,
            onGenderTapped: (gender) {
              setState(() {
                selectedGender = gender;
              });
            },
          ),
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final Gender gender;
  final Gender? selectedGender;
  final Function(Gender) onGenderTapped;

  const GenderButton(
      {super.key, required this.gender,
      this.selectedGender,
      required this.onGenderTapped});

  @override
  Widget build(BuildContext context) {
    bool isSelected = gender == selectedGender;
    IconData iconData = gender == Gender.male
        ? Icons.male
        : Icons.female; // Choose the icon based on gender
    return Expanded(
      child: Container(
        height: 48, // Fixed height for all buttons
        margin: const EdgeInsets.symmetric(
            horizontal: 4), // Margin for spacing between buttons
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            elevation: isSelected ? 2 : 0, // Adjust elevation
            padding: const EdgeInsets.symmetric(horizontal: 8), // Horizontal padding
          ),
          onPressed: () => onGenderTapped(gender),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Use the minimum amount of horizontal space
            children: <Widget>[
              Icon(iconData,
                  color: isSelected
                      ? Colors.white
                      : Colors
                          .blue), // Use appropriate color based on selection
              const SizedBox(width: 8), // Space between icon and text
              Text(
                gender == Gender.male ? 'Male' : 'Female',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}