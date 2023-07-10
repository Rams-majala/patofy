import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timer,
                size: 64,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                "Budgeted Income Coming Soon",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
