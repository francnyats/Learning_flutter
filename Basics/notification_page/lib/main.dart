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
        home: Scaffold(
      appBar: AppBar(
        //leading: ,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Notifications'),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Notification Sounds'),
            const SizedBox(
              height: 20,
            ),

//vibrate row
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vibrate'),
                  ],
                ),
                const SizedBox(
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // adaptive SwitchListTile()
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.toggle_on))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
