import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: const Color.fromARGB(255, 17, 7, 78),
          foregroundColor: const Color.fromARGB(255, 250, 250, 252),
          textStyle: const TextStyle(fontSize: 18)),
      icon: const Icon(Icons.arrow_right_alt),
      label: const Text('Start Learning'),
    );
  }
}
