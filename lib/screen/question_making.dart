import 'package:flutter/material.dart';
import 'package:mcq_test/service/question_adding.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import 'package:get/get.dart';

class QuestionMaking extends StatefulWidget {
  const QuestionMaking({Key? key}) : super(key: key);

  @override
  State<QuestionMaking> createState() => _QuestionMakingState();
}

class _QuestionMakingState extends State<QuestionMaking> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController answerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Question making",style: TextStyle(fontWeight: FontWeight.bold),), centerTitle: true,backgroundColor: Colors.redAccent.withOpacity(.5),),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  CustomTextField(controller: questionController,
                      obscureText: false,
                      hintText: "Make a question...",
                  validator: (val){
                    if(val!.isEmpty){
                      Get.snackbar("Field is empty", "Fill the field");
                    }
                  },
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(controller: option1Controller,
                      obscureText: false,
                      hintText: "Option A",
                      validator: (val){
                        if(val!.isEmpty){
                          Get.snackbar("Field is empty", "Fill the field");
                        }
                      }),
                  SizedBox(height: 10,),
                  CustomTextField(controller: option2Controller,
                      obscureText: false,
                      hintText: "Option B",
                      validator: (val){
                        if(val!.isEmpty){
                          Get.snackbar("Field is empty", "Fill the field");
                        }
                      }),
                  SizedBox(height: 10,),
                  CustomTextField(controller: option3Controller,
                      obscureText: false,
                      hintText: "Option C",
                      validator: (val){
                        if(val!.isEmpty){
                          Get.snackbar("Field is empty", "Fill the field");
                        }
                      }),
                  SizedBox(height: 10,),
                  CustomTextField(controller: option4Controller,
                      obscureText: false,
                      hintText: "Option D",
                      validator: (val){
                        if(val!.isEmpty){
                          Get.snackbar("Field is empty", "Fill the field");
                        }
                      }),
                  SizedBox(height: 10,),
                  CustomTextField(controller: answerController,
                      obscureText: false,
                      hintText: "Answer : ",
                      validator: (val){
                        if(val!.isEmpty){
                          Get.snackbar("Field is empty", "Fill the field");
                        }
                      }),
                  SizedBox(height: 20,),

                  CustomButton(buttonName: "Save Question", onTap: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      QuestionInserting().addQuestion(
                          questionDetail: questionController.text,
                          optionA: option1Controller.text,
                          optionB: option2Controller.text,
                          optionC: option3Controller.text,
                          optionD: option4Controller.text,
                          answer: answerController.text);
                    }

                  })

                ],
              ),
            ),
          )

      ),
    );
  }
}
