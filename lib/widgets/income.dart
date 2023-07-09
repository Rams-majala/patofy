import 'package:flutter/material.dart';

import '../constants/colors.dart';

class IncomeTab extends StatelessWidget {
  const IncomeTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          "Your Incomes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [Text("Actual"), Text("Tsh.7,894,049")],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Budgeted",
                                  style: TextStyle(
                                      color: Styles.primaryGreenColor),
                                ),
                                Text(
                                  "Tsh.7,894,049",
                                  style: TextStyle(
                                      color: Styles.primaryGreenColor),
                                )
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
          )
        ],
      ),
    );
  }
}