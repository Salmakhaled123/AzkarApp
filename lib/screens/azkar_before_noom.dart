import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AzkarBeforeNoom extends StatelessWidget
{
static String id='AzkarBeforeNoom';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, backgroundColor:KPrimaryColor,
        title: Text('اذكار قبل النوم ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),)),);
  }
}
