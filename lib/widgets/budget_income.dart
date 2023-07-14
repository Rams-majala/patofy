import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

import '../screens/home_screen.dart';
import 'add_expenses_widget.dart';

class BudgetedIncomeTab extends StatefulWidget {
  const BudgetedIncomeTab({Key? key}) : super(key: key);

  @override
  _BudgetedIncomeTabState createState() => _BudgetedIncomeTabState();
}

class _BudgetedIncomeTabState extends State<BudgetedIncomeTab> {
  List<TableRow> tableRows = [
    // Existing rows in the table
    TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Category 1'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Amount 1'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Description 1'),
        ),
      ],
    ),
    TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Category 2'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Amount 2'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Description 2'),
        ),
      ],
    ),
  ];

  void addTableRow() {
    setState(() {
      // Add a new row to the table
      tableRows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('New Category'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('New Amount'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('New Description'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'Choose duration',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Fill in the box below of the income budget',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: '1 Month',
                      groupValue: null, // Add your group value here
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    const Text('1 Month'),
                    Radio(
                      value: '3 Months',
                      groupValue: null, // Add your group value here
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    const Text('3 Months'),
                    Radio(
                      value: '6 Months',
                      groupValue: null, // Add your group value here
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    const Text('6 Months'),
                    Radio(
                      value: '12 Months',
                      groupValue: null, // Add your group value here
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    const Text('12 Months'),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(3),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...tableRows,
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: addTableRow,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Styles.primaryRedColor,
                            ),
                            child:  Text(
                              'Add',
                              style: TextStyle(
                                color: Styles.primaryWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Styles.primaryRedColor
                ),
                child: Center(
                  child: Text("Finish",style: TextStyle(color: Styles.primaryWhiteColor,fontSize: 18),),
                ),
              ),
            )
            ],
          ),
        ),
      ],
    );
  }
}


