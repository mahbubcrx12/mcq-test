import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcq_test/screen/home_page.dart';
import 'package:mcq_test/screen/question_making.dart';
import 'package:mcq_test/widget/custom_button.dart';
import 'package:mcq_test/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:mcq_test/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? errorMessage = "";
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();

  Future<void>signInWithEmailAndPassword()async{
    try{
      await Auth().signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      Get.to(()=>HomePage());
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage=e.message;
      });
      Get.snackbar("Unauthentic user", "User email or password is incorrect");
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try{
      await Auth().createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Spacer(),
              Text("Login",
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.redAccent.withOpacity(.5)),
              ),
              SizedBox(height: 20,),
              CustomTextField(
                  controller: _emailController,
                  obscureText: false,
                  hintText: "Email",
                validator: (val){
                    if(val == null || val.isEmpty){
                      Get.snackbar("No Email", "Enter an email");
                    }
                    return null;
                },
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                   decoration: InputDecoration(
                     hintText: "password",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(
                         Radius.circular(0),
                       ),
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                             width: 2, color: Colors.redAccent.withOpacity(.5))),
                   ),



                validator: (val){
                      if(val!.length <5){
                        Get.snackbar("Password is too short", "Enter at least 5 character");
                      }
                },
                ),
              ),
              SizedBox(height: 30,),
              CustomButton(
                buttonName: "Go",
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    signInWithEmailAndPassword();
                  }

                },
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child: Text("Not registered?Sign Up",style: TextStyle(
                      color: Colors.redAccent.withOpacity(.5)
                    ),)),
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
