import 'package:azkar_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/azkar_cubit.dart';

class SbhaScreen extends StatelessWidget
{
static String id='sbha';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, backgroundColor:KPrimaryColor,
        title: const Text('السبحه الالكترونيه',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),)),
        
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<AzkarCubit, AzkarState>(
  builder: (context, state) {
    var cubit=BlocProvider.of<AzkarCubit>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Center(child: 
          GestureDetector(onTap:()
          {
            cubit.incrementSabha();
          } ,
            child: CircleAvatar(radius:145,child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text('${cubit.counter}',style: TextStyle(color: Colors.black,fontSize: 80,
                fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text('سبح',style: TextStyle(fontSize: 30,color: Colors.black),)
        ]),
              backgroundColor: KPrimaryColor),
          ),),
        SizedBox(height: 20,),
        IconButton(onPressed: (){
          cubit.reset();
        },color: Colors.grey,
            icon: const Icon(Icons.refresh_outlined,
              size: 40,))]
      );
  },
),
    ));
  }
}
