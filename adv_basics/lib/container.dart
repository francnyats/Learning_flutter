import 'package:adv_basics/start_button.dart';
import 'package:adv_basics/image_show.dart';
import 'package:flutter/material.dart';

class MyVeryOwnContainer extends StatelessWidget {
  const MyVeryOwnContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 58, 15, 133),
              Color.fromARGB(255, 118, 82, 218)
            ]),
      ),
      child: const Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 5, bottom: 200, right: 10, left: 10, child: ImageShower()),
            Positioned(
              bottom: 200,
              child: Text(
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  'Learn Flutter the fun way'),
            ),
            Positioned(
              bottom: 125,
              child: StartButton(),
            ),
          ],
        ),
      ),
    );
  }
}
