import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fontWeight]) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

//list of selectable time slots
List selectableTimes = [
  // times in seconds, and an interval of 5 mins
  "0",
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300",
  "3600",
];

Color renderColor(String currentState){
  if(currentState == "FOCUS"){
    return Colors.greenAccent;
  }
  else{
    return Colors.amberAccent;
  }
}
