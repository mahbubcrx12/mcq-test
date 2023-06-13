import 'package:flutter/material.dart';
import 'package:mcq_test/controller/question_firebase_controller.dart';
import 'package:mcq_test/service/fetch_quetion_firebase.dart';
import 'package:get/get.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({Key? key}) : super(key: key);
  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  final QuestionController questionController = Get.put(QuestionController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Question from FB'),
        ),
        body: Obx(
        () => PageView.builder(
        itemCount: questionController.questionList.length,
        itemBuilder: (context, index) {
      final question = questionController.questionList[index];

      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['questionDetail'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Answer: ${question['answer']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Options:',
              style: TextStyle(fontSize: 16.0),
            ),
            Column(
              children: (question['options'] as List<dynamic>).map((option) {
                return Text(
                  option.toString(),
                  style: TextStyle(fontSize: 14.0),
                );
              }).toList(),
            ),
          ],
        ),
      );}
    ))
    );
  }
}
