import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../widgets/expenses.dart';
import '../../widgets/income.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

DateTime startDate = DateTime.now().add(const Duration(days: 1));


final DateFormat _dateFormatter = DateFormat('MMM dd,yyyy');



  late TabController _tabController;



   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Styles.primaryWhiteColor,
          //abb bar design
          appBar: AppBar(
            title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              // Handle previous date range
              setState(() {
      startDate = startDate.subtract(const Duration(days: 1)); // Subtract 7 days from the start date
     // Subtract 7 days from the end date
    });
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Styles.primaryBlackColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top:14.0),
            child: Text(
            " ${_dateFormatter.format(startDate)}",
            style: TextStyle(
              color: Styles.primaryRedColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          IconButton(
            onPressed: () {
              // Handle next date range
              setState(() {
    // Add 7 days to the start date
      startDate = startDate.add(const Duration(days: 30)); // Add 7 days to the end date
    });
            },
            icon: const Icon(Icons.arrow_forward_ios),
            color: Styles.primaryBlackColor,
          ),
        ],
      ),
            centerTitle: false,
            backgroundColor: Styles.primaryWhiteColor,
            iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: Styles.primaryRedColor,
              labelColor: Styles.primaryRedColor,
              unselectedLabelColor: Styles.primaryBlackColor,
              tabs: const [
                Tab(text: 'Expenses'),
                Tab(text: 'Income')
              ]
            
            ),
          ),
          body: const TabBarView(
            
            children: [ ExpensesTab(), IncomeTab()],
          ),
          ),
    );
        
  }
}





  