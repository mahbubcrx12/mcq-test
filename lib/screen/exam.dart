import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final Stream<QuerySnapshot> _questionSet = FirebaseFirestore.instance.collection("questionSet").snapshots();
  bool? _check;

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
        body: StreamBuilder<QuerySnapshot>(
            stream: _questionSet,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return Text("Something went wrong");
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document){
                  Map<String,dynamic> examData = document.data()! as Map<String,dynamic>;
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(.2),
                    ),
                    child: Column(children: [
                      Row(
                        children: [

                          Text(examData['questionDetail'],style: TextStyle(fontSize: 30),),
                        ],
                      ),
                      Text(examData['optionA'],style: TextStyle(fontSize: 20),),
                      Text(examData['optionB'],style: TextStyle(fontSize: 20),),
                      Text(examData['optionC'],style: TextStyle(fontSize: 20),),
                      Text(examData['optionD'],style: TextStyle(fontSize: 20),),
                      


                      
                    ],),
                  );
                }).toList(),
              );
          },
        )
      ),
    );
  }
}
