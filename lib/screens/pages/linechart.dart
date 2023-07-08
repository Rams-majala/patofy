import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key});

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryRedColor,
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
        elevation: 0,
        title: Text("Line Chart",style: TextStyle(color: Styles.primaryWhiteColor),),
        actions:const[
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
}