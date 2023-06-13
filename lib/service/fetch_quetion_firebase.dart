// import 'package:cloud_firestore/cloud_firestore.dart';
//
// // Fetch data from Firestore
// Future<void> fetchData() async {
//   try {
//     QuerySnapshot snapshot =
//     await FirebaseFirestore.instance.collection('questionSet').get();
//
//     snapshot.docs.forEach((doc) {
//       // Access document fields
//       String qdetails = doc['questionDetail'];
//       List<dynamic> optionList = doc['options'];
//       String answer = doc['answer'];
//
//
//       // Do something with the data
//       print('Qdetails: $qdetails');
//       print('options: $optionList');
//       print('answer: $answer');
//
//
//     });
//   } catch (e) {
//     // Handle any errors
//     print('Error fetching data: $e');
//   }
// }