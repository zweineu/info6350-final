class BMIRecord {
  final double bmi;
  final double weight;
  final DateTime date;
  final String userId;

  BMIRecord({required this.bmi,required this.weight, required this.date, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'bmi': bmi,
      'weight': weight,
      'date': date,
      'userId': userId,
    };
  }

  static BMIRecord fromMap(Map<String, dynamic> map) {
    return BMIRecord(
      bmi: map['bmi'],
      weight: map['weight'],
      date: map['date'].toDate(), // Firestore timestamps converted to DateTime
      userId: map['userId'],
    );
  }
}
