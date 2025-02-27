import 'package:flutter/material.dart';

class ImageShower extends StatelessWidget {
  const ImageShower({super.key});

  @override
  Widget build(context) {
    return Image.asset(
      'assets/assets/images/quiz-logo.png',
      width: 300,
      color: const Color.fromARGB(170, 255, 255, 255),
    );
  }
}
