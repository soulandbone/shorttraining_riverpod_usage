import 'package:flutter/material.dart';

import '../screens/stream_screen.dart';
import '../screens/counter_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CounterScreen.routeName);
            },
            child: const Text('Go to Counter Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(StreamScreen.routeName);
            },
            child: const Text('Go to Stream Page'),
          ),
        ],
      )),
    );
  }
}
