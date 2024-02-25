import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';  // Import the login page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {
      // 3 second delay
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      body: Center(
        child: Image.asset('assets/logo.png'),  // Replace 'assets/your_logo.png' with the path to your logo file
      ),
    );
  }
}
