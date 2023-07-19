import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/home_screen.dart';
import 'package:patofy/screens/pages/home_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Styles.primaryWhiteColor),
        title: Text("About Patofy",style: TextStyle(color: Styles.primaryWhiteColor),),
        centerTitle: false,
        backgroundColor: Styles.primaryRedColor,
        leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (_)=>HomeScreen()));
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}