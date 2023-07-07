import 'package:flutter/material.dart';
import 'package:patofy/screens/pages/add_expenses.dart';
import 'package:patofy/screens/pages/budget_screen.dart';
import 'package:patofy/screens/pages/home_page.dart';
import 'package:patofy/screens/pages/settings_page.dart';

import '../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: Styles.primaryWhiteColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Styles.primaryRedColor,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Styles.primaryWhiteColor,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Replace with the path to your logo image
                height: 30, // Set the desired height of the logo image
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "patofy",
              style: TextStyle(
                  color: Styles.primaryRedColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            elevation: 4,
            shadowColor: Styles.primaryRedColor,
            color: Styles.primaryWhiteColor,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("Choose Chart",textAlign:TextAlign.center,style: TextStyle(color: Styles.primaryBlackColor,fontWeight: FontWeight.w800,fontSize: 18),)),
                 PopupMenuItem(
                  child: InkWell(
                    child: Row(
                      
                      children: [
                        Icon(Icons.pie_chart,color: Styles.primaryRedColor,),
                       const SizedBox(width: 5,),
                        const Text("Pie",),
                      ],
                    ),
                  )
                  ),
                   PopupMenuItem(
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.bar_chart,color: Styles.primaryRedColor,),
                        const SizedBox(width: 5,),
                        const Text("Column",),
                      ],
                    ),
                  )
                  ),
                  PopupMenuItem(
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.table_chart,color: Styles.primaryRedColor,),
                        const SizedBox(width: 5,),
                        const Text("Line Chart",),
                      ],
                    ),
                  )
                  ),
                  ];
            },
            icon: Icon(
              Icons.more_vert,
              color: Styles.primaryRedColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        shadowColor: Styles.primaryWhiteColor,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'luciano dev',
                style: TextStyle(color: Styles.primaryRedColor),
              ), // Replace with the user's name
              accountEmail: Text(
                'lucinaodev@gmail.com',
                style: TextStyle(color: Styles.primaryRedColor),
              ), // Replace with the user's email
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/logo.png',
                  // Replace with the URL of the user's avatar
                ),
                radius: 10,
              ),
              decoration: BoxDecoration(
                color: Styles
                    .primaryWhiteColor, // Set the header background color to red
              ),
              otherAccountsPictures: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Styles.primaryRedColor,
                  ),
                  onPressed: () {
                    // Perform action for edit button
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              "Choose Duration",
              style: TextStyle(color: Styles.primaryBlackColor),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.calendar_view_day),
                    title: Text('Day'),
                    // Replace with the user's phone number
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_view_week),
                    title: Text('Week'),
                    // Replace with the user's email address
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_view_month),
                    title: Text('Month'),
                    // Replace with the user's email address
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text('Year'),
                    // Replace with the user's email address
                  ),
                  ListTile(
                    leading: Icon(Icons.view_week),
                    title: Text('All'),
                    // Replace with the user's email address
                  ),
                  ListTile(
                    leading: Icon(Icons.select_all),
                    title: Text('Choose Date'),
                    // Replace with the user's email address
                  ),
                ],
              ),
            )
            // Add more ListTiles for additional content in the drawer
          ],
        ),
      ),
       body: Center(
        child: _buildCurrentScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: Styles.primaryRedColor),
        unselectedIconTheme: IconThemeData(color: Styles.primaryBlackColor),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTabTapped,
        items:const [
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
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        // Settings screen
        return const SettingPage();
      case 1:
        // Home screen
        return const HomePage();
      case 2:
        // Add screen
        return const BudgetPage();
      case 3:
        // Add Expense screen
        return const ExpensePage();
      case 4:
        // Logout screen
        return _buildLogoutScreen();
      default:
        return const Text('Invalid Screen');
    }
  }

  Widget _buildLogoutScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.exit_to_app, size: 80,color: Styles.primaryRedColor,),
        const SizedBox(height: 16),
        Text(
          'Are you sure you want \nto leave Patofy App',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18,color: Styles.primaryBlackColor),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('No',style: TextStyle(color: Styles.primaryRedColor),),
              onPressed: () {
                // Handle logout action
              },
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              child: Text('Yes',style: TextStyle(color: Styles.primaryGreenColor),),
              onPressed: () {
                // Handle logout action
              },
            ),
          ],
        ),
      ],
    ),
  );
}
}


