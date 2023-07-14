import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/pages/barchart.dart';
import 'package:patofy/screens/pages/linechart.dart';
import 'package:patofy/screens/pages/piecharts.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/charts_model.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> with SingleTickerProviderStateMixin{

   

  late TabController _tabController;



   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this,);
  }

  @override
  void dispose() {
    // dateController1.dispose();
    // dateController2.dispose();
     _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
       length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.primaryWhiteColor,
          iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
          title: Text("Analysis",style: TextStyle(color: Styles.primaryRedColor),),
          centerTitle: true,
            bottom: TabBar(
            
                isScrollable: false,
                indicatorColor: Styles.primaryRedColor,
                labelColor: Styles.primaryRedColor,
                unselectedLabelColor: Styles.primaryBlackColor,
                tabs: const [
                  Tab(text: 'Pi chart'),
                  Tab(text: 'Column'),
                  Tab(text: 'Line chart'),
                ]
              
              ),
        ),
        body:  TabBarView(
              
              children: [ PieChartPage(), BarChartPage(),LineChartPage()],
            ),
      ),
    );
  }
}

// SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//               height: 90,
//               width: MediaQuery.of(context).size.width,
//               color: Styles.primaryBlackColor,
//             ), 
//             SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 child: PieChart(
//                   dataMap: pieChartData,
//                   animationDuration: const Duration(milliseconds: 500),
//                   chartLegendSpacing: 32.0,
//                   chartRadius: null,
                  
//                   colorList: const [
//                     Colors.blue,
//                     Colors.green,
//                     Colors.orange,
//                   ],
//                   legendOptions: const LegendOptions(
//                     showLegendsInRow: true,
//                     legendPosition: LegendPosition.bottom,
//                     showLegends: true,
//                     legendTextStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
           
//           ],
//         ),
//       ),