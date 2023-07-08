import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../constants/colors.dart';
import '../../model/charts_model.dart';
import '../home_screen.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  final ChartModel chartModel = ChartModel();

  @override
  Widget build(BuildContext context) {
    final Map<String, double> pieChartData = chartModel.generatePieChart().map((key, value) => MapEntry(key, value.toDouble()));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
        backgroundColor: Styles.primaryRedColor,
        elevation: 0,
        title: Text(
          "Pie Chart",
          style: TextStyle(color: Styles.primaryWhiteColor),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Styles.primaryWhiteColor,
          )
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,

          child: PieChart(
            dataMap: pieChartData,
            animationDuration: Duration(milliseconds: 500),
            chartLegendSpacing: 32.0,
            chartRadius: null,
            
            colorList: [
              Colors.blue,
              Colors.green,
              Colors.orange,
            ],
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
