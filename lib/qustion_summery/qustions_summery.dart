// ignore: unused_import
import 'package:adv_basics/qustion_summery/summery_item.dart';
import 'package:flutter/widgets.dart';

class QustionsSummery extends StatelessWidget {
  const QustionsSummery({super.key, required this.summerydata});
  final List<Map<String, Object>> summerydata;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summerydata.map(
            (data) {
              return SummeryItem(data);
              // return Row(
              //   children: [
              //     Text(((data['qustion_index'] as int) + 1).toString()),
              //     Expanded(
              //       child: Column(
              //         children: [
              //           Text(data['qustion'] as String),
              //           const SizedBox(
              //             height: 5,
              //           ),
              //           Text(data['user_answer'] as String),
              //           Text(data['correct _answer'] as String),
              //         ],
              //       ),
              //     )
              //   ],
              // );
            },
          ).toList(),
        ),
      ),
    );
  }
}
