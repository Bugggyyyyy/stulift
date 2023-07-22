import 'package:flutter/material.dart';

ButtonStyle getButtonStyle(double width, double height) {
  return ElevatedButton.styleFrom(
    minimumSize: Size(width, height),
    backgroundColor: const Color.fromARGB(255, 73, 79, 239),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(height / 2)),
    ),
    elevation: 0,
  );
}

