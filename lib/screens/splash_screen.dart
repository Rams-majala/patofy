import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';
import 'auth/signup.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
     const Duration(seconds: 10),
      () {
        // Navigate to the next screen after 2 seconds
        Navigator.push(context, MaterialPageRoute(builder: (_) =>  const SignUpScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryRedColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/patofy-logo.png',
              width: 150,
              height: 150,
              
            ),
            const SizedBox(height: 10),
            Text("Patofy",style: TextStyle(fontSize:34,color: Styles.primaryWhiteColor),),
           const SizedBox(height: 40),
            SpinKitCircle(
               color: Styles.primaryWhiteColor,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
