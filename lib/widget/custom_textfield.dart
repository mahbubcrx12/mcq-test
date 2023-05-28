import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
   bool obscureText = false;
  final TextEditingController controller;
  final String? Function(String?)? validator;

    CustomTextField(
      {Key? key,
      required this.controller,
       required this.obscureText,
      required this.hintText,
        this.validator
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
       // obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Colors.redAccent.withOpacity(.5))),
        ),
        validator: validator,
      ),
    );
  }
}
