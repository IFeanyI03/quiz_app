import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer'] == data['correct_answer']
                        ? Colors.green
                        : Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),

                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 36, 11, 70),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
