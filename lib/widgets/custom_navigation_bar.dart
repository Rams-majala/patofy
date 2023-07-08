
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedIconTheme: IconThemeData(color: Styles.primaryRedColor),
      unselectedIconTheme: IconThemeData(color: Styles.primaryBlackColor),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.select_all),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Seetings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_note),
          label: 'Add Expense',
        ),
      ],
    );
  }
}