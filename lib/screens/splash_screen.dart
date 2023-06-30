import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:azkar_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
static String id='SplashScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 120,backgroundColor: KPrimaryColor,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        splash: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children:
        [
      Expanded(
        child: Image.asset('assets/pray.png',
          ),
      ),
          SizedBox(height: 10,),
      const  Text('اذكاري',style: TextStyle(fontSize: 24,color: Colors.black,
            fontWeight: FontWeight.bold),)


    ]),
        nextScreen:MainScreen());
  }
}
