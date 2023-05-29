import 'dart:math';

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  GroupController controller = GroupController();
  CustomGroupController customGroupController = CustomGroupController();
  ListGroupController listController = ListGroupController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent.withOpacity(.5),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SimpleGroupedCheckbox<int>(
                controller: controller,

                itemsTitle: ["A", "B", "C", "D"],
                values: [1, 2, 4, 5],
                groupStyle: GroupStyle(
                    activeColor: Colors.green,
                    itemTitleStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                checkFirstElement: false,
              ),
              // ListGroupedCheckbox(
              //   controller: listController,
              //   groupTitles: List.generate(3, (index) => "groupe $index"),
              //   values: List.generate(
              //     3,
              //         (i) =>
              //         List.generate(5, (j) => "${(i + Random().nextInt(100)) * j}"),
              //   ),
              //   titles: List.generate(
              //     3,
              //         (i) => List.generate(5, (j) => "Title:$i-$j"),
              //   ),
              //   mapItemGroupedType: {
              //     1: GroupedType.Chips,
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
