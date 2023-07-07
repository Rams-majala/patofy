import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');

  List<String> dropdownItems = [
    'This Week',
    'This Month',
    'Last month',
  ];
  String? selectedDropdownItem;

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        dateController1.text = _dateFormatter.format(picked);
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        dateController2.text = _dateFormatter.format(picked);
      });
    }
  }

  @override
  void dispose() {
    dateController1.dispose();
    dateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primaryWhiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add drop down select
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 110,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Select Duration',
                      labelStyle: TextStyle(color: Styles.primaryRedColor),
                      border: InputBorder.none,
                    ),
                    child: DropdownButtonFormField<String>(
                      alignment: AlignmentDirectional.centerStart,
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                      ),
                      value: selectedDropdownItem,
                      onChanged: (newValue) {
                        setState(() {
                          selectedDropdownItem = newValue;
                        });
                      },
                      items: dropdownItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Styles.primaryBlackColor),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                    width: 170,
                    child: Container(
                      color: Styles.primaryBlueColor,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Actual Expenses",
                              style: TextStyle(
                                  color: Styles.primaryWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ),
                          Divider(
                            height: 16,
                            color: Styles.primaryWhiteColor,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                //replace the value here with real data from the user
                                child: Text(
                                  "Tsh.78,960/=",
                                  style: TextStyle(
                                      color: Styles.primaryWhiteColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                              Icon(
                                Icons.money_off,
                                size: 40,
                                color: Styles.primaryWhiteColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: 170,
                    child: Container(
                      color: Styles.primaryGreenColor,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Actual Icome",
                              style: TextStyle(
                                  color: Styles.primaryWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ),
                          Divider(
                            height: 16,
                            color: Styles.primaryWhiteColor,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),

                                //replace the value here with real data from the user
                                child: Text(
                                  "Tsh.68,960/=",
                                  style: TextStyle(
                                      color: Styles.primaryWhiteColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ),
                              Icon(
                                Icons.money,
                                size: 40,
                                color: Styles.primaryWhiteColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 90,
                  child: Container(
                    color: Styles.primaryRedColor,

                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Recent Transactions"),
                    TextButton(onPressed: () {}, child: Text("View All"))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
