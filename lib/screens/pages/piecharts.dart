import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/charts_model.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  final ChartModel chartModel = ChartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: FutureBuilder<Map<String, double>>(
            future: chartModel.generatePieChart(), // Fetch the data using the future function
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child:CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final pieChartData = snapshot.data!;
                return PieChart(
                  dataMap: pieChartData,
                  animationDuration: const Duration(milliseconds: 500),
                  chartLegendSpacing: 32.0,
                  chartRadius: null,
                  colorList: const [
                    Colors.blue,
                    Colors.green,
                    Colors.orange,
                  ],
                  legendOptions: const LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
