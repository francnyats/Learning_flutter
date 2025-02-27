import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// class GradientContainer extends StatelessWidget {
//   const GradientContainer(this.color1, this.color2,
//       {super.key}); //Named arguments //const allows for optimization

//   final Color color1;
//   final Color color2;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [color1, color2],
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Lets be optimistic!'),
//       ),
//     );
//   }
// }
// stateful, where data in a widget may change internally
class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key, required this.colors}); //const allows for optimization

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}


// Types of buttons: elevated, outlined, text button

// dynamic variable, undefined even by type
// 'final' and 'const' variable
// 'const' value is firmly locked in
// 'final' fixed but can be deterined later

// Lessons learnt:
// Splitting code across files
// Making re-usable widgets
// final, const, dynamic variables
// Positional and named arguments
// instance variable: var declared inside a class