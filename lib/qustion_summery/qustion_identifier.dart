import 'package:flutter/widgets.dart';

class QustionIdentifier extends StatelessWidget {
  const QustionIdentifier(
      {super.key, required this.qustionindex, required this.iscorrect});
  final int qustionindex;
  final bool iscorrect;
  @override
  Widget build(BuildContext context) {
    final qustionnum = qustionindex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: iscorrect
            ? const Color.fromARGB(255, 55, 206, 25)
            : const Color.fromARGB(255, 216, 81, 27),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        qustionnum.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(200, 25, 2, 56)),
      ),
    );
  }
}
