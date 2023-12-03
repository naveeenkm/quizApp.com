import 'package:flutter/material.dart';
import 'package:adv_basics/data/qutions.dart';
import 'package:adv_basics/qustion_summery/qustions_summery.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key,
      required this.home,
      required this.choosenAnswer,
      required this.onRestart,
      required this.selectanswer});
  final void Function() home;
  List<String> selectanswer;
  final void Function() onRestart;
  final List<String> choosenAnswer;
  List<Map<String, Object>> getSummery() {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summery.add(
        {
          'qustion_index': i,
          'qustion': qustions[i].text,
          'correct _answer': qustions[i].answers[0],
          'user_answer': choosenAnswer[i],
        },
      );
    }
    return summery;
  }

  @override
  Widget build(context) {
    final summaryData = getSummery();
    final numberoftotal = qustions.length;
    final numberofCorrect = summaryData.where((data) {
      return data['correct _answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numberofCorrect out of $numberoftotal qustions corectly..',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            QustionsSummery(summerydata: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quizz..!'),
              icon: const Icon(Icons.refresh),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: home,
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 247, 3, 3)),
              child: const Text('Home '),
            )
          ],
        ),
      ),
    );
  }
}
