import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mcq_test/service/fetch_quetion_firebase.dart';

class QuestionController extends GetxController{
  final questionList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async{
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('questionSet').get();
      questionList.value = snapshot.docs.map((e) => e.data()).toList();
    }catch (e){
      print('$e');
    }
  }

}