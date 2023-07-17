import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

import 'add_income_widget.dart';

class IncomeTab extends StatelessWidget {
  const IncomeTab({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 18.0),
                child: Container(
                  color: Styles.primaryRedColor.withOpacity(0.2),
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 90,
                        color: Styles.primaryWhiteColor.withOpacity(0.5),
                        child: Icon(
                          Icons.attach_money,
                          color: Styles.primaryRedColor,
                          size: 90,
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                            child: Text(
                              "Your Income",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [Text("Actual"), 
                                  
                                  Text("empty")],//Update this with real actual Income amount 
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Budgeted",
                                      style: TextStyle(color: Styles.primaryGreenColor),
                                    ),
                                    Text(
                                      "empty",
                                      style: TextStyle(color: Styles.primaryGreenColor),
                                    )//update this real budgeted income amount
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
                 Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: Container(
                  color: Styles.primaryRedColor.withOpacity(0.2),
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 90,
                        color: Styles.primaryWhiteColor.withOpacity(0.2),
                        child: Icon(
                          Icons.attach_money,
                          color: Styles.primaryRedColor,
                          size: 90,
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                            child: Text(
                              "Difference",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [Text("Budgeted Income"), Text("empty")],
                                ),
                                 const Icon(Icons.remove),
                                Column(
                                  children: [
                                    Text(
                                      "Actual Income",
                                      style: TextStyle(color: Styles.primaryGreenColor),
                                    ),
                                    Text(
                                      "empty",
                                      style: TextStyle(color: Styles.primaryGreenColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18),
                            child: Center(
                              child: Text("Total Income  = "),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "No recent Expenses",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            backgroundColor: Styles.primaryRedColor,
            onPressed: () {
              // Handle the add new button press here
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AddIncomeWidget()));
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 26,color: Styles.primaryWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}

