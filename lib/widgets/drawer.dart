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

//Export Dialog Modal
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
              onPressed: () {
                // Handle share via email action
                Navigator.pop(context);
              },
              icon: Icon(Icons.picture_as_pdf_sharp,color: Styles.primaryRedColor,),
              label: Text('Export to Pdf',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via whatsap action
                Navigator.pop(context);
              },
              icon: Icon(Icons.file_copy,color: Styles.primaryRedColor,),
              label: Text('Export to Excel',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via bluetooth action
                Navigator.pop(context);
              },
              icon: Icon(Icons.file_present,color: Styles.primaryRedColor,),
              label: Text('Export to Csv',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            
            
          ],
        ),
      );
    },
  );
  }

//share dialog
void _showShareDialog(BuildContext context) {
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
              'Share via',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via email action
                Navigator.pop(context);
              },
              icon: Icon(Icons.email,color: Styles.primaryRedColor,),
              label: Text('Email',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via whatsap action
                Navigator.pop(context);
              },
              icon: Icon(Icons.share_rounded,color: Styles.primaryRedColor,),
              label: Text('Whatsapp',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via bluetooth action
                Navigator.pop(context);
              },
              icon: Icon(Icons.bluetooth,color: Styles.primaryRedColor,),
              label: Text('Bluetooth',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle share via google drive  action
                Navigator.pop(context);
              },
              icon: Icon(Icons.add_to_drive,color: Styles.primaryRedColor,),
              label: Text('Drive',style:TextStyle(color: Styles.primaryBlackColor)),
            ),
            const SizedBox(height: 12.0),
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
