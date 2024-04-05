import 'package:dtanar_pomodor/provider/time_service.dart';
import 'package:dtanar_pomodor/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerServices>(context);
    final seconds = provider.currentDuration % 60;
    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(35, Colors.white, FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // responsive width with media query
              width: MediaQuery.of(context).size.width / 3.2, //32% of the width
              height: 170.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(width: 1,color: Colors.lightGreenAccent),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString(),
                  style: textStyle(70, renderColor(provider.currentState), FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(60, Colors.white, FontWeight.w700),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              // responsive width with media query
              width: MediaQuery.of(context).size.width / 3.2, //32% of the width
              height: 170.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(width: 1,color: Colors.lightGreenAccent),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                child: Text(
                  seconds == 0
                      ? "${seconds.round()}0"
                      : seconds.round().toString(),
                  style: textStyle(70, renderColor(provider.currentState), FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
