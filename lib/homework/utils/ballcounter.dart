import 'package:flutter/material.dart';
import 'package:lesson_35/homework/xo.dart';

class Ballcounter extends StatefulWidget {
  const Ballcounter({super.key});

  @override
  State<Ballcounter> createState() => _BallcounterState();
}

class _BallcounterState extends State<Ballcounter> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ("$userPoint"),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          " : ",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ("$compPoint"),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
