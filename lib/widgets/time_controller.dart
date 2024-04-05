import 'package:dtanar_pomodor/provider/time_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerServices>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: provider.currentState == "FOCUS" ? Colors.green.withOpacity(0.3) :Colors.amber.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            provider.isPlaying
                ? Provider.of<TimerServices>(context, listen: false).pause()
                : Provider.of<TimerServices>(context, listen: false).start();
          },
          icon: provider.isPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow_rounded),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
