import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TimerServices extends ChangeNotifier {
  Timer? timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool isPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";

//   function
  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;

    notifyListeners();
  }
  
  void reset() {
    timer?.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    isPlaying = false;
    
    notifyListeners();
  }

//   timer start function
  void start() {
    isPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer?.cancel();
    isPlaying = false;
    notifyListeners();
  }

  void handleNextRound() {
    final player  = AudioPlayer();
    if (currentState == "FOCUS" && rounds != 3) {

      player.play(AssetSource('bell.wav'));
      currentState = "BREAK";
      selectedTime = 300;
      currentDuration = 300;
      rounds++;
      goal++;
    } else if (currentState == "BREAK") {

      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONG-BREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    } else if (currentState == "LONG-BREAK") {
      player.play(AssetSource('bell.wav'));
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
