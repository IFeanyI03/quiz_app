import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onRestart,
    required this.onQuit,
    required this.chosenAnswers,
  });

  final void Function() onRestart;
  final void Function() onQuit;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  TextButton(
                onPressed: onRestart,
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                  backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromARGB(255, 33, 1, 95)),
                  padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                ),
                child: const Text('Restart Quiz!'),
              ),
              TextButton(
                onPressed: onQuit,
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                  backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromARGB(255, 33, 1, 95)),
                  padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                ),
                child: const Text('End Quiz'),
              ),
              ]
            )

          ],
        ),
      ),
    );
  }
}
