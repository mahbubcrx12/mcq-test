import 'package:flutter/material.dart';
import 'package:mcq_test/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
                CustomTextField(hintText: "Enter Email", isVisible: true)
          ],
        ),
      ),
    );
  }
}
