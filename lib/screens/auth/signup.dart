import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/auth/signin.dart';
import 'dart:async';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreeToTerms = false;

  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _phoneNumberError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _termsError;

  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // Perform validation here
    if (firstName.isEmpty) {
      setState(() {
        _firstNameError = 'Please enter your first name';
      });
      return;
    } else {
      setState(() {
        _firstNameError = null;
      });
    }

    if (lastName.isEmpty) {
      setState(() {
        _lastNameError = 'Please enter your last name';
      });
      return;
    } else {
      setState(() {
        _lastNameError = null;
      });
    }

    if (email.isEmpty) {
      setState(() {
        _emailError = 'Please enter your email';
      });
      return;
    } else if (!emailRegex.hasMatch(email)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
      return;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    if (phoneNumber.isEmpty) {
      setState(() {
        _phoneNumberError = 'Please enter your phone number';
      });
      return;
    } else if (!phoneRegex.hasMatch(phoneNumber)) {
      setState(() {
        _phoneNumberError = 'Please enter a valid phone number';
      });
      return;
    } else {
      setState(() {
        _phoneNumberError = null;
      });
    }

    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Please enter a password';
      });
      return;
    } else {
      setState(() {
        _passwordError = null;
      });
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordError = 'Please confirm your password';
      });
      return;
    } else if (password != confirmPassword) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
      });
      return;
    } else {
      setState(() {
        _confirmPasswordError = null;
      });
    }

    if (!_agreeToTerms) {
      setState(() {
        _termsError = 'Please accept the terms and conditions';
      });
      return;
    } else {
      setState(() {
        _termsError = null;
      });
    }

    // Handle signup button press
    // Call the signup method in your authentication controller
    // with the provided user information

    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Styles.primaryWhiteColor,
          contentPadding: const EdgeInsets.all(20.0),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 64.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Sign Up Successful',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Thank you for signing up to Patofy App, \nplease login using your email and passowrd to access your account',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );

    // Redirect to login page after 3 seconds
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    });
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
                height: 80.0,
                width: 80.0,
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
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: const UnderlineInputBorder(),
                    errorText: _firstNameError,
                  ),
                  style: TextStyle(
                    color: _firstNameError != null ? Colors.red : null,
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: const UnderlineInputBorder(),
                    errorText: _lastNameError,
                  ),
                  style: TextStyle(
                    color: _lastNameError != null ? Colors.red : null,
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const UnderlineInputBorder(),
                    errorText: _emailError,
                  ),
                  style: TextStyle(
                    color: _emailError != null ? Colors.red : null,
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: const UnderlineInputBorder(),
                    errorText: _phoneNumberError,
                  ),
                  style: TextStyle(
                    color: _phoneNumberError != null ? Colors.red : null,
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const UnderlineInputBorder(),
                    errorText: _passwordError,
                  ),
                  style: TextStyle(
                    color: _passwordError != null ? Colors.red : null,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 1.0),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: const UnderlineInputBorder(),
                    errorText: _confirmPasswordError,
                  ),
                  style: TextStyle(
                    color: _confirmPasswordError != null ? Colors.red : null,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 6.0),
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
              if (_termsError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _termsError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primaryRedColor,
                  ),
                  child:  Text(
                    'Sign Up',
                    style: TextStyle(color: Styles.primaryWhiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text('Or sign up with'),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle Google signup
                      // _authController.googleSignIn();
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
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign In'),
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

