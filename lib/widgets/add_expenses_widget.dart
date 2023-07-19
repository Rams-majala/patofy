import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../widgets/category_widget.dart';

class AddExpensesWidget extends StatefulWidget {
  const AddExpensesWidget({super.key});

  @override
  State<AddExpensesWidget> createState() => _AddExpensesWidgetState();
}

class _AddExpensesWidgetState extends State<AddExpensesWidget> {
  

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryRedColor,
        title:  Text('New Expenses',style: TextStyle(color: Styles.primaryWhiteColor),),
        centerTitle: false,
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
          

            Padding(padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const CategoryPage()));
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
                child: Text("Add Expenses",style: TextStyle(color: Styles.primaryWhiteColor),),
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