import 'package:flutter/material.dart';
import 'bmi_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  final String userId;

  const HistoryPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI History"),
      ),
      body: FutureBuilder<List<BMIRecord>>(
        future: getBMIRecords(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              BMIRecord record = snapshot.data![index];
              return ListTile(
                title: Text("BMI: ${record.bmi.toStringAsFixed(2)}"),
                subtitle: Text("Date: ${DateFormat('yyyy-MM-dd').format(record.date)}"),
              );
            },
          );
        },
      ),
    );
  }
}

Future<List<BMIRecord>> getBMIRecords(String userId) async {
  var collection = FirebaseFirestore.instance.collection('bmiRecords');
  var snapshot = await collection.where('userId', isEqualTo: userId).orderBy('date', descending: true).get();
  return snapshot.docs.map((doc) => BMIRecord.fromMap(doc.data())).toList();
}