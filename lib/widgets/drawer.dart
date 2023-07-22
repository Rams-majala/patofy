import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';


import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/pages/about.dart';
import 'package:patofy/screens/pages/privacy.dart';
import '../helpers/export_income.dart';
import '../model/epenses_model.dart';
import '../model/income_model.dart';
import '../screens/auth/signin.dart';
import '../services/income_services.dart';
import '../services/expenses_services.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  ExportController exportController = ExportController();

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shadowColor: Styles.primaryWhiteColor,
      elevation: 0,
      child: Column(
        children: [
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(user?.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return UserAccountsDrawerHeader(
                  accountName: Text('Loading...'),
                  accountEmail: Text(''),
                  decoration: BoxDecoration(
                    color: Styles.primaryRedColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return UserAccountsDrawerHeader(
                  accountName: Text('Error'),
                  accountEmail: Text(''),
                  decoration: BoxDecoration(
                    color: Styles.primaryRedColor,
                  ),
                );
              } else {
                final userData = snapshot.data?.data();
                final firstName = userData?['firstName'] ?? 'Guest';
                final email = userData?['email'] ?? 'guest@example.com';

                return UserAccountsDrawerHeader(
                  accountName: Text(
                    firstName,
                    style: TextStyle(color: Styles.primaryWhiteColor),
                  ),
                  accountEmail: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        email,
                        style: TextStyle(color: Styles.primaryWhiteColor,fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Styles.primaryWhiteColor,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Styles.primaryRedColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Styles.primaryRedColor,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 9),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildListTile(Icons.info, 'About patofy', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AboutPage()));
                }),
                buildListTile(Icons.privacy_tip, 'Privacy policy', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyPage()));
                }),
                buildSectionHeader('Synchronization'),
                buildListTile(Icons.add_box, 'Dropbox', () {
                  // Handle Dropbox tap
                }),
                buildListTile(Icons.add_to_drive, 'Google Drive', () {
                  // Handle Google Drive tap
                }),
                buildListTile(Icons.backup, 'Data Backup', () {
                  // Handle Data Backup tap
                }),
                buildListTile(Icons.logout, 'Logout', ()async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignInScreen(),
                        ),
                      ); // Replace with your login or splash screen route
                    } catch (e) {
                      // Handle error
                      print('Error occurred during logout: $e');
                    }
                  },),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => _showExportDialog(context),
                child: Text(
                  'Export',
                  style: TextStyle(color: Styles.primaryBlackColor),
                ),
              ),
              TextButton(
                onPressed: _shareApp,
                child: Text(
                  'Share',
                  style: TextStyle(color: Styles.primaryBlackColor),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Version 1.0',
                  style: TextStyle(color: Styles.primaryBlackColor.withOpacity(0.2)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Styles.primaryBlackColor,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

   void _shareApp() {
    final String appShareMessage = "Check out this awesome app! Download it now from the Play Store/App Store.";
    Share.share(appShareMessage);
  }

  void _showExportDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Export Data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () async {
                    // Handle export to PDF action
                Navigator.pop(context);
                await exportController.exportToPDF();
                },
                icon: Icon(Icons.picture_as_pdf_sharp, color: Styles.primaryRedColor),
                label: Text('Export to Pdf', style: TextStyle(color: Styles.primaryBlackColor)),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle share via WhatsApp action
                  Navigator.pop(context);
                },
                icon: Icon(Icons.file_copy, color: Styles.primaryRedColor),
                label: Text('Export to Excel', style: TextStyle(color: Styles.primaryBlackColor)),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle share via Bluetooth action
                  Navigator.pop(context);
                },
                icon: Icon(Icons.file_present, color: Styles.primaryRedColor),
                label: Text('Export to Csv', style: TextStyle(color: Styles.primaryBlackColor)),
              ),
            ],
          ),
        );
      },
    );
  }
}
