import 'package:cloud_firestore/cloud_firestore.dart';
class QuestionInserting{
  
  Future<String?> addQuestion({
    required String questionDetail,
    required String answer,
    required String correctIndex,
    required List<String> options,
})async{
    try{
      CollectionReference reference= FirebaseFirestore.instance.collection("questionSet");
      DocumentReference docRef = reference.doc();
      String docId=docRef.id;
      await docRef.set({
        'questionDetail' : questionDetail,
        'answer' : answer,
        'correctIndex': correctIndex,
        'options':options
      });

      return docId;

    }catch(e){
      return "error rrrrrrrrrrrr";
    }
  }
  
}