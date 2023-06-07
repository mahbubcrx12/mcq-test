import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq_test/screen/home_page.dart';
import 'package:mcq_test/screen/quiz_page.dart';
import 'package:mcq_test/service/store_result.dart';

class ResultPage extends StatelessWidget {
  final int? result;


  const ResultPage({Key? key, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double resultper = ((result! / 50)! * 100);
    String resultInPer = resultper.toStringAsFixed(2);
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
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(.2)
                ),
                child: Row(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Marks: 50',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'In Percentage: ${resultInPer}%',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () async {
                // Insert data into table
                await StoreResult.insertData(
                    DateTime.now().toString(), result!, resultper);

                //Query all data from table
                List<Map<String,dynamic>> resultData = await StoreResult.getAllResult();
                print("kkkkkkkkkkkkkkkkkkkkkkkkkk");
                print(resultData);
                Get.to(() => HomePage());
              },
              child: Text(
                "Go Home",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.redAccent.withOpacity(.6),
              )
            )
          ],
        ),
      ),
    );
  }
}
