import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //CONSTRUCTOR: initializes an instance of the class
  @override
  Widget build(BuildContext context) {
    //BUILD method
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// State Object
class _CounterScreenState extends State<CounterScreen> {
  int _count = 0; // This value can change (mutable)

  @override
  Widget build(BuildContext context) {
    print("Widget is being rebuilt"); // This shows the widget gets rebuilt.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You pressed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_count', // Display the count
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++; // Update the state
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
