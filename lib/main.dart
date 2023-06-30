import 'package:azkar_app/cubit/azkar_cubit.dart';
import 'package:azkar_app/screens/azkar_before_noom.dart';
import 'package:azkar_app/screens/azkar_massa.dart';
import 'package:azkar_app/screens/azkar_sabah.dart';
import 'package:azkar_app/screens/azkar_salaa.dart';
import 'package:azkar_app/screens/elctronic_sbha.dart';
import 'package:azkar_app/screens/calender.dart';
import 'package:azkar_app/screens/home_screen.dart';
import 'package:azkar_app/screens/main_screen.dart';
import 'package:azkar_app/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AzkarApp());
}

class AzkarApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          SbhaScreen.id:(context)=>SbhaScreen(),
          CalenderScreen.id:(context)=>CalenderScreen(),
          AzkarSabaah.id:(context)=>AzkarSabaah(),
          AzkarMassa.id:(context)=>AzkarMassa(),
          MainScreen.id:(context)=>MainScreen(),
          AzkarSalaa.id:(context)=>AzkarSalaa(),
          AzkarBeforeNoom.id:(context)=>AzkarBeforeNoom()
        },
        ),
    );
  }
}
