import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

import 'add_expenses_widget.dart';

class ExpensesTab extends StatelessWidget {
  const ExpensesTab({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 18.0,),
                child: Container(
                  color: Styles.primaryRedColor.withOpacity(0.2),
                  height: 90,
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
                              "Your Expenses",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Column(
                                  children: [Text("Actual"), Text("empty")],
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
                                    )
                                  ],
                                )
                              ],
                            ),
                          
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
                                  children: [Text("Budgeted Expenses"), Text("empty")],
                                ),
                                 const Icon(Icons.remove),
                                Column(
                                  children: [
                                    Text(
                                      "Actual Expenses",
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
                              child: Text("Total  Expenses  = "),
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AddExpensesWidget()));
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

