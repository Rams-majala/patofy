import 'package:flutter/material.dart';
import 'package:patofy/constants/colors.dart';
import 'package:patofy/screens/auth/signin.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
 List<String> verificationCode = List<String>.filled(6, '');
  int currentBoxIndex = 0;
  bool isLoading = false;

  void _onCodeChanged(String value) {
    setState(() {
      verificationCode[currentBoxIndex] = value;
      if (currentBoxIndex < verificationCode.length - 1) {
        currentBoxIndex++;
      } else {
        // All boxes are filled, simulate verification process
        isLoading = true;
        Navigator.push(context, MaterialPageRoute(builder: (_)=> SignInScreen()));
        
      }
    });

    // Move to the next box automatically
    if (value.isNotEmpty && currentBoxIndex < verificationCode.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }


  List<Widget> buildCodeBoxes() {
    List<Widget> codeBoxes = [];
    for (int i = 0; i < verificationCode.length; i++) {
      codeBoxes.add(
        Container(
          width: 50,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              onChanged: (value) => _onCodeChanged(value),
              maxLength: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      );
    }
    return codeBoxes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_user,
                    size: 180,
                    color: Styles.primaryRedColor,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Verify Your Phone number',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Text(
                      'Enter the verification code we have sent to  your phone number',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildCodeBoxes(),
                  ),
                  SizedBox(height: 24),
                  
                ],
              ),
      ),
    );
  }
}
