import 'package:flutter/material.dart';

import 'package:dice_roll/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
        gradientColors: [
          Color.fromARGB(255, 216, 213, 213),
          Color.fromARGB(255, 174, 201, 207),
          Color.fromARGB(255, 131, 171, 190),
        ],
      ),
    ),
  ));
}
