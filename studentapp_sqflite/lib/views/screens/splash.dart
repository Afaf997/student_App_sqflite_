import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:studentapp_sqflite/views/screens/main_student_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return AnimatedSplashScreen(
      splash: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500), // Adjust the animation duration
            style: TextStyle(
              fontFamily: AutofillHints.addressCityAndState,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("StudentApp"),
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500), 
            style: TextStyle(
              fontSize: 20,
              color: Colors.white, 
            ),
            child: Text("A collection of Students"),
          ),
        ],
      ),
      nextScreen: const MainStudentsScreen(),
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor:  Colors.teal,
    );
  }
}