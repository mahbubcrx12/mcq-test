import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class QuestionInserting{
  
  Future<String?> addQuestion({
    required String questionDetail,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String answer
})async{
    try{
      CollectionReference reference= FirebaseFirestore.instance.collection("questionSet");
      await reference.doc(reference.id).set({
        'questionDetail' : questionDetail,
        'optionA' : optionA,
        'optionB' : optionB,
        'optionC' : optionC,
        'optionD' : optionD,
        'answer' : answer,
      });
    }catch(e){
      return "error rrrrrrrrrrrr";
    }
  }
  
}