import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(7),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 238, 248, 243)),
                    child: const Text(
                      'AS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 91, 208, 95)),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AZUKA SOLUTIONS',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: .02),
                      Text('4106722', style: TextStyle(fontSize: 10.0))
                    ],
                  ),
                  const SizedBox(width: 50),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '- KSH. 1,500.00',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: .02),
                        Text(
                          '12:59PM',
                          style: TextStyle(fontSize: 10.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )); //BoxDecoration(color:Colors.amber));
  }
}
