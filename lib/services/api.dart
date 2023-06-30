import 'package:azkar_app/models/azkar_model.dart';
import 'package:dio/dio.dart';

import '../constants/constants.dart';

class Api{
  List<AzkarModel>azkarModel=[];
  getData({required String url})async
  {
    Response response=await Dio().get(url,);
     var data= AzkarModel.fromJson(response.data);
     for(int i=0;i<data.content.length;i++)
       {
         azkarModel.add(data);
       }
print(azkarModel.length);
      return azkarModel;
  }
}