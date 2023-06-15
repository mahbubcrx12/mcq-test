import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq_test/screen/admin_set_question.dart';
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
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.redAccent,
                      );
                    }),
              )
              // Column(
              //   //mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     _addQuestion(),
              //     _adminQuestionSet(),
              //     _startQuiz(),
              //     _previousHistory(),
              //
              //
              //   ],
              // ),
            )));
  }


  _adminQuestionSet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: () {
          Get.to(() => QuestionListPage());
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .23,
          width: MediaQuery.of(context).size.width * .76,
          decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(.15),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Admin Question Set",
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
