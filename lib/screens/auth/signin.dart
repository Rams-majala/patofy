import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                Image.asset(
                  'assets/images/logo.png',
                  height: 100.0,
                  width: 100.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Sign In ',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 1.0),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
               
               
                
                
               const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle signup button press
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.primaryRedColor,
                      
                       // Set your desired button color here
                    ),
                    child: Text('Sign In',style: TextStyle(color: Styles.primaryWhiteColor),),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have accout ?'),
                    TextButton(onPressed: (){}, child: const Text("Sign Up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
