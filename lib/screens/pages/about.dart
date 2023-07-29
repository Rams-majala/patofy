import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/home_screen.dart';

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
        title: Text("About Patofy", style: TextStyle(color: Styles.primaryWhiteColor)),
        centerTitle: false,
        backgroundColor: Styles.primaryRedColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Us",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to Patofy, your one-stop destination for all things music! "
              "We are a passionate team of music lovers, dedicated to bringing you "
              "the latest and greatest in the world of melodies and rhythms. "
              "Our mission is to make music discovery effortless and enjoyable, "
              "allowing you to explore new genres, artists, and tracks with ease. "
              "Whether you're a casual listener or a die-hard fan, Patofy has something "
              "special in store for you. Join us on this melodic journey and let the "
              "power of music enrich your life. Let's play and patofy!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24), // Adding some space between paragraphs
            Text(
              "Location: Dodoma Makulu",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Phone Number: 0689675756",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Email: patofy@gmail.com",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Website: www.patofy.com",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
