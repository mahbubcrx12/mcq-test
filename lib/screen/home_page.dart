import 'package:flutter/material.dart';
import 'package:mcq_test/service/question_adding.dart';
import 'package:mcq_test/widget/custom_button.dart';
import 'package:mcq_test/widget/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    questionController.dispose();
    option4Controller.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    answerController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Question making"), centerTitle: true,),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(controller: questionController,
                    obscureText: false,
                    hintText: "Make a question..."),
                SizedBox(height: 10,),
                CustomTextField(controller: option1Controller,
                    obscureText: false,
                    hintText: "Option A"),
                SizedBox(height: 10,),
                CustomTextField(controller: option2Controller,
                    obscureText: false,
                    hintText: "Option B"),
                SizedBox(height: 10,),
                CustomTextField(controller: option3Controller,
                    obscureText: false,
                    hintText: "Option C"),
                SizedBox(height: 10,),
                CustomTextField(controller: option4Controller,
                    obscureText: false,
                    hintText: "Option D"),
                SizedBox(height: 10,),
                CustomTextField(controller: answerController,
                    obscureText: false,
                    hintText: "Answer : "),
                SizedBox(height: 20,),

                CustomButton(buttonName: "Save Question", onTap: () {
                  QuestionMaking().addQuestion(
                      questionDetail: questionController.text,
                      optionA: option1Controller.text,
                      optionB: option2Controller.text,
                      optionC: option3Controller.text,
                      optionD: option4Controller.text,
                      answer: answerController.text);
                })

              ],
            ),
          )
      ),
    );
  }
}
