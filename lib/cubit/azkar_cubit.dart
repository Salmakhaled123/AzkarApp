import 'package:azkar_app/screens/azkar_before_noom.dart';
import 'package:azkar_app/screens/azkar_massa.dart';
import 'package:azkar_app/screens/azkar_sabah.dart';
import 'package:azkar_app/screens/azkar_salaa.dart';
import 'package:azkar_app/screens/elctronic_sbha.dart';
import 'package:azkar_app/screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/datemodel.dart';
import '../models/general_azkar.dart';
import '../screens/calender.dart';

part 'azkar_state.dart';
class AzkarCubit extends Cubit<AzkarState>
{
  AzkarCubit() : super(AzkarInitial());
  int currentIndex=0;
  void changeIndex(int value,context)
  {
    currentIndex=value;
    if(currentIndex==0)
      {
        focusDay=DateTime.now();
      }
    emit(ChangeIndexSuccess());
  }
  List<GeneralAzkar>azkari=
  [
    GeneralAzkar(text: 'اذكار الصباح', image: 'assets/sun.png',color: 0xffFFD89C),
    GeneralAzkar(text: 'اذكار المساء', image: 'assets/moon.png',color: 0xff5A96E3),
    GeneralAzkar(text: 'اذكار  بعد الصلاه', image: 'assets/salaa.png', color: 0xff98EECC),
    GeneralAzkar(text: 'اذكار قبل النوم', image: 'assets/sleep.png', color: 0xffFFD0D0)
  ];
  int counter=0;
  void incrementSabha()
  {
    counter++;
    emit(IncrementedSuccess());
  }
  void reset()
  {
    counter=0;
    emit(ResetSuccess());
  }
  String replaceArabicNumber(String input)
  {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠',	'١','٢',	'٣',	'٤','٥'	,'٦',	'٧'	,'٨'	,'٩'];

    for (int i = 0; i < english.length; i++)
    {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }
  List<Widget>screens=[
   HomeScreen(),
    SbhaScreen(),
    CalenderScreen(),
  ];

  List<BottomNavigationBarItem>items=
 const [
    BottomNavigationBarItem(
      icon:  Icon(Icons.home_filled), label: 'الرئيسيه',),
    BottomNavigationBarItem(
        icon: Icon(FlutterIslamicIcons.tasbihHand), label: 'السبحه'),
    BottomNavigationBarItem(
        icon: Icon(FlutterIslamicIcons.calendar), label: 'التاريخ الهجري'),
  ];

  List<String>detailedScreens=
  [
    AzkarSabaah.id,
    AzkarMassa.id,
    AzkarSalaa.id,
    AzkarBeforeNoom.id
  ];

  DateTime focusDay=DateTime.now();
  String ?newMonth,newDate,newYear,day;
  void getHijraDate(focusDay)async
  {
    Response response=await Dio().get('$HijraBaseUrl${focusDay.day}-${focusDay.month}-${focusDay.year}');
    var data=DateModel.fromJson(response.data);
    newMonth=data.hijri.month.ar;
    newYear=replaceArabicNumber(data.hijri.year);
    day=data.hijri.weekDay.ar;
    newDate=replaceArabicNumber((int.parse(data.hijri.day)+1).toString());
    emit(ChangeDateSuccess());
  }

}
