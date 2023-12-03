import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/answers_button.dart';
import 'package:adv_basics/data/qutions.dart';

class QustionScreen extends StatefulWidget {
  const QustionScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answe) onSelectAnswer;
  @override
  State<QustionScreen> createState() {
    return _QustionScreenState();
  }
}

class _QustionScreenState extends State<QustionScreen> {
  var currentqustionIndex = 0;

  void answerQustion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentqustionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentqustion = qustions[currentqustionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentqustion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 103, 111, 219),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentqustion.getShuffeledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQustion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
