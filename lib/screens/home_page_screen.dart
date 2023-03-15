import 'package:flutter/material.dart';

import '../screens/counter_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CounterScreen.routeName);
          },
          child: const Text('Go to Counter Page'),
        ),
      ),
    );
  }
}
