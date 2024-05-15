import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_35/homework/utils/ballcounter.dart';
import 'package:lesson_35/homework/utils/board.dart';
import 'package:lesson_35/homework/utils/buttons.dart';

int userPoint = 0;
int compPoint = 0;

class Xo extends StatefulWidget {
  const Xo({super.key});

  @override
  State<Xo> createState() => _XoState();
}

class _XoState extends State<Xo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: const Text(
          "Tic Tac Toe Game ",
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            const Center(
              child: Text(
                ".............................",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(20),
            const Ballcounter(),
            const Gap(70),
            Center(
              child: Container(
                width: 362,
                height: 362,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                  ),
                ),
                child: const ShowBoard(),
              ),
            ),
            const Buttons(),
          ],
        ),
      ),
    );
  }
}
