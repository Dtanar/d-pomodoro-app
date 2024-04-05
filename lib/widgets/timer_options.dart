import 'package:dtanar_pomodor/provider/time_service.dart';
import 'package:dtanar_pomodor/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerOptions extends StatelessWidget {
  const TimerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    // provider
    final provider = Provider.of<TimerServices>(context);

    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 249),
      scrollDirection: Axis.horizontal,
      child: Row(
        // loop function
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              width: 70.0,
              height: 50.0,
              decoration: int.parse(time) == provider.selectedTime
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0))
                  : BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white54),
                      borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Text(
                  // no decimal point calculation
                  (int.parse(time) ~/ 60).toString(),
                  style: textStyle(
                      25,
                      int.parse(time) == provider.selectedTime
                          ? renderColor(provider.currentState)
                          : Colors.white,
                      int.parse(time) == provider.selectedTime
                          ? FontWeight.w700
                          : FontWeight.w500),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
