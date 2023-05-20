import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mcq_test/screen/home_page.dart';
import 'package:mcq_test/screen/login_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5),
            () {
              Get.to(LoginPage());
            });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body:Container(
          child: Image.asset("asset/mcq_splash.png",
            fit: BoxFit.cover,
             height: size.height,
            // width: size.width * .55,
          ),
        )
      ),
    );
  }
}
