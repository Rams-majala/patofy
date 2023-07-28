import 'package:flutter/material.dart';
import '../../model/charts_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartPage extends StatefulWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  final ChartModel chartModel = ChartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<charts.Series<UserExpenses, String>>>(
        future: chartModel.generateBarChart(), // Fetch the data using the future function
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final barChartData = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: charts.BarChart(
                      barChartData,
                      animate: true,
                      // Customize the chart appearance
                      barRendererDecorator: charts.BarLabelDecorator<String>(),
                      domainAxis: const charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(
                          labelRotation: 0,
                        ),
                      ),
                      primaryMeasureAxis: charts.NumericAxisSpec(
                        renderSpec: charts.GridlineRendererSpec(
                          labelStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.gray.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: barChartData.first.data.map((data) {
                    return SizedBox(
                      height: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: Color.fromARGB(
                              data.color.a,
                              data.color.r,
                              data.color.g,
                              data.color.b,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            data.domain,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
