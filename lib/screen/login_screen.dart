import 'package:flutter/material.dart';
import 'package:mcq_test/screen/home_page.dart';
import 'package:mcq_test/widget/custom_button.dart';
import 'package:mcq_test/widget/custom_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              CustomTextField(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: "Password"),
              SizedBox(height: 30,),
              CustomButton(
                buttonName: "Go",
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    //Get.to(()=>HomePage());
                  }

                },
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
