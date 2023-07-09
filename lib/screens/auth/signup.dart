import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/auth/signin.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

    // final AuthController _authController = AuthController();

  bool _agreeToTerms = false;

  void _signup() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // Perform validation here
    if (!_agreeToTerms) {
      // Show error message or handle validation failure
      return;
    }

    if (password != confirmPassword) {
      // Show error message or handle validation failure
      return;
    }

    // Handle signup button press
    // Call the signup method in your authentication controller
    // with the provided user information
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                  controller: _firstNameController,
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
                  controller: _lastNameController,
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
                  controller: _emailController,
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
                  controller: _passwordController,
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
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  const Text('I agree to the terms and conditions'),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primaryRedColor,
                    // Set your desired button color here
                  ),
                  child:  Text(
                    'Sign Up',
                    style: TextStyle(color: Styles.primaryWhiteColor),
                  ),
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
                      //  _authController.googleSignIn();
                    },
                    icon: const Icon(Icons.g_translate),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle Facebook signup
                      // _authController.facebookSignIn();
                      
                    },
                    icon: const Icon(Icons.facebook),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have accout ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
