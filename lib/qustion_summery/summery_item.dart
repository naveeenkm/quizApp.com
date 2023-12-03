import 'package:adv_basics/qustion_summery/qustion_identifier.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SummeryItem extends StatelessWidget {
  const SummeryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final iscorrectAns = itemData['user_answer'] == itemData['correct _answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QustionIdentifier(
            qustionindex: itemData['qustion_index'] as int,
            iscorrect: iscorrectAns),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['qustion'] as String,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(itemData['user_answer'] as String,
                style:
                    const TextStyle(color: Color.fromARGB(255, 140, 2, 214))),
            Text(itemData['correct _answer'] as String,
                style:
                    const TextStyle(color: Color.fromARGB(255, 227, 3, 227))),
          ],
        ))
      ],
    );
  }
}
