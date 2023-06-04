import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq_test/screen/quiz_page.dart';
class ResultPage extends StatelessWidget {
  final int? result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double resultInPer =(result!/50)! * 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(.5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your achievement: ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '$result',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            Text(
              'Total Marks: 50',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'In Percentage: $resultInPer',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w500),
                ),
                Text('%', style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              Get.to(()=>QuizPage());
            }, child: Text("Restart Quiz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(primary: Colors.redAccent.withOpacity(.5)),
            )
          ],
        ),
      ),
    );
  }
}
