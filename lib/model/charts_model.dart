import 'package:charts_flutter/flutter.dart' as charts;

class ChartModel {
  Future<List<charts.Series<UserExpenses, String>>> generateBarChart() async {
    final data = [
      UserExpenses('Clothes', 200,  charts.MaterialPalette.blue.shadeDefault ,'Clothes'),
      UserExpenses('Transport', 350, charts.MaterialPalette.green.shadeDefault ,'Transport'),
      UserExpenses('Food', 350, charts.MaterialPalette.black ,'Food'),
      UserExpenses('Debt', 150, charts.MaterialPalette.red.shadeDefault ,'Debt'),
    ];

    return [
      charts.Series<UserExpenses, String>(
        id: 'Expenses',
        domainFn: (UserExpenses expenses, _) => expenses.category,
        measureFn: (UserExpenses expenses, _) => expenses.amount,
        data: data,
        colorFn: (UserExpenses expenses, _) => expenses.color,
        labelAccessorFn: (UserExpenses expenses, _) =>
            '\$${expenses.amount.toStringAsFixed(2)}',
      ),
    ];
  }

  Future<Map<String, double>> generatePieChart() async {
    final data = {
      'Salary': 5000.0,
      'Freelancing': 2000.0,
      'Investments': 1000.0,
    };

    return data;
  }
}

class UserExpenses {
  final String category;
  final double amount;
  final charts.Color color;
  final String domain; // Add the domain property

  UserExpenses(this.category, this.amount, this.color, this.domain);
}

class IncomeData {
  final String source;
  final double amount;

  IncomeData(this.source, this.amount);
}
