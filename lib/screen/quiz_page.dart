import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mcq_test/screen/result_page.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
              'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programming language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programming language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  Timer? _timer;
  int _remainingTime = 15;
  var _totalScore = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    // TODO: implement dispose
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _cancelTimer();
          _navigateToNextQuestion();
        }
      });
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  void _navigateToNextQuestion([int? score]) {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
        _remainingTime= 15;
        startTimer();
      }

      else {
        print("quiz completed");
        Get.to(()=>ResultPage(result:score ?? 0,));
      }

    });
  }



  // void _resetQuiz() {
  //   setState(() {
  //     _questionIndex = 0;
  //     _totalScore = 0;
  //   });
  // }

  // void _answerQuestion(int score) {
  //   _totalScore += score;
  //
  //   setState(() {
  //     _questionIndex = _questionIndex + 1;
  //   });
  //   // ignore: avoid_print
  //   print(_questionIndex);
  //   if (_questionIndex < _questions.length) {
  //     // ignore: avoid_print
  //     print('We have more questions!');
  //   } else {
  //     // ignore: avoid_print
  //     print('No more questions!');
  //   }
  // }
  //
  // void _rightOrWrongMessage(){
  //
  // }

  @override
  @override
  Widget build(BuildContext context) {
    //final question = _questions[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz On Going",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(.5),
      ),
      body: PageView.builder(
        itemCount: _questions.length,
        itemBuilder: (BuildContext context, int index) {
          final question = _questions[_questionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Remaining:",style: TextStyle(color: Colors.black.withOpacity(.4)),),
                  Text(
                    '$_remainingTime',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text('second',style: TextStyle(color: Colors.black.withOpacity(.4)),)
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  question['questionText'].toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              ...((question['answers'] as List<Map<String, Object>>)).map(
                (answer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        //height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(.1)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Container(
                              child: Text(
                                answer['text'].toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        setState(() {
                           int score= answer['score'] as int;
                          if(answer['score'] as int > 0){
                            Get.snackbar('Great...', 'RIGHT answer',backgroundColor: Colors.green,animationDuration: Duration(seconds: 0));
                          }
                          else{
                            Get.snackbar('Oops...', 'WRONG answer',backgroundColor: Colors.redAccent,animationDuration: Duration(seconds: 0));
                          }
                          _totalScore += score;
                          _cancelTimer();
                          _navigateToNextQuestion(_totalScore);
                        });
                      },

                    ),
                  );
                },
              ).toList(),
            ],
          );
        },
      ),
    );
  }
}
