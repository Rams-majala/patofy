import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/pages/home_page.dart';

class IncomeCategoryPage extends StatefulWidget {
  const IncomeCategoryPage({Key? key}) : super(key: key);

  @override
  State<IncomeCategoryPage> createState() => _IncomeCategoryPageState();
}

class _IncomeCategoryPageState extends State<IncomeCategoryPage> {
  List<Category> categories = [
    Category(name: 'wages', icon: Icons.wallet),
    Category(name: 'salary', icon: Icons.badge),
    Category(name: 'Tips & Commisions', icon: Icons.system_security_update_sharp),
    Category(name: 'Selling items', icon: Icons.attach_money_outlined),
    Category(name: 'Profit', icon: Icons.wallet_travel),
    Category(name: 'Rental Properties', icon: Icons.car_rental),
    Category(name: 'Divedends & capital gain', icon: Icons.local_hospital),
    Category(name: 'Royalties & limited part', icon: Icons.phone),
  ];

  List<Category> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryRedColor,
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
        title: Text(
          "Select Income Categories",
          style: TextStyle(color: Styles.primaryWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in each row
                childAspectRatio: 1.0, // Aspect ratio of each grid item
              ),
              padding: const EdgeInsets.all(16.0),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(categories[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryRedColor,
        onPressed: () {
         Navigator.pop(context);
        },
        child: Text("Add",style: TextStyle(color: Styles.primaryWhiteColor),),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    bool isSelected = selectedCategories.contains(category);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCategories.remove(category);
          } else {
            selectedCategories.add(category);
          }
        });
      },
      child: Container(
        color: isSelected ? Styles.primaryRedColor : Styles.primaryWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? Styles.primaryWhiteColor : Styles.primaryRedColor,
            ),
            const SizedBox(height: 8.0),
            Text(
              category.name,
              style: TextStyle(
                color: isSelected ? Styles.primaryWhiteColor : Styles.primaryRedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}
