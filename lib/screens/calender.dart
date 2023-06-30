import 'package:azkar_app/cubit/azkar_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/constants.dart';

class CalenderScreen extends StatelessWidget {
  static String id = 'favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: KPrimaryColor,
            title: Text(
              'التاريخ الهجري ',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            var cubit=BlocProvider.of<AzkarCubit>(context);
            cubit.getHijraDate(cubit.focusDay);
            return Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              cubit.day==null? Shimmer.fromColors(baseColor:Colors.grey[400]! ,
                  highlightColor:Colors.grey[300]!,
                  child: Text('اليوم',style: TextStyle(fontSize: 20,),),
                ):Text('${cubit.day} ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
               cubit.newDate==null && cubit.newMonth==null && cubit.newYear==null?
                   Shimmer.fromColors(child: Text('التاريخ الهجري',style: TextStyle(fontSize: 24),), baseColor: Colors.grey[400]!,
                       highlightColor:Colors.grey[300]!): Text('${cubit.newDate} ${cubit.newMonth} ${cubit.newYear}',
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

                Expanded(
                  child: TableCalendar(availableGestures: AvailableGestures.all,
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: KPrimaryColor, shape: BoxShape.circle)),
                    selectedDayPredicate: (day) => isSameDay(day, cubit.focusDay),
                    onDaySelected: (DateTime day, DateTime day2) {

                        cubit.focusDay = day;

                    },
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true,
                    ),
                    focusedDay: cubit.focusDay,
                    firstDay: DateTime(2023),
                    lastDay: DateTime(2030),
                  ),
                ),

              ],
            );
          },
        ));
  }
}
