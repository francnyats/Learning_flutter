import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

const List<Color> colors = [
  Color.fromARGB(255, 59, 16, 133),
  Colors.deepPurple
];
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: GradientContainer(
        colors: colors,
      )),
    ),
  );
}

//WE HAVE to expressly define connnections

