import 'package:adv_basics/data/qutions.dart';
import 'package:adv_basics/qustion_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quizz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];
  void reStartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'Qustion-Screen';
    });
  }

  void home() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'Qustion-Screen';
    });
  }

  void chooseAnser(answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == qustions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'Qustion-Screen') {
      screenWidget = QustionScreen(onSelectAnswer: chooseAnser);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        home: home,
        selectanswer: selectedAnswer,
        choosenAnswer: selectedAnswer,
        onRestart: reStartQuiz,
      );
    }

    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : QustionScreen(onSelectAnswer: chooseAnser);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 28, 5, 156),
                Color.fromARGB(255, 6, 1, 34),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
