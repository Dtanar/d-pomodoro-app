import 'package:dtanar_pomodor/provider/time_service.dart';
import 'package:dtanar_pomodor/utils/utils.dart';
import 'package:dtanar_pomodor/widgets/progress_widget.dart';
import 'package:dtanar_pomodor/widgets/time_controller.dart';
import 'package:dtanar_pomodor/widgets/timer_cart.dart';
import 'package:dtanar_pomodor/widgets/timer_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerServices>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          'MY POMODORO',
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () => Provider.of<TimerServices>(context, listen: false).reset(),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              TimerCard(),
              SizedBox(height: 40.0),
              TimerOptions(),
              SizedBox(height: 30.0),
              TimeController(),
              SizedBox(height: 30.0),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}
