import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
import 'income_category_widget.dart';

class AddIncomeWidget extends StatefulWidget {
  const AddIncomeWidget({super.key});

  @override
  State<AddIncomeWidget> createState() => _AddIncomeWidgetState();
}

class _AddIncomeWidgetState extends State<AddIncomeWidget> {
  

   final TextEditingController _amountController = TextEditingController();

 @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _onButtonPressed(String buttonText) {
    setState(() {
       _amountController.text += buttonText;
    });
  }

  void _onCalculatePressed() async{
    setState(() {

      String details ="";
      double amount = double.tryParse(_amountController.text) ?? 00;
      String createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      Map<String, dynamic> incomeData ={
        'datails' : details,
        'amount' : amount,
        'createdAt' : createdAt,
      };

      //  _saveIncomeData(incomeData);
      // Perform the calculation logic here
      // You can use a parser library or evaluate the expression manually

      // Example: Calculate the result of the expression


    });
  }

  void _onClearPressed() {
    setState(() {
     _amountController.text = '';
    });
  }

  /* Future<void> _saveIncomeData(Map<String, dynamic> incomeData) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/income_data.json');

  List<Map<String, dynamic>> existingData = [];
  if (await file.exists()) {
    final contents = await file.readAsString();
    existingData = List<Map<String, dynamic>>.from(json.decode(contents));
  }

  existingData.add(incomeData);
  print("income data added ");
  await file.writeAsString(json.encode(existingData));
}
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryRedColor,
        title:  Text('New Income',style: TextStyle(color: Styles.primaryWhiteColor),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(DateTime.now()),
              style: TextStyle(fontSize: 18.0,color: Styles.primaryWhiteColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Details',
                ),
                
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  
                  hintText: 'Amount in Tsh',
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Divider(),

            Padding(padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const IncomeCategoryPage()));
              },
              child: Container(
                height: 50,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.primaryRedColor
               ),
               child: Center(
                child: Text("Choose Category",style: TextStyle(color: Styles.primaryWhiteColor),),
               ),
              ),
            ),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.primaryRedColor
               ),
               child: Center(
                child: Text("Add Income",style: TextStyle(color: Styles.primaryWhiteColor),),
               ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

}