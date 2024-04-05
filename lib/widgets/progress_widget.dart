import 'package:dtanar_pomodor/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/time_service.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerServices>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(30, Colors.white54, FontWeight.bold),
            ),
            Text(
              "${provider.goal}/12",
              style: textStyle(30, Colors.white54, FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "ROUND",
              style: textStyle(19, Colors.white70, FontWeight.bold),
            ),
            Text(
              "GOAL",
              style: textStyle(19, Colors.white70, FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
