import 'package:azkar_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/constants.dart';

class AzkarSabaah extends StatelessWidget {
  static String id = 'AzkarSabaah';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: KPrimaryColor,iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'اذكار الصباح',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        body: FutureBuilder<dynamic>(
            future: Api().getData(url: AzkarSabahUrl),
            builder: (context, snapshot)
            {
              if (snapshot.hasData)

              {

                return ListView(children:
                [
                  ...List.generate(snapshot.data.length,
                          (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Column(
                            children:
                            [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffECE5C8),
                                    borderRadius: BorderRadius.circular(16)),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, top: 8, bottom: 8),
                                  child: Text(
                                    snapshot.data![index].content[index].zekr,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(child:
                                      GestureDetector(onTap: ()
                                      {
                                        Share.share('${snapshot.data[index].content[index].zekr}');
                                      },
                                          child: Icon(Icons.share,size: 15,)),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: 2, color: Colors.green)
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        'المشاركه',
                                        style: TextStyle(fontSize: 16),

                                      ),
                                      SizedBox(width: 10,),
                                      Container(alignment: Alignment.center,
                                        child: Text('${snapshot.data![index].content[index].repeat}'),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: 2, color: Colors.green)
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        'التكرار',style: TextStyle(fontSize: 16),

                                      ),

                                    ]),

                                color: Color(0xffC1DEDC),

                              ),
                            ],
                          )

                      )),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                        onPressed: (){
                          QuickAlert.show(title: 'حفظكم الله ',confirmBtnText: 'احسنت',
                              confirmBtnColor: Colors.green,
                              text: 'تقبل الله منا ومنكم ',
                              context: context, type:
                              QuickAlertType.success);
                        }, child: Text('انتهت الاذكار',style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white),)),
                  )
                ],);
              }
              else
              {
                return    ListView.separated(itemCount: 20,
                  separatorBuilder: (context,index)=>
                      SizedBox(height: 20),
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                      child: Column(
                        children: [
                          Shimmer.fromColors(highlightColor: Colors.grey[400]!,
                            baseColor: Colors.grey[300]!,
                            direction: ShimmerDirection.rtl,
                            child: Container(height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              width: double.infinity,

                            ),
                          ),
                          Container(width: double.infinity,height: 30,

                            decoration:BoxDecoration(
                                shape: BoxShape.rectangle,color: Colors.grey[300]) ,)
                        ],
                      ),
                    );
                  } ,

                );
              }




            }));
  }
}
