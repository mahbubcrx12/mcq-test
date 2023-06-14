import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mcq_test/controller/question_firebase_controller.dart';
import 'package:mcq_test/screen/result_page.dart';
import 'package:mcq_test/service/fetch_quetion_firebase.dart';
import 'package:get/get.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({Key? key}) : super(key: key);

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  final QuestionController questionController = Get.put(QuestionController());

  var _questionIndex = 0;
  Timer? _timer;
  int _remainingTime = 15;
  var _totalScore = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    // TODO: implement dispose
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _cancelTimer();
          _navigateToNextQuestion();
        }
      });
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  void _navigateToNextQuestion([int? score]) {
    setState(() {
      if (_questionIndex < questionController.questionList.length - 1) {
        _questionIndex++;
        _remainingTime = 15;
        startTimer();
      } else {
        print("quiz completed");
         Get.to(()=>ResultPage(result:score ?? 0,));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Firebase Question",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent.withOpacity(.5),
        ),
        body: Obx(() => PageView.builder(
            itemCount: questionController.questionList.length,
            itemBuilder: (context, index) {
              final question = questionController.questionList[_questionIndex];

              return Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remaining:",
                          style: TextStyle(color: Colors.black.withOpacity(.4)),
                        ),
                        Text(
                          '$_remainingTime',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'second',
                          style: TextStyle(color: Colors.black.withOpacity(.4)),
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        question['questionDetail'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Answer: ${question['answer']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    // SizedBox(height: 10.0),
                    // Text(
                    //   'Options:',
                    //   style: TextStyle(fontSize: 16.0),
                    // ),

                    Column(
                      children:
                          (question['options'] as List<dynamic>).map((option) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(.1)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Container(
                                    child: Text(option.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                print('ffffffffffffffffffffffff');
                                print(option);
                                print(question['answer']);
                                if(option == question['answer']){
                                  _totalScore =_totalScore + 10;
                                  Get.snackbar('Right', 'Great');
                                }else{
                                  Get.snackbar('Wrong!!!', 'Oops!');
                                }
                                _cancelTimer();
                                _navigateToNextQuestion(_totalScore);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            })));
  }
}
