import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/auth/signin.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                'Create Account',
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
                    labelText: 'First Name',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
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
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primaryRedColor,
                    
                     // Set your desired button color here
                  ),
                  child: Text('Sign Up',style: TextStyle(color: Styles.primaryWhiteColor),),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text('Or sign up with'),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle Google signup
                    },
                    icon: const Icon(Icons.g_translate),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle Facebook signup
                    },
                    icon: const Icon(Icons.facebook),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const Text('I agree to the terms and conditions'),
                ],
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have accout ?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInScreen()));
                  }, child: const Text("Sign In"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
