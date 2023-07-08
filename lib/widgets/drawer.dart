import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shadowColor: Styles.primaryWhiteColor,
      elevation: 0,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'luciano dev',
              style: TextStyle(color: Styles.primaryWhiteColor),
            ),
            accountEmail: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'lucinaodev@gmail.com',
                  style: TextStyle(color: Styles.primaryWhiteColor),
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
          ),
          const SizedBox(height: 9),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildSectionHeader('Settings'),
                buildListTile(Icons.info, 'About patofy'),
                buildListTile(Icons.privacy_tip, 'Privacy policy'),
                buildSectionHeader('Synchronization'),
                buildListTile(Icons.add_box, 'Dropbox'),
                buildListTile(Icons.add_to_drive, 'Google Drive'),
                buildListTile(Icons.backup, 'Data Backup'),
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
                onPressed: () => _showShareDialog(context),
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

  Widget buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
    );
  }


void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Choose the format you need to export data',style: TextStyle(
            color: Styles.primaryRedColor
          ),)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('PDF'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('EXCEL'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('CSV'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

//share dialog
void _showShareDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Share via',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via email action
                Navigator.pop(context);
              },
              icon: Icon(Icons.email,color: Styles.primaryRedColor,),
              label: Text('Email',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via whatsap action
                Navigator.pop(context);
              },
              icon: Icon(Icons.share_rounded,color: Styles.primaryRedColor,),
              label: Text('Whatsapp',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via bluetooth action
                Navigator.pop(context);
              },
              icon: Icon(Icons.bluetooth,color: Styles.primaryRedColor,),
              label: Text('Bluetooth',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via google drive  action
                Navigator.pop(context);
              },
              icon: Icon(Icons.add_to_drive,color: Styles.primaryRedColor,),
              label: Text('Drive',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via print media action
                Navigator.pop(context);
              },
              icon: Icon(Icons.print,color: Styles.primaryRedColor,),
              label: Text('Print',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
          ],
        ),
      );
    },
  );
}

}
