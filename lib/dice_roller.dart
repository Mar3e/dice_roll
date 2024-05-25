import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceFace = 1;
  bool isRolling = false;

  rollDice() async {
    // stop the repeated click of the dice roll
    isRolling = true;
    // simulate the dice moving around, slowing with each roll
    var delayTime = 0;
    // make the dice roll few times
    for (int i = 0; i < 6; i++) {
      // make sure the dice does not have the same face twice in a raw
      var previousRoll = diceFace;
      var newRoll = randomizer.nextInt(6) + 1;
      if (previousRoll != newRoll) {
        await Future.delayed(Duration(milliseconds: delayTime));
        setState(() {
          diceFace = newRoll;
        });
        SystemSound.play(SystemSoundType.click);
        delayTime += 150;
      } else {
        // don't count a roll if the same number repeated
        i--;
      }
    }
    isRolling = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceFace.png',
          width: 200,
        ),
        const SizedBox(height: 24.0),
        TextButton(
          onPressed: isRolling ? null : rollDice,
          style: FilledButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28.0,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
