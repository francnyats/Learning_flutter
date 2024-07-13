import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';


class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key}); //const allows for optimization
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 51, 15, 136),
            Color.fromARGB(255, 98, 7, 13),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: StyledText()),
    );
  }
}
