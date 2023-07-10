import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../widgets/category_widget.dart';

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

  void _onCalculatePressed() {
    setState(() {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('7'),
                _buildNumberButton('8'),
                _buildNumberButton('9'),
                _buildOperatorButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('4'),
                _buildNumberButton('5'),
                _buildNumberButton('6'),
                _buildOperatorButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('1'),
                _buildNumberButton('2'),
                _buildNumberButton('3'),
                _buildOperatorButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('0'),
                _buildClearButton(),
                _buildCalculateButton(),
                _buildOperatorButton('+'),
              ],
            ),

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
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(buttonText),
        ),
      ),
    );
  }

  Widget _buildOperatorButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: _onClearPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Icon(Icons.clear),
        ),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: _onCalculatePressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: const Text('='),
        ),
      ),
    );
  }
}