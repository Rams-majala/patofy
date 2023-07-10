import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkModeEnabled = false;
  bool isCurrencySignDollar = true;
  bool isCurrencySignBefore = true;
  int decimalPlaces = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Styles.primaryRedColor,fontWeight: FontWeight.w800),),
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor,),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Appearance',style: TextStyle(color: Styles.primaryRedColor),),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to the theme settings page
            },
          ),
          ListTile(
            title: const Text('UI Mode'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to the UI mode settings page
            },
          ),
          ListTile(
            title: const Text('Currency Sign'),
            trailing: Switch(
              value: isCurrencySignDollar,
              onChanged: (value) {
                setState(() {
                  isCurrencySignDollar = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                isCurrencySignDollar = !isCurrencySignDollar;
              });
            },
          ),
          ListTile(
            title: const Text('Currency Position'),
            trailing: Switch(
              value: isCurrencySignBefore,
              onChanged: (value) {
                setState(() {
                  isCurrencySignBefore = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                isCurrencySignBefore = !isCurrencySignBefore;
              });
            },
          ),
          ListTile(
            title: const Text('Decimal Places'),
            subtitle: Slider(
              value: decimalPlaces.toDouble(),
              min: 0,
              max: 4,
              divisions: 4,
              onChanged: (value) {
                setState(() {
                  decimalPlaces = value.toInt();
                });
              },
            ),
          ),
          ListTile(
            title: Text('Security',style: TextStyle(color: Styles.primaryRedColor)),
            subtitle: const Text('Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to the security settings page
            },
          ),
          ListTile(
            title: Text('Notification',style: TextStyle(color: Styles.primaryRedColor)),
            subtitle: const Text('Remind every day'),
            trailing: Switch(
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                isDarkModeEnabled = !isDarkModeEnabled;
              });
            },
          ),
        ],
      ),
    );
  }
}
