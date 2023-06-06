import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq_test/screen/history.dart';
import 'package:mcq_test/screen/question_making.dart';
import 'package:mcq_test/screen/quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "MCQ Test",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.redAccent.withOpacity(.5),
            ),
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _addQuestion(),
                  _startQuiz(),
                  _previousHistory(),

                ],
              ),
            )));
  }

  _addQuestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          Get.to(() => QuestionMaking());
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .23,
          width: MediaQuery.of(context).size.width * .76,
          decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(.15),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Add Questions",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
  _startQuiz(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          Get.to(() => QuizPage());
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .23,
          width: MediaQuery.of(context).size.width * .76,
          decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(.15),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Start Quiz",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  _previousHistory(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          Get.to(() => HistoryPage());
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .23,
          width: MediaQuery.of(context).size.width * .76,
          decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(.15),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "View History",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

}
