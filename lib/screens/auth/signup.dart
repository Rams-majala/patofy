import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/auth/otp.dart';
import 'package:patofy/screens/auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreeToTerms = false;
  bool _isSigningUp = false; // New variable to track signup process

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

  Future<void> _signup() async {
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


    
  // Check if email or phone number already exists in Firestore
  QuerySnapshot emailSnapshot = await _firestore
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  QuerySnapshot phoneNumberSnapshot = await _firestore
      .collection('users')
      .where('phoneNumber', isEqualTo: phoneNumber)
      .get();

  if (emailSnapshot.docs.isNotEmpty) {
    // Email already exists
    setState(() {
      _emailError = 'Email already exists. Please use a different email.';
    });
    return;
  }

  if (phoneNumberSnapshot.docs.isNotEmpty) {
    // Phone number already exists
    setState(() {
      _phoneNumberError = 'Phone number already exists. Please use a different phone number.';
    });
    return;
  }

    setState(() {
      _isSigningUp = true; // Set _isSigningUp to true before starting the signup process
    });

    try {
      // Register the user with FirebaseAuth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        // You can add more fields as needed
      });



      print("Successfully registered. Verification email sent to ${userCredential.user!.email}");

      setState(() {
        _isSigningUp = false; // Set _isSigningUp back to false after signup is completed successfully
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpScreen()), // Replace OtpScreen with your OTP verification screen
      );
    } catch (e) {
      print("Error occurred $e");

      setState(() {
        _isSigningUp = false; // Set _isSigningUp back to false if an error occurs during signup
      });
    }
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const UnderlineInputBorder(),
                    errorText: _passwordError,
                    suffixIcon: Icon(Icons.remove_red_eye, size: 16),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye, size: 16),
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
                    checkColor: Colors.blue.shade800,
                    activeColor: Styles.primaryWhiteColor,
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
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
                
                height: 50.0,
                child: Stack(
                  children: [
                    ElevatedButton(
                      onPressed: _isSigningUp ? null : _signup, // Disable button while signing up
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Styles.primaryRedColor,
                      ),
                      child: Text(
                        _isSigningUp ? 'please wait...' : 'Sign Up', // Show different text based on _isSigningUp
                        style: TextStyle(color: Styles.primaryWhiteColor),
                      ),
                    ),
                    if (_isSigningUp) // Show the loading indicator when signing up
                      Positioned.fill(
                        child: Center(
                          child: SpinKitCircle(
                            color: Styles.primaryWhiteColor,
                            size: 30.0,
                          ),
                        ),
                      ),
                  ],
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
                          builder: (_) => SignInScreen(),
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
