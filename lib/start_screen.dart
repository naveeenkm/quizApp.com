import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  State<StartScreen> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(context) {
    // ignore: unused_local_variable

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'Assets/images/quiz.png',
            width: 300,
          ),

          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'Assets/images/quiz.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Hello Everyone Attend the quiz..!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 73, 82, 205),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: widget.startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quizz"),
          )
        ],
      ),
    );
  }
}
