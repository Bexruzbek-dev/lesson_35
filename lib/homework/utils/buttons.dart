import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_35/homework/utils/board.dart';
import 'package:lesson_35/homework/xo.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        Center(
          child: InkWell(
            onTap: () {
              board = List.generate(3, (_) => List.filled(3, ''));
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 362,
              height: 50,
              color: Colors.teal.shade700,
              child: const Text(
                textAlign: TextAlign.center,
                "New Game",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        Center(
          child: InkWell(
            onTap: () {
              userPoint = 0;
              compPoint = 0;
              board = List.generate(3, (_) => List.filled(3, ''));
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 362,
              height: 50,
              color: Colors.teal.shade700,
              child: const Text(
                textAlign: TextAlign.center,
                "Reset Game",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
