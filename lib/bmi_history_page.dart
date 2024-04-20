import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'bmi_record.dart';

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
          return Column(children: [
            //Initialize the chart widget
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'BMI History'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<BMIRecord, String>>[
                  LineSeries<BMIRecord, String>(
                      dataSource: snapshot.data,
                      xValueMapper: (BMIRecord records, _) =>
                          DateFormat('yyyy-MM-dd HH:mm').format(records.date),
                      yValueMapper: (BMIRecord records, _) => records.weight,
                      name: 'Weight',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  BMIRecord record = snapshot.data![index];
                  return ListTile(
                    title: Text("BMI: ${record.bmi.toStringAsFixed(2)}"),
                    subtitle: Text(
                        "Date: ${DateFormat('yyyy-MM-dd').format(record.date)}"),
                  );
                },
              ),
            )),
          ]);
        },
      ),
    );
  }
}

Future<List<BMIRecord>> getBMIRecords(String userId) async {
  var collection = FirebaseFirestore.instance.collection('bmiRecords');
  var snapshot = await collection
      .where('userId', isEqualTo: userId)
      .orderBy('date', descending: true)
      .get();
  return snapshot.docs.map((doc) => BMIRecord.fromMap(doc.data())).toList();
}
