import 'package:azkar_app/cubit/azkar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AzkarCubit>(context);

    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(itemCount: cubit.azkari.length,
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemBuilder: (context, index) =>
            GestureDetector(onTap: () {
              Navigator.pushNamed(context, cubit.detailedScreens[index]);
            },
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${cubit.azkari[index].text}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Image.asset('${cubit.azkari[index].image}',
                          width: 100, height: 100,
                        ),
                      ),

                    ]),
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                    color: Color(cubit.azkari[index].color),
                    borderRadius: BorderRadius.circular(34)),),
            ),
      ),
    ),

      appBar: AppBar(centerTitle: true, backgroundColor: KPrimaryColor,

          title: const Text('اذكاري ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),)),);
  }
}
