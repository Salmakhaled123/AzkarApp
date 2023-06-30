import 'package:azkar_app/cubit/azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MainScreen extends StatelessWidget {
  static String id = 'MainScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AzkarCubit>(context);
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BlocBuilder<AzkarCubit, AzkarState>(
            builder: (context, state) {
              return BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (value) {
                    cubit.changeIndex(value, context);
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: const Color(0xff3AA6B9),
                  unselectedItemColor: Colors.grey,
                  items: cubit.items
              );
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
