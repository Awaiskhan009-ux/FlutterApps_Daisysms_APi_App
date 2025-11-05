import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/HomeScreen.dart';
import 'package:flutter_application_2/views/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
 _checkLogin();
    });
  
  }
  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Image.asset('assets/images/logoremove.png',height: MediaQuery.of(context).size.height*0.25,width: MediaQuery.of(context).size.width*0.6,fit: BoxFit.contain,),
      
        SizedBox(height: 20,),
        CircularProgressIndicator(
          color: Colors.blue,
        ),
        SizedBox(height: 10,),
        Text("Loading...",style: TextStyle(color: Colors.grey,fontSize: 20),)
        
            
          ],),
      ),
    );
  }
}