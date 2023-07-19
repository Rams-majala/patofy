import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

import 'add_expenses_widget.dart';

class ExpensesTab extends StatelessWidget {
  const ExpensesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 18.0,),
              child: Container(
                color: Styles.primaryBlackColor.withOpacity(0.2),
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
                        color: Styles.primaryBlackColor,
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
                                children: [Text("Actual"), Text("0.00")],
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
                                    "0.00",
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
          ],
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

